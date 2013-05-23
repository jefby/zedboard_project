######################################################
#
# XPS Tcl API script generated by PlanAhead
#
######################################################

proc _main_ {} {
  cd "H:/github/zedboard_project/xilinx_lab/lab6/lab6.srcs/sources_1/edk/sytem"
  if { [ catch {xload xmp sytem.xmp} result ] } {
    exit 10
  }

  # Set host application type
  xset intstyle PA

  # Set design flow type
  xset flow ise

  # Save language
  set hdl_bak [xget hdl]

  # Set target language for the template
  xset hdl vhdl

  if { [catch {run stubgen} result] } {
    return -1
  }

  # Restore language
  xset hdl $hdl_bak
  return $result
}

# Generate Top-Level wrapper
if { [catch {_main_} result] } {
  exit -1
}

# Check return status and exit
if { [string length $result] == 0 } {
  exit 0
} else {
  exit $result
}
