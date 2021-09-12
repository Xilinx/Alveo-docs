﻿<table class="sphinxhide">
 <tr>
   <td align="center"><img src="https://www.xilinx.com/content/dam/xilinx/imgs/press/media-kits/corporate/xilinx-logo.png" width="30%"/><h1>Alveo Debug Guide</h1>
   </td>
 </tr>
</table>

# Power Delivery

This page will help guide you through steps to enure that your Alveo™ card can work in a system under load.

## This Page Covers

Testing the power delivery to one or more Alveo cards

Xilinx has two test tools, `xbutil validate` and `xbtest`.

- The `xbutil validate` is an XRT utility that does basic checks to determine the card is installed and operating correctly. It does not test the power envelope.  See [Card Validation](card-validation.md) for additional details. 
- The `xbtest` provides extra card testing via different a host application and additional test kernels. This application will load up the FPGA to test on card memory, host/card power delivery, and cooling. This test can help determine if the system is stable while the card is running accleration tasks.  See the [xbtest solutions page](https://www.xilinx.com/products/acceleration-solutions/xbtest.html) for details.

## You Will Need

- A [Compatible host system](check-system-compatibility.md)
- One or more alveo cards
- [Root/sudo permissions](common-steps.md#root-sudo-access)

Before starting to test the card, gather data

1. [Check system compatibility](check-system-compatibility.md)
2. Based on your cards and OS download the correct version of xbtest from [xbtest solutions page](https://www.xilinx.com/products/acceleration-solutions/xbtest.html).
3. Run `xbutil validate` and review the output to confirm the card is operating normally.
   - If there are errors go to [Card Validation](card-validation.md) and resolve.
4. Confirm card(s) are compatible with the host machine
   - [Determine if the card is active or passive](common-steps.md#determine-active-or-passive-card)
   - Only test a passive card in server system with enough airflow.
   - If a passive card is not in a [qualified host and card combination](https://www.xilinx.com/products/boards-and-kits/alveo/qualified-servers.html), you may need to maunally increase server airflow by turning up the fan speed for the tests to pass.

## Common Cases

### A U200, U250, or U280 has less than 225W power

The U200, U250, and U280 cards require 225W power to run Vitis™ acceleration loads and  `xbtest`. If `Max power level:` is < 225W the server will not provide the power needed for the test.  

You can confirm the maximum power level by using `xbmgmt flash --scan --verbose` as given below.  In this example, the card has insufficient power.

```
sudo /opt/xilinx/xrt/bin/xbmgmt flash --scan --verbose
Card [0000:03:00.0]
    Card type:          u250
    Flash type:         SPI
    Flashable partition running on FPGA:
        xilinx_u250_xdma_201830_3,[ID=0x5eeb5a43],[SC=4.3.9]
...
    Max power level:            150W
```

What to look for:

- Look for the value reported by `Max power level:`
- Should be `225W` for U200, U250, and U280 cards being used in Vitis flows

Next steps:

- Delay testing until sufficient power.
- Safely hook up 8 pin AUX power, see the [Card installation guide](card-install.md)  

---

### Card is in a suitable machine

Alveo cards have two different cooling solutions

- Actively cooled - the card has a fan intended to cool the card in a workstation
- Passively cooled - the card depends on host chassis airflow for cooling.

Passivley cooled cards should only be placed in a server with sufficient airflow.

```
~> sudo /opt/xilinx/xrt/bin/xbmgmt flash --scan --verbose
Card [0000:03:00.0]
    Card type:          u250
    Flash type:         SPI
    Flashable partition running on FPGA:
        xilinx_u250_xdma_201830_3,[ID=0x5eeb5a43],[SC=4.3.9]
    Flashable partitions installed in system:
        xilinx_u250_xdma_201830_3,[ID=0x5eeb5a43],[SC=4.3.9]
...
    Fan presence:        P
```

What to look for:

- Look for the value reported by Fan presence:

Meaning:

- `Fan presence: A` means the card has a fan and is suitable for use in a workstation
- `Fan presence: P` means the card depends on server fans for cooling

Next steps:

- For active cards go to [xbtest for testing power](power-delivery.md#xbtest-for-testing-power) below
- For passive cards confirm the following:
  - Server airflow meets card rquirements
    - You can damage the card if there is not enough airflow
  - Lid will be on the server for testing
  - Go to [xbtest for testing power](power-delivery.md#xbtest-for-testing-power)

---

### Shell not listed in xbtest downloads below

See [xbtest solutions page](https://www.xilinx.com/products/acceleration-solutions/xbtest.html) for supported plaforms.  To run xbtest, ensure the [platform running on the card and system](common-steps.md#determine-platform-and-sc-on-card-and-system) is supported.

If the platform is not supported you need to update the system and card with a supported platform.

Next steps:

- Download one of the supported platforms from the [Alveo landing page](https://www.xilinx.com/products/boards-and-kits/alveo.html)
- Follow installation directions for [modifying a XRT install](modifying-xrt-platform.md) making sure XRT and xbtest both support the platform.

---

### Card or system crashes during test

If the card overheats or uses more power that the system provides the test application, card, or system could crash.

Next Steps:

- [Monitor the power and temperature](common-steps.md#monitor-card-power-and-temperature) to make sure the card is operating within temperature and power limits.

---

### xbtest xclbin fails to load

The xbtest tests consist of a known good application and a set of known good accelerators, in xclbin format, that run on the card. If the accelerator fails to load, the test will fail with an error

- `Gen_029` message indicating the xclbin is not compatible with the platform on the card

The message can be seen in the example below:

```
~]$ xbtest -c power -d 0
INFO     : GENERAL      : GEN_016: Scanning xbtest libraries...
FAILURE  : GENERAL      : GEN_029: Could not find an xclbin compatible with target device at device index 0,
identified by interface_uuid = 4cda0ba9ab64b59c535adadf2e0b1930
```

Meaning:

- There is a xbtest/platform mismatch

Next Steps:

- Confirm the you are testing the right card and platform
- Re-install the development platform for the card from the [Alveo landing page](https://www.xilinx.com/products/boards-and-kits/alveo.html)

## Appendix

### xbtest for Testing Power

The xbtest stress test syntax changes from release to release. A version 4 cheat sheet follows:

- Install xbtest following the directions in 1361
- `source /opt/xilinx/xrt/setup.(c)sh`
- `source /opt/xilinx/xbtest/setup.(c)sh`
- Use `xbutil list` to determine the card device ID for the card
- Run the predefined stress test with- `xbtest -c stress -d (device ID)`
  > **Note**: xbtest version 4 still uses device ID syntax (for example:`-d 3`). It does not accept card BDF syntax (for example:`-d a3:00.0`)
- The test will ramp up the toggle rate, increasing power. As the test runs xbtest will report card temperature and power

```
STATUS   : POWER        : PWR_045:       94 sec. remaining; 76C; Power: raw 47.5W; Toggle Rate: 40.0%
STATUS   : POWER        : PWR_045:       93 sec. remaining; 76C; Power: raw 47.5W; Toggle Rate: 40.0%
```

- [Monitor power and temperature](common-steps.md#monitor-card-power-and-temperature)
- Interrupt the test with `CTRL+C` if card temperature goes over 95C or if the temperature suddenly falls.
- At the end there will be a test pass or fail.
  - A test pass shows card is good for acceleration loads.
  - A failure indicates there may be an issue, follow normal escalation procedures.
- For more details download and review the User Guide from the [xbtest solutions page](https://www.xilinx.com/products/acceleration-solutions/xbtest.html).

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