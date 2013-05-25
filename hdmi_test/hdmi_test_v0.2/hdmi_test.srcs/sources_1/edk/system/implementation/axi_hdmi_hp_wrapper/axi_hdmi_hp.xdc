# Global timing constraints for AXI Interconnect axi_hdmi_hp:
set_false_path -through [get_ports "INTERCONNECT_ARESETN"]
set INTERCONNECT_ACLK [get_clocks -of_objects [get_ports INTERCONNECT_ACLK]]
set xbar_period MISSING_CLOCK_ON_INTERCONNECT_ACLK
set xbar_all_regs MISSING_CLOCK_ON_INTERCONNECT_ACLK
set xbar_ram_regs MISSING_CLOCK_ON_INTERCONNECT_ACLK
set xbar_period [expr min([join [get_property PERIOD $INTERCONNECT_ACLK] ,])]
set xbar_all_regs [filter [all_registers -clock $INTERCONNECT_ACLK] {REF_NAME !~ RAMB*}]
set xbar_ram_regs [filter $xbar_all_regs {NAME =~ *RAM_reg_*}]
# Asynchronous clock domain crossing for bus interface slot M00_AXI:
set M00_AXI_ACLK [get_clocks -of_objects [get_ports {M_AXI_ACLK[0]}]]
set xbar_regs MISSING_CLOCK_ON_INTERCONNECT_ACLK
set bus_all_regs MISSING_CLOCK_ON_M00_AXI_ACLK
set bus_ram_regs MISSING_CLOCK_ON_M00_AXI_ACLK
set bus_regs MISSING_CLOCK_ON_M00_AXI_ACLK
set xbar_regs [concat $xbar_ram_regs [filter $xbar_all_regs {NAME =~ *mi_converter_bank/gen_conv_slot[0].clock_conv_inst*}]]
set bus_all_regs [filter [all_registers -clock $M00_AXI_ACLK] {REF_NAME !~ RAMB*}]
set bus_ram_regs [filter $bus_all_regs {NAME =~ *RAM_reg_*}]
set bus_regs [concat $bus_ram_regs [filter $bus_all_regs {NAME =~ *mi_converter_bank/gen_conv_slot[0].clock_conv_inst*}]]
set_max_delay -from $bus_regs -to $xbar_regs -datapath_only [expr min([join [get_property PERIOD $M00_AXI_ACLK] ,])]
set_max_delay -from $xbar_regs -to $bus_regs -datapath_only $xbar_period
