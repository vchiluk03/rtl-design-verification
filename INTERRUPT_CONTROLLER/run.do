#Compilation
vlog intp_ctrl.v
vlog intp_ctrl_tb.v

#elaboration
#vsim -novopt -suppress 12110 intp_ctrl_tb +test_name=LOWEST_PERP_CTRL_w/HIGHEST_PRIORITY
vsim -novopt -suppress 12110 intp_ctrl_tb +test_name=LOWEST_PERP_CTRL_w/LOWEST_PRIORITY
#vsim -novopt -suppress 12110 intp_ctrl_tb +test_name=PERP_CTRL_RANDOM_PRIORITY

add wave -r *
run -all

