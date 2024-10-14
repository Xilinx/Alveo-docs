﻿<table class="sphinxhide">
 <tr>
   <td align="center"><img src="https://www.xilinx.com/content/dam/xilinx/imgs/press/media-kits/corporate/xilinx-logo.png" width="30%"/><h1>Alveo Debug Guide</h1>
   </td>
 </tr>
</table>

# Card Not Recognized
When Alveo™ card(s) are installed and functioning correctly within a host machine, the `lspci` Linux command will correctly identify and report their details.  However, there are times when the card is not recognized by the host OS and `lspci` does not list the card. This section covers techniques to determine the root cause. 


## This Page Covers

This page details scenarios and recommended steps to take when the card is not recognized by the host. If your issue is not covered, please post on the [Xilinx forums](https://support.xilinx.com/s/topic/0TO2E000000YKXlWAO/alveo-accelerator-cards).

Typical causes can be grouped into card and host based issues as given below:
-   Card based
    -  Poorly seated card
    -  Remove [USB cable plugged into a U200/U250/U280](#usb-cable-plugged-into-card)
    -  Card operated out of spec
-   Host based
    -   Bad or incompatible motherboard slot
    -   Slot disabled by host
        -   A missing CPU can cause this
    -   Poorly seated server risers
    -   Other hardware added to the system
    -   BIOS settings

## You Will Need

Before beginning debug, you need to:
- Have [Root/sudo permissions](common-steps.md#root-sudo-access)

## Common Cases

- - -
### Confirm system recognizes cards
The `lspci` command can be used to confirm the system recognizes the card and provides details on all the PCIe buses and devices in the system. The verbose switch (-v) provides greater detail while the device ID switch (-d) filters specific vendors.  For Xilinx, the device ID is `10ee:`. The resulting command is `lspci -vd 10ee:`, refered to as lspci in the document.

Below is an example of the lspci output of an Alveo card recognized by the system.  

```
:~> sudo lspci -vd 10ee:
03:00.0 Processing accelerators: Xilinx Corporation Device 5004
        Subsystem: Xilinx Corporation Device 000e
        Physical Slot: 4
        Flags: bus master, fast devsel, latency 0, NUMA node 0
        Memory at d2000000 (64-bit, prefetchable) [size=32M]
        Memory at d4000000 (64-bit, prefetchable) [size=128K]
        Capabilities: [40] Power Management version 3
        Capabilities: [60] MSI-X: Enable+ Count=33 Masked-
        Capabilities: [70] Express Endpoint, MSI 00
        Capabilities: [100] Advanced Error Reporting
        Capabilities: [1c0] #19
        Capabilities: [400] Access Control Services
        Capabilities: [410] #15
        Kernel driver in use: xclmgmt
        Kernel modules: xclmgmt
```

If no cards are in the system, the output will not display anything as illustrated below.
```
:~> sudo lspci -vd 10ee:
:~>
```


### Card not recognized under `lspci`
There can be many potential causes if a card is not recognized using `lspci`. To narrow the likely causes it is necessary to consider both the host machine and the card.

#### Host machine

- [Check system compatibility](check-system-compatibility.md)
-  If the card is installed in the system, try a [warm reboot](terminology.md#reboot-warm-boot-reset-system).
    - If this fixes the issue, see [Card recognized after warm boot](#card-recognized-after-a-warm-boot) to resolove the underlying cause.
- [Check for unpopulated CPU sockets](common-steps.md#check-for-unpopulated-cpus)
  - The PCIe controller is built into modern CPUs. If there are one or more missing CPUs you may not be able to use all the PCIe slots.  Review the system documentation to determine which slots are usable.

#### Alveo card

Review the following scenarios and see if they apply:
 - Remove [USB cable plugged into a U200/U250/U280 card](#usb-cable-plugged-into-card)
 - [Card is not recognized after using Vivado flow](#vivado-flow)
 - [Card is not recognized after programming a shell or reverting to golden image](#card-not-recognized-after-loading-platform-or-golden-image)
 - [Card recognized at first but not after the machine has been on for a while or while in use](#card-not-recognized-during-operation)

If the above scenarios don't apply, test the card/machine for the following:
- Test the card in another slot in the same machine.  If this works go to [the card is recognized in a another slot in the same machine](#card-is-recognized-in-different-pcie-slot-in-same-machine)
 - Test the card in another machine, if possible, one where other Alveo cards have worked. If the card works, go to [the card works in a another machine](#card-is-recognized-in-another-machine)
 - If another card is available, test in the same slot. If the alternate card is recognized go to [a second Alveo card is recognized in the same slot](#different-alveo-card-is-recognized-in-same-slot)

If none of the above have narrowed down the potential issue:
- [Check the BIOS bifurcation settings](#pcie-bifurcation-setting)
- Look at the LEDs on the card:
  - [Card's blue LED not illuminated](#blue-led-not-illuminated)
  - [Card's red LED is illuminated](#red-led-illuminated)

As a last attempt:
- [Cold boot](terminology.md#cold-boot-power-cycle) the system twice
- [Pull power](terminology.md#shutdown-and-unplug-pull-power)
- Reseat the Alveo card
- Reseat the server risers if applicable
- Bring system back up
- Check to see if the card is recognized

If the issue hasn't been addressed, please post your situation and the steps that you have gone through to the [Xilinx forums](https://support.xilinx.com/s/topic/0TO2E000000YKXlWAO/alveo-accelerator-cards).
- - -
### Vivado flow
This guide does not cover Vivado™ flow debug.

Next steps:
-  You can revert to golden using [AR 71757](https://www.xilinx.com/support/answers/71757.html) to go back to a Vitis™ flow
-  Search for answers on the
[Xilinx forums](https://support.xilinx.com/s/topic/0TO2E000000YKXlWAO/alveo-accelerator-cards)

- - -
### USB cable plugged into card

For cards with a USB port, including U200, U250 and U280, ensure no USB cable is plugged into the card as it will block the FPGA from enumerating on the PCIe bus.

Next steps:
 - Unplug USB cable from the card
- [Cold boot](terminology.md#cold-boot-power-cycle) the system

- - -
### Card recognized after a warm boot

If lspci does not recognize the Alveo card after the machine first powers on, one of the first tests is to perform a warm reboot. If the card is recognized after a warm reboot, this may suggest that there is a BIOS issue.

Before warmboot `sudo lspci -vd 10ee:` does not recognize the installed card.
```
:~> sudo lspci -vd 10ee:
:~>
```
After warmboot, the same lspci command recognizes the installed card.
```
:~> sudo lspci -vd 10ee:
03:00.0 Processing accelerators: Xilinx Corporation Device 5004
        Subsystem: Xilinx Corporation Device 000e
        Physical Slot: 4
        Flags: bus master, fast devsel, latency 0, NUMA node 0
        Memory at d2000000 (64-bit, prefetchable) [size=32M]
        Memory at d4000000 (64-bit, prefetchable) [size=128K]
        Capabilities: [40] Power Management version 3
        Capabilities: [60] MSI-X: Enable+ Count=33 Masked-
        Capabilities: [70] Express Endpoint, MSI 00
        Capabilities: [100] Advanced Error Reporting
        Capabilities: [1c0] #19
        Capabilities: [400] Access Control Services
        Capabilities: [410] #15
        Kernel driver in use: xclmgmt
        Kernel modules: xclmgmt
```

The BIOS can start enumerating devices on the PCIe bus 100ms after the system starts to boot. Sometimes Alveo cards take longer than that to program the static region of the shell containing the PCIe core. Once programmed the card’s PCIe core remains active even during a warm boot. Since a warm boot will cause the BIOS to re-enumerate devices on the PCIe bus, if the Alveo card is recognized, it suggests the BIOS is enumerating before the Alveo card’s PCIe core is active.

Next steps:

- [Disable fastboot](common-steps.md#disable-fastboot)

- - -
### Card not recognized after loading platform or golden image

If the card is no longer recognized after loading a platform or reverting to the golden image, there is an issue with the host to card communication.

Next steps:

- [Cold boot](terminology.md#cold-boot-power-cycle) the system and see if the card is recognized
- [Warm reboot](terminology.md#reboot-warm-boot-reset-system) and see if the card is recognized
    - If so go to [Card recognized after warm boot](#card-recognized-after-a-warm-boot)
- Confirm BIOS is not in [safety mode](#bios-in-safety-mode)
- Try reseating the card and seeing if the host will recognize
- See if the FPGA is seen in [Vivado HW Manager](common-steps.md#vivado-hw-manager)
  - If it can be seen, revert the card to golden [AR 71757](https://www.xilinx.com/support/answers/71757.html)

- - -
### Card not recognized during operation

If the card is no longer recognized by lspci while the machine is on, the card may be overheating, which causes the FPGA to shutdown and no longer detect on the PCIe bus.  Overheating can be caused by not having enough airflow.  See the respective card data sheet for airflow requirements.

 Next steps:

- [Check for an over temperature event in dmesg](common-steps.md#use-system-logs-to-see-if-the-card-exceeded-power-or-thermal-limits)
- [Monitor card power and temperature](common-steps.md#monitor-card-power-and-temperature)
- If there is an over temperature event or if the card is over 90C in xbutil examine
  - [Cold boot](terminology.md#cold-boot-power-cycle) the system
  - Increasing system airflow
    - May need to turn up fan speed
    - May need to close lid
    - May need to check for airflow blocks in system
      - Stray cables
      - Something blocking fan
- If temperatures and electrical limits are good, and the card is no longer recognized while running an application
  - Go to [Application Crash](application-crash.md)

- - -
### Card is recognized in different PCIe slot in same machine

If the card is tested and recognized in a different PCIe slot on the same machine, there is an issue with the intended motherboard slot.

Next steps:

- Ensure [PCIe slot type and speed](common-steps.md#determine-pcie-slot-type-and-speed) match the platform requirements
- [Check for unpopulated CPU sockets](common-steps.md#check-for-unpopulated-cpus)
- Review BIOS settings and see if the BIOS sees the card

- - -
### Card is recognized in another machine

If the card is tested and recognized in a different machine, there is an issue with the intended machine settings.

Next steps:

- Try another PCIe slot
- [Check for unpopulated CPU sockets](common-steps.md#check-for-unpopulated-cpus)
- See if the host has a [New or updated BIOS on the machine](#new-or-updated-bios-on-machine)
- Ensure [PCIe slot type and speed](common-steps.md#determine-pcie-slot-type-and-speed) match the card deployment platform requirements.
- Check airflow

- - -
### Different Alveo card is recognized in same slot

If a different Alveo card is tested and recognized in the same slot, there is an issue with the intended card.

Next steps:

- Confirm card hasn't been used in [Vivado flow](#vivado-flow)
- Look at the LEDs on the card:
  - [Card's blue LED not illuminated](#blue-led-not-illuminated)
  - [Card's red LED is illuminated](#red-led-illuminated)
- See if the FPGA is seen in [Vivado HW Manager](common-steps.md#vivado-hw-manager)
  - If it can be seen, revert the card to golden [AR 71757](https://www.xilinx.com/support/answers/71757.html)
- If the card isn't visible in the Vivado HW Manager navigate to the [Service Portal](https://www.xilinx.com/support.html) and initiate a return request.

- - -
### PCIe bifurcation setting

PCIe bifurcation splits the PCIe link into two (or more) smaller buses. The bifurcation setting can be found in the BIOS. Not all systems support bifurcation.
Alveo platforms detailed in this guide are expecting a non-bifurcated link.  Ensure bifurcation is not enabled.

Next step:
- Refer to manufacture's BIOS documentation to turn off bifurcation.

- - -
### Recent system change
 System changes may impact card/host interoperability. Certain changes may render the card non-functional.

Please refer to the following sections that discuss next steps for different system changes:
  - [Motherboard replacement](#motherboard-replacement)
  - [Riser replacement](#riser-replacement)
  - [Additional card installed in system](#additional-card-installed-in-system)
  - [New or updated BIOS on the machine](#new-or-updated-bios-on-machine)
  - [BIOS setting changed](#bios-settings-changed)
  - [CPU removal](#cpu-removal)
  - [Additional hardware added](#other-hardware-added-since-last-boot)


#### Motherboard replacement
 Next steps:

- Have the technician check the seating of everything touched
  - CPUs
  - Risers
  - Card seating
  - Power cabling
    - Especially PCIe AUX to applicable cards
  - Operation of fans
- Confirm the motherboard has the same
  - Slots
  - BIOS rev
- Bring up the system
- Look at the LEDs on the card:
  - [Card's blue LED not illuminated](#blue-led-not-illuminated)
  - [Card's red LED is illuminated](#red-led-illuminated)
- [Confirm the card is recognized](card-not-recognized.md#confirm-system-recognizes-cards)

#### Riser replacement
 Next steps:

 - Have the technician check the seating of everything touched
  - Risers
  - Card seating
  - Power cabling
    - Especially PCIe AUX to applicable cards
 - Bring up the system
 - Look at the LEDs on the card:
   - [Card's blue LED not illuminated](#blue-led-not-illuminated)
   - [Card's red LED is illuminated](#red-led-illuminated)
 - [Confirm the card is recognized](card-not-recognized.md#confirm-system-recognizes-cards)

#### Additional card installed in system
Next steps:

- Remove the new card
- Confirm the [BIOS is not in safety mode](#bios-in-safety-mode)
- Bring up the system and [Confirm the card is recognized](card-not-recognized.md#confirm-system-recognizes-cards)

#### New or updated BIOS on machine
 Next steps:
- See if there is an AR for this machine and BIOS
- Review manufacture's BIOS change log for changes
  - Fix any changes that are incompatible with Alveo cards
- [Cold boot](terminology.md#cold-boot-power-cycle) the system
- See if [BIOS is not in safety mode](#bios-in-safety-mode)
- Bring up the system and [Confirm the card is recognized](card-not-recognized.md#confirm-system-recognizes-cards)

#### BIOS settings changed
Next steps:
- Review the changes
- Revert any changes that are incompatible with Alveo Cards
- Bring up the system and [Confirm the card is recognized](card-not-recognized.md#confirm-system-recognizes-cards)

#### CPU removal
Next steps:

- [Check for Unpopulated CPUs](common-steps.md#check-for-unpopulated-cpus)
- Move card to a usable slot
- Bring up the system and [Confirm the card is recognized](card-not-recognized.md#confirm-system-recognizes-cards)

#### Other hardware added since last boot
Next steps:

- [Shut down the system and pull power](terminology.md#shutdown-and-unplug-pull-power)
- Remove the new PCIe device(s)
- Reseat the Alveo card
  - Reseat the server risers if applicable
- Bring system back up
- [Confirm the card is recognized](card-not-recognized.md#confirm-system-recognizes-cards)
  - If so progress through card install
  - If not try the card in
    - A different slot
    - A different machine

- - -
### Card not recognized by multiple machines

If the card has been tested in multiple machines and hasn't been recognized in any of them, there may be a shared machine incompatibility or an issue with the card.

 Next steps:
 - If possible, test a card that has been known to work in the same PCIe slot to check if the issue is related to the card or the machines.
- See if the machines are homogenous or heterogeneous
  - If homogeneous
    - Check on missing CPU sockets
    - Review BIOS version and settings
- Look at the LEDs on the card:
  - [Card's blue LED not illuminated](#blue-led-not-illuminated)
  - [Card's red LED is illuminated](#red-led-illuminated)
- See if the FPGA is seen in [Vivado HW Manager](common-steps.md#vivado-hw-manager)
  - If it can be seen, revert the card to golden [AR 71757](https://www.xilinx.com/support/answers/71757.html)

- - -
### Blue LED not illuminated

It the blue LED on the card is not illuminated, the FPGA is not being programmed properly during power on.

Next steps:
- Try the following:
  - [Shut down the system and pull power](terminology.md#shutdown-and-unplug-pull-power)
  - Reseat the Alveo card
  - Reseat the server risers if applicable
  - Bring system back up
  - Check blue LED illuminated
  - Move card to a different slot/Machine and try these steps again
- If the blue LED is still not illuminated, see if the FPGA is seen in [Vivado HW Manager](common-steps.md#vivado-hw-manager)
  - If it can be seen, [revert the card to factory image](common-steps.md#reverting-the-card-to-factory-image)

- - -
### Red LED illuminated

 If the card's red LED is illuminated constantly, there is an issue with the on card power delivery. The card is not usable in this state.

Next steps:

- [Determine if the BIOS is in safety mode](#bios-in-safety-mode)
- If the BIOS is not in safety mode, try the following:
  - [Shut down the system and pull power](terminology.md#shutdown-and-unplug-pull-power)
  - Reseat the Alveo card
  - Reseat the server risers if applicable
  - Bring system back up
  - Check if the red LED is out
- If the red LED continues to be illuminated, navigate to the Service Portal on [xilinx.com](https://www.xilinx.com/support.html) and initiate a return request.

- - -
### BIOS in safety mode

If the card's red LED is illuminated and the system is exhibiting some or all of these other symptoms:

 - Lower resolution on video cards
 - Computer fans in full speed safe mode
 - USB devices may not work

 - The BIOS is failing train (establish a PCI link) with the Alveo card

Next step:

- Refer to manufacture's BIOS documentation to address

- - -

### Xilinx Support

For additional support resources such as Answers, Documentation, Downloads, and Alerts, see the [Xilinx Support pages](http://www.xilinx.com/support). For additional assistance, post your question on the Xilinx Community Forums – [Alveo Accelerator Card](https://support.xilinx.com/s/topic/0TO2E000000YKXlWAO/alveo-accelerator-cards). 

Have a suggestion, or found an issue please send an email to alveo_cards_debugging@xilinx.com .

### License

All software including scripts in this distribution are licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License.

You may obtain a copy of the License at
[http://www.apache.org/licenses/LICENSE-2.0](http://www.apache.org/licenses/LICENSE-2.0)

All images and documentation, including all debug and support documentation, are licensed under the Creative Commons (CC) Attribution 4.0 International License (the "CC-BY-4.0 License"); you may not use this file except in compliance with the CC-BY-4.0 License.

You may obtain a copy of the CC-BY-4.0 License at
[https://creativecommons.org/licenses/by/4.0/]( https://creativecommons.org/licenses/by/4.0/)


Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.

<p align="center"><sup>XD027 | &copy; Copyright 2021 Xilinx, Inc.</sup></p>