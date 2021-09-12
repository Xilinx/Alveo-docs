﻿<table class="sphinxhide">
 <tr>
   <td align="center"><img src="https://www.xilinx.com/content/dam/xilinx/imgs/press/media-kits/corporate/xilinx-logo.png" width="30%"/><h1>Alveo Debug Guide</h1>
   </td>
 </tr>
</table>

# Card Validation

XRT provides the `xbutil` utility which validates [card installation](card-install.md) using the `xbutil validate` command. It checks proper power connection, PCIe connection, SC version, as well as running bandwidth tests. Full details on this command can be found in the [Vitis Documentation](https://www.xilinx.com/html_docs/xilinx2020_2/vitis_doc/xbutilutility.html#fpx1536961754904). If validation fails, indicated by `ERROR: Some cards failed to validate.` the errors need to be addressed before the card can be used.

## This Page Covers

This page covers issues encountered when using `xbutil validate`. If your issue is not covered, please post on the [Xilinx forums](https://forums.xilinx.com/t5/Alveo-Accelerator-Cards/bd-p/alveo).

## You Will Need

Before beginning debug, you need to:

- Ensure the card, XRT, and the deployment packages are installed as part of the [card install](card-install.md)
- Check that the [platform and SC version on the card match the platform and SC version on the system](common-steps.md#determine-platform-and-sc-on-card-and-system)
- Determine any failure mode(s) from running `xbutil validate`

## Common Cases

### Loading verify kernel error

If `[XRT] ERROR: Xclbin on card is in use` or `ERROR: XMC is not ready` is seen when running `xbutil validate`, there may be a SC issue or a driver disconnect.


 ```
 xbutil validate
 INFO: Found 1 cards

 INFO: Validating card[0]: xilinx_u50lv_gen3x4_xdma_base_2
 INFO: == Starting Kernel version check:
 INFO: == Kernel version check PASSED
 ...
 INFO: == Starting verify kernel test:
 XRT build version: 2.6.646
 Build hash: a6d38d37b4c565b5c8fc93ad232ca5508153a264
 Build date: 2020-05-20 18:09:18
 Git branch: 2020.1
 PID: 13863
 UID: 0
 [Mon Jun 1 09:02:00 2020]
 HOST: xcoswappshp385-2
 EXE: /opt/xilinx/xrt/bin/unwrapped/xbutil
 [XRT] ERROR: Xclbin on card is in use, can't change.
 [XRT] ERROR: See dmesg log for details. err=-16
 ERROR: Failed to download xclbin: verify.xclbin
 ERROR: == verify kernel test FAILED
 INFO: Card[0] failed to validate.

 ERROR: Some cards failed to validate.
 ```

Next steps:

- Warm boot the machine
- Run `xbutil validate`
- If issues persist
  - Run `xbmgmt flash --scan --verbose`
  - See the resulting output is covered in [SC troubleshooting](sc-troubleshooting.md)

---

### Convert parameter error

Before XRT 2020.1 PU1, `xbutil validate` depended on Python 2.7 plus some support packages. If you observe `Error Exception: argument 1: <type 'exceptions.TypeError'>: Don't know how  to convert parameter 1` as shown below, the packages have not been installed as needed.

```
~> xbutil validate
INFO: Found 1 cards
INFO: Validating card[0]: xilinx_u200_xdma_201830_2
INFO: == Starting AUX power connector check:
INFO: == AUX power connector check PASSED
INFO: == Starting PCIE link check:
INFO: == PCIE link check PASSED
INFO: == Starting verify kernel test:
Host buffer alignment 4096 bytes
Compiled kernel = /opt/xilinx/dsa/xilinx_u200_xdma_201830_2/test/verify.xclbin
Error
Exception:
argument 1: <type 'exceptions.TypeError'>: Don't know how to convert parameter 1
FAILED TEST
ERROR: == verify kernel test FAILED
INFO: Card[0] failed to validate.
ERROR: Some cards failed to validate.
```

Next steps:

- Upgrade to XRT version 2020.1_pu1 or later by following [XRT update directions](modifying-xrt-platform.md#installing-an-xrt-update)
- If it is necessary to use an older XRT version, follow solution outlined in [AR 73055](https://www.xilinx.com/support/answers/73055.html)

---

### Memory bandwidth test fails

 Before XRT 2020.1 PU1, `xbutil validate` depended on Python 2.7 and support packages. If you observe errors with a `.py` file, `pyopenCL`, or `numpy` as shown below, there is an issue with those packages.

```
 xbutil validate
INFO: Validating card[0]: xilinx_u200_xdma_201830_2
....
INFO: == DMA test PASSED
INFO: == Starting device memory bandwidth test:
ImportError: No module named _multiarray_umath
Traceback (most recent call last):
  File "/opt/xilinx/xrt/test/23_bandwidth.py", line 1, in <module>
    import pyopencl as cl
  File "/usr/lib64/python2.7/site-packages/pyopencl/__init__.py", line 39, in <module>
    import pyopencl._cl as _cl
ImportError: ImportError: numpy.core.multiarray failed to import

ERROR: == device memory bandwidth test FAILED
INFO: Card[0] failed to validate.

ERROR: Some cards failed to validate.

```

or

```
 xbutil validate
 INFO: Validating card[0]: xilinx_u250_xdma_201830_2
 ...
 INFO: == DMA test PASSED
 INFO: == Starting device memory bandwidth test:
 Traceback (most recent call last):
   File "/opt/xilinx/xrt/test/23_bandwidth.py", line 20, in <module>
     import pyopencl as cl
   File "/usr/local/lib/python2.7/dist-packages/pyopencl/__init__.py", line 33, in <module>
     import pyopencl.cltypes  # noqa: F401
   File "/usr/local/lib/python2.7/dist-packages/pyopencl/cltypes.py", line 24, in <module>
     from pyopencl.tools import get_or_register_dtype
   File "/usr/local/lib/python2.7/dist-packages/pyopencl/tools.py", line 38, in <module>
     from pytools import memoize, memoize_method
   File "/usr/local/lib/python2.7/dist-packages/pytools/__init__.py", line 249
     __slots__: List[str] = []
              ^
 SyntaxError: invalid syntax

 ERROR: == device memory bandwidth test FAILED
 INFO: Card[0] failed to validate.

 ERROR: Some cards failed to validate.
```

This could be due to modules being out of date, incompatible versions installed, multiple versions of python or modules exist, or required modules (such as setuptools or numpy) missing. XRT releases now use python3 without needing numpy or pyopencl.

Next steps:

- Upgrade to XRT version 2020.1_pu1 or later by following [XRT update directions](modifying-xrt-platform.md#installing-an-xrt-update)
- Or go to [AR 75294](https://www.xilinx.com/support/answers/75294.html)

---

### Hangs at start of validate test

If `xbutil validate` output has paused at `INFO: == Starting verify kernel test:` for more than a minute and the test is not displaying any progress, the kernel was not successfully loaded and the `xbutil validate` has hung.

Example Output:

```
xbutil validate
INFO: Validating card[0]: xilinx_u280_xdma_201920_3
INFO: == Starting AUX power connector check:
AUX power connector not available. Skipping validation
INFO: == AUX power connector check SKIPPED
INFO: == Starting PCIE link check:
INFO: == PCIE link check PASSED
INFO: == Starting SC firmware version check:
INFO: == SC firmware version check PASSED
INFO: == Starting verify kernel test:

```

Next step:

- Follow the steps in [Loading verify kernel error](card-validation.md#loading-verify-kernel-error)

---

### Loading bandwidth kernel error

 If you observere `ERROR: Failed to download xclbin:` when running `xbutil validate`, it means XRT can not program the FGPA with the kernel needed for the test.

```
INFO: == DMA test PASSED
INFO: == Starting device memory bandwidth test:
ERROR: Failed to download xclbin: bandwidth.xclbin
ERROR: == device memory bandwidth test FAILED
INFO: Card[0] failed to validate.

ERROR: Some cards failed to validate.
 ```

Next step:

- Follow the steps in [Loading verify kernel error](card-validation.md#loading-verify-kernel-error)

---

### Verify kernel test skipped

For DFX-2RP platforms such as u250_gen3x16_base_3, `xbutil validate` command will display the message `INFO: == verify kernel test SKIPPED`, as shown below, if the shell partition has not been first been loaded.  For DFX-2RP platforms, the base partition needs to be flashed and the shell needs to be loaded prior to running an application, including the `xbutil validate` application.

```
 xbutil validate
INFO: Found 1 cards

INFO: Validating card[0]: xilinx_u250_gen3x16_base_3
INFO: == Starting Kernel version check:
INFO: == Kernel version check PASSED
INFO: == Starting AUX power connector check:
INFO: == AUX power connector check PASSED
INFO: == Starting Power warning check:
INFO: == Power warning check PASSED
INFO: == Starting PCIE link check:
INFO: == PCIE link check PASSED
INFO: == Starting SC firmware version check:
INFO: == SC firmware version check PASSED
INFO: == Starting verify kernel test:
Verify xclbin not available. Skipping validation.
INFO: == verify kernel test SKIPPED
INFO: Card[0] validated successfully.
 ```

Next step:

- Load the shell partition before running an application.  See [AR 75975](https://www.xilinx.com/support/answers/75975.html) details.

---

### Different python versions for user and root

In some cases, you may have different python versions for user and for root, as shown below.  This can lead to odd behaviors with the driver.

```
~]$ python --version
Python 2.7.5
~]$ sudo python --version
Python 3.6.2
 ```

Next steps:

- Reconcile your python environment or
- Use `sudo su` to become root before running card commands

---

### PCIe link check PASSED with warning

If you encounter `PCIE link check PASSED with warning` or `Device trained to lower spec` when running `xbutil validate`, XRT is encountering a PCIe link running slower than the platform limit. Examples of these warnings are shown below.

```
...
INFO: == Starting PCIE link check:
LINK ACTIVE, ATTENTION
Ensure Card is plugged in to Gen3x16, instead of Gen3x8
Lower performance may be experienced
WARN: == PCIE link check PASSED with warning
INFO: == Starting SC firmware version check...
```

```
$ INFO: Validating device[0]:
INFO: Checking PCIE link
status: FAILED WARNING: Device trained to lower spec. Expect:
Gen3x16, Current: Gen2x16
```

Next steps:

- Ensure that the card is in a slot that supports the PCIe link speed, follow the [Determine PCIe slot type and speed](common-steps.md#determine-pcie-slot-type-and-speed) step
- If the card is in a full speed slot:
  - Reseat the card, in a different slot if possible
  - Reboot the server
  - Run `xbutil validate`
  - If issues persist go to next step
- BIOS may be limiting link speed

There are typically BIOS settings to control PCIe Generation (aka link speed). Many BIOSes support limiting a a card to PCIe Gen 1, Gen 2, or Gen 3. The menu structure differs from vendor to vendor and may differ between servers and workstations. Please refer to the manufacturer's documentation for information on your BIOS settings.

- Go into the BIOS and confirm link speed is PCIe Gen3 or higher
  - If the BIOS needed changes, cold boot and confirm link speed

---

### SC firmware mismatch error

The platform installed on the host has a different SC firmware version than installed on the card.

```
xbutil validate
INFO: Validating card[0]: xilinx_u200_xdma_201830_2
INFO: == Starting AUX power connector check:
INFO: == AUX power connector check PASSED
INFO: == Starting PCIE link check:
INFO: == PCIE link check PASSED
INFO: == Starting SC firmware version check:
SC FIRMWARE MISMATCH, ATTENTION
SC firmware running on board: 1.8. Expected SC firmware from installed Shell: 4.2.0
Please use "xbmgmt flash --scan" to check installed Shell.
WARN: == SC firmware version check PASSED with warning
.....
```

Next steps:

- Use `sudo xbmgmt flash --scan` to check the SC version on the system vs on the card
- [Flash the card with the deployment platform](common-steps.md#flash-the-card-with-a-deployment-platform) a second time to update the card's SC version to match the system

---

### AUX power not connected error

For cards supporting >75W power, `xbutil validate` will display the following warning if the PCIe AUX power is not connected or not delivering power.  Cards such as the U200/U250/U280 require the PCIe AUX power connected when running applications in the Vitis™ flow.

Example of intial output after running `xbutil validate`.

```
 ~]$ xbutil validate
INFO: Found 1 cards
INFO: Validating card[0]: xilinx_u280_xdma_201920_3
INFO: == Starting Kernel version check:
INFO: == Kernel version check PASSED
INFO: == Starting AUX power connector check:
AUX POWER NOT CONNECTED, ATTENTION
Board not stable for heavy acceleration tasks.
WARN: == AUX power connector check PASSED with warning
.....
```

Next steps:

- Confirm AUX power cable is hooked up
  - Shut down system
  - [Pull power](terminology.md#shutdown-and-unplug-pull-power)
  - Check for the presence of an AUX power cable at the card
    - UG1301 Figures 4 and 5 show the location of the AUX power connector on card
    - If there is no cable, find an 8-pin cable and check the server connection
  - If cable is present
    - Remove the cable from card
    - Confirm it is an 8 pin PCIe AUX power connector
    - Reseat cable
    - Confirm there is a good connection at the motherboard side
  - Close up the system
  - Reboot
  - Confirm power is good by running the following command
  `xbutil validate -d <card BDF>`
  - If power is not seen move to next step:

- Look at the card power sensor values

The card has built in voltage and current sensors, to display the output from these sensors, use `xbutil query`.

- 12V AUX should show a value of 12000 +/- 5%
  - The range is 11400 → 12600
- If AUX power is within range, re-run `xbutil validate`
- If AUX power is not within range double check cable seating
- If the 12V PEX or 12V AUX voltages are 0 there is a communication issue between the SC and CMC, go to [SC troubleshooting](sc-troubleshooting.md)

The following show `xbutil query` outputs for card with and without AUX power connected.

`xbutil query` output for card with AUX power connected

```
Electrical(mV|mA)
12V PEX         12V AUX         12V PEX Current 12V AUX Current
12107           12103           1579            1414
```

`xbutil query` output for card without AUX power connected

```
Electrical(mV|mA)
12V PEX         12V AUX         12V PEX Current 12V AUX Current
12384           450             1636            20
```

---

### AUX power connector not available

For cards without AUX power connections, the following information message will be displayed when running `xbutil validate`.

```
~]$ xbutil validate
INFO: Found 1 cards

INFO: Validating card[0]: xilinx_u50_gen3x16_xdma_201920_3
INFO: == Starting Kernel version check:
INFO: == Kernel version check PASSED
INFO: == Starting AUX power connector check:
AUX power connector not available. Skipping validation
INFO: == AUX power connector check SKIPPED
```

This message is normal and is for informational purposes only.

---

### xclmgmt driver issues

If the following error is displayed when running `xbutil validate`, it suggests the management driver is not working correctly.

```
HOST: xcoswappshp385-2
EXE: /opt/xilinx/xrt/bin/unwrapped/xbutil
[XRT] ERROR: Can't reach out to mgmt for xclbin downloading
[XRT] ERROR: Is xclmgmt driver loaded? Or is MSD/MPD running?
[XRT] ERROR: See dmesg log for details. err=-110
ERROR: Failed to download xclbin: verify.xclbin
ERROR: == verify kernel test FAILED
```

Next steps:

- See if the machine is running a [supported hypervisor](common-steps.md#host-machine-and-hypervisor-information)
- Check to see if the drivers are present with
  - `lsmod | grep xclmgmt`
  - `lsmod | grep xocl`
- [Unload/reload XRT drivers](common-steps.md#unload-reload-xrt-drivers)
- See if a similar issue is posted on [Xilinx forums](https://forums.xilinx.com/t5/Alveo-Accelerator-Cards/bd-p/alveo)

---

### P2P BAR is not enabled

If `P2P BAR is not enabled. Skipping validation` is displayed when running `xbutil validate`, it implies P2P has not been enabled.

```
xbutil validate
INFO: Found 1 cards

INFO: Validating card[0]: xilinx_u50_gen3x16_xdma_201920_3
INFO: == Starting Kernel version check:
...
INFO: == Starting PCIE peer-to-peer test:
P2P BAR is not enabled. Skipping validation
INFO: == PCIE peer-to-peer test SKIPPED
...
```

Next step:

- Go to [Enable P2P](https://xilinx.github.io/XRT/master/html/p2p.html) if the application requires P2P.

---

### M2M is not available

If `M2M is not available. Skipping validation` is displayed when running `xbutil validate`, it implies M2M has not been enabled.

```
xbutil validate
INFO: Found 1 cards

INFO: Validating card[0]: xilinx_u50_gen3x16_xdma_201920_3
INFO: == Starting Kernel version check:
...
INFO: == Starting memory-to-memory DMA test:
M2M is not available. Skipping validation
INFO: == memory-to-memory DMA test SKIPPED
...
```

Next step:

- Go to [Enable M2M](https://xilinx.github.io/XRT/master/html/m2m.html) if the application requires M2M.

---

### Unsupported Linux kernel version

If an unsupported kernel is installed, the following message will be displayed when running `xbutil validate`.

```
 ...
INFO: == Starting Kernel version check:
WARNING: Kernel verison 5.4.0-47-generic is not officially supported. 5.3.0 is the latest supported version
WARN: == Kernel version check PASSED with warning
...
```

Next step:

- The kernel is not officially supported or tested - review [UG1451](https://www.xilinx.com/search/site-keyword-search.html#q=ug1451) for supported operating systems.

---

### Failed to find xclbin

If the following message is displayed when running `xbutil validate` it suggests there is an issue with the installed deployment package.

```
ERROR: Failed to find xclbin in /opt/xilinx/firmware
ERROR: Failed to find 22_verify.py or verify.xclbin, Shell package not installed properly.
ERROR: == verify kernel test FAILED
```

Next steps:

- [Determine packages installed on the system](common-steps.md#determine-xrt-packages-using-the-package-manager)
- Follow package install steps in [Modifying existing XRT or platform install](modifying-xrt-platform.md)

---

### Incorrect output from kernel

There maybe an issue reading on card memory if an `Incorrect output from kernel` message is displayed when running `xbutil validate`.

```
...
INFO: == Starting verify kernel test:
Host buffer alignment 4096 bytes
Compiled kernel = /opt/xilinx/dsa/xilinx_u200_xdma_201830_3/test/verify.xclbin
Shell = b'xilinx_u200_xdma_201830_3'
Index = 0
PCIe = GEN3 x 16
OCL Frequency = (300, 500) MHz
DDR Bank = 4
Device Temp = 38 C
MIG Calibration = True
Finished downloading bitstream /opt/xilinx/dsa/xilinx_u200_xdma_201830_3/test/verify.xclbin
CU[0] b'hello:hello_1' @0x1800000
[0] b'bank0' @0x4000000000
[1] b'bank1' @0x5000000000
Original string = []
Original string = []
Issue kernel start requests
Now wait for the kernels to finish using xrtRunWait()
Get the output data produced by the 2 kernel runs from the device
Result string = [Hello Worl]
Result string = [Hello World]
Incorrect output from kernel
FAILED TEST
...
```

Next steps

- [Return card to golden](common-steps.md#reverting-the-card-to-factory-image)
- [Reflash the deployment platform](common-steps.md#flash-the-card-with-a-deployment-platform)

---

### xbmgmt commands not working

If `xbmgmt` commands are not working and there are no errors displayed, it may indicate an error with the XRT installation package.

Next Step:

- Reinstall the XRT package.

---

### Failed to find Xilinx platform

If XRT fails to find the Xilinx platform as shown below, the `setup.sh` script has not been sourced.

```
Error: Failed to find Xilinx platform
```

Next step:

- Run the following command: `source /opt/xilinx/xrt/setup.sh`

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