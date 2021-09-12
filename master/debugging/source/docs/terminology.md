﻿<table class="sphinxhide">
 <tr>
   <td align="center"><img src="https://www.xilinx.com/content/dam/xilinx/imgs/press/media-kits/corporate/xilinx-logo.png" width="30%"/><h1>Alveo Card Debug Guide</h1>
   </td>
 </tr>
</table>

# Terminology

This page provides definitions of various terms used throughout the [Alveo Debug Guide](../README.md).

## This Page Covers

This page defines terms used throughout the guide.

### Host Terms

- [Reboot/Warm boot/Reset system](#reboot-warm-boot-reset-system)
- [Cold boot/Power cycle](#cold-boot-power-cycle)
- [Shutdown and unplug/Pull power](#shutdown-and-unplug-pull-power)
- [PCIe](#pcie)
- [BIOS](#bios)
- [BMC](#bmc)

### Alveo Terms

- [Xilinx Runtime library (XRT)](#xrt)
- [Satelite Controller (SC)](#sc)
- [Card Management Controller (CMC)](#cmc)
- [Alveo programming cable](#alveo-programming-cable)
- [Golden/Factory image](#golden-factory-image)
- [Reseat an Alveo card](#reseat-an-alveo-card)

## Terms

### XRT

[Xilinx Runtime library (XRT)](https://xilinx.github.io/XRT/master/html/platforms.html) is the open source software stack that provides drivers and utilities to enable acceleration solutions for Alveo cards.

---

### SC

The satellite controller (SC) is a realtime support processor on the Alveo card that provides card management in-band (XRT) and OOB communication mechanisms for the server [BMC](#bmc).

The SC, [CMC](#cmc), and XRT communicate to

- Monitor card status
- Communicate with the server BMC
- On some cards, provides protections for over temp or over power conditions
- Program a kernel (xclbin) onto a card
- On newer cards, like the U50, the SC needs to enable the FPGA power rails

Shown in the center of the [Alveo system diagram](alveo-system.md#alveo-system-diagram) in green.

---

### CMC

The card management controller (CMC) is a microblaze running in the platform and handles FPGA features including communication with XRT.

XRT only communicates directly with the CMC. CMC ↔ SC communication allows XRT to:

- Report sensor values
- Load a xclbin
- Flash the card

Shown inside the FPGA block in the [Alveo system diagram](alveo-system.md#alveo-system-diagram).

CMC was previously referred to as XMC and may show up in some XRT messaging.

---

### XMC

XMC is a deprecated name for the CMC. See [CMC](#cmc).

---

### BMC

Baseboard management controller (BMC) is a found on server motherboards to allow remote monitoring and system administration.

For supported servers this allows for remote system administration, including the following:

- System power and temperature monitoring
- Remote power control
- Remote terminal through web browser

This can be productized on supported servers as a part of a feature like the Dell iDRAC or HP iLO out-of-band management products.

---

### Alveo Card Programming Cable

A special cable that allows the you to interact with the FPGA for certain cards, like the U50 card.

Provides micro-USB support from a host PC to the Alveo card maintenance connector. The Alveo Programming Cable can be ordered as an accessory from [Alveo accessories](https://www.xilinx.com/products/boards-and-kits/alveo/accessories.html). See the [Alveo Programming Cable Guide](https://www.xilinx.com/support/documentation/boards_and_kits/accelerator-cards/ug1377-alveo-programming-cable-user-guide.pdf) for details.

---

### Reboot/Warm Boot/Reset System

Rebooting the system without interrupting power via CTRL+ALT+Del or sudo reboot.

This resets the OS and drivers but does not remove power from the PCIe main bus and the PCIe Auxiliary power bus. The FPGA on the card retains its current base image however the xclbin and DFX-2RP shells will need to be reloaded.

---

### Cold Boot/Power Cycle

Shut down the system via the power button or the shutdown command.

This removes power from the CPU, main PCIe bus, and the FPGA on the Alveo card, clearing its state. It does not remove power from the lower power PCIe Auxiliary bus and the Satellite controller on the Alveo Card remains powered on. The FPGA shell on the Alveo card needs to be reloaded.

---

### Shutdown and Unplug/Pull Power

Initiate a cold boot. Once the system is down completely remove power.  Unplugging the system from external power.

This removes power from the CPU, main PCIe bus and lower PCIe Auxiliary bus and is required to install, remove, or reseat an Alveo card. It also power-down the Satellite Controller. Due to capacitive power in some power supplies, the power must remain unplugged for 3-5 minutes.

Pulling power is an easy way to try to reset the SC.

---

### Golden/Factory Image

The term golden image or factory image refers to the card's original configuration when shipped.

When changing platforms or XRT versions, it may be necessary to revert the card to it's [golden/factory image](common-steps.md#reverting-the-card-to-factory-image).

---

### Reseat an Alveo Card

Pull the Alveo card out of a PCIe slot and putting it back into the same slot in the same machine.

This can help check for a bad connection between the contacts on the bottom of an Alveo card and the motherboard.

Before reseating an Alveo card it is necessary to [Shutdown and unplug/Pull power](#shutdown-and-unplug-pull-power) to the machine.

---

### PCIe

PCI Express bus.

This the bus on the motherboard the Alveo cards use to talk with the host computer.

---

### BIOS

Firmware used during system boot to initialize the computer hardware.

---


### Xilinx Support

For additional support resources such as Answers, Documentation, Downloads, and Alerts, see the [Xilinx Support pages](http://www.xilinx.com/support). For additional assistance, post your question on the Xilinx Community Forums – [Alveo Accelerator Card](https://forums.xilinx.com/t5/Alveo-Accelerator-Cards/bd-p/alveo).

If you have a suggestion, or find an issue, send an email to alveo_cards_debugging@xilinx.com .

### License

All software including scripts in this distribution are licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License.

You may obtain a copy of the License at
[http://www.apache.org/licenses/LICENSE-2.0](http://www.apache.org/licenses/LICENSE-2.0)

All images and documentation, including all debug and support documentation, are licensed under the Creative Commons (CC) Attribution 4.0 International License (the "CC-BY-4.0 License"); you may not use this file except in compliance with the CC-BY-4.0 License.

You may obtain a copy of the CC-BY-4.0 License at
[https://creativecommons.org/licenses/by/4.0/](https://creativecommons.org/licenses/by/4.0/)


Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.

<p align="center"><sup>XD027 | &copy; Copyright 2021 Xilinx, Inc.</sup></p>