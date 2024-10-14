<table class="sphinxhide" width="100%">
 <tr width="100%">
    <td align="center"><img src="https://raw.githubusercontent.com/Xilinx/Image-Collateral/main/xilinx-logo.png" width="30%"/><h1>UL3422 Ultra Low Latency Trading</h1>
    </td>
 </tr>
</table>

# UL3422 Design Support

## Overview

This repository provides AMD Alveo  card support including Vivado based reference designs targeting features of the card.


## Reference Designs

Available reference designs are summarized in the following table.  Each reference design includes:

* High-level design overview including attributes, performance, limitations and usage
* Simulation waveform files with waveform descriptions to better understand the design
* Hardware design files along with ILA / VIO configuration files allowing greater control and visibility into the design  

Each reference design is located in their respective sub-directory.

| Reference Design | Summary |
|---|---|
| [Renesas I2C Programming](./Renesas_I2C_Programming/)  | Program the Renesas devices via I2C using a state machine.  Includes script to convert Renesas programming script file to .coe BRAM file format.|
| [QSFP I2C](./QSFP_I2C/)  | Enable QSFP module power planes and side-band signals via I2C interface.|
<!-- | [GTF Latency Benchmark](./GTF_Latency/README.md) | Benchmark design used to measure and report GTF MAC and RAW 10G latency.|
| [FINN Latency Example Design](./FINN_latency/README.md) | Example design which shows how to use a FINN-generated MLP IP block on the ULL |
| [PCIE DDR](./PCIE_DDR/) | DDR I2C and MIG bring-up and validation through PCIe | -->

**TABLE**: Available Reference Designs


### Reference Design Support

The follow links provide support to use the reference designs.

* [Loading a reference design](./Docs/loading_ref_proj.md)
* [Simulating a reference design](./Docs/simulating_a_design.md)
* [Building a reference design](./Docs/building_a_design.md)
* [Programming a reference design to the card](./Docs/programming_the_device.md)


## Supported Cards

The following card is supported by the reference designs in this repository.

* UL3422


## Vivado Design Support

The reference designs require the following Vivado release:

* Vivado ©️ 2023.2

The follow links provide Vivado flow support:

* [Vivado design flow](./Docs/vivado_design_flow.md)
* [UL3422 XDC file](https://github.com/Xilinx/Alveo-Cards/blob/ul3524/QSFP_I2C/XDC/constraint.xdc)

The [Alveo UL Cards Master Release Notes](https://support.xilinx.com/s/article/000035539) provides support resources such as known issues and release notes.  For additional assistance, post your question on the AMD Community Forums – [Alveo Accelerator Card](https://support.xilinx.com/s/topic/0TO2E000000YKXlWAO/alveo-accelerator-cards).


## Hardware Requirements

To program the device from the Vivado HW Manager:

* Micro-B USB cable or
* Alveo Debug Kit (ADK). See [Alveo Accessories](https://www.xilinx.com/products/boards-and-kits/alveo/accessories.html) to purchase.

## Support

For additional documentation, please refer to the [UL3422 product page](https://www.xilinx.com/products/boards-and-kits/alveo/ul3422.html) and the [UL3422 Lounge](https://www.xilinx.com/member/ull-ea.html).

For support, contact your FAE or refer to [support resources](https://support.xilinx.com).


<hr class="sphinxhide"></hr>

<p class="sphinxhide" align="center"><sub>Copyright © 2024 Advanced Micro Devices, Inc.</sub></p>

<p class="sphinxhide" align="center"><sup><a href="https://www.amd.com/en/corporate/copyright">Terms and Conditions</a></sup></p>