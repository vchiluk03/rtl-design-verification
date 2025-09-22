#Compilation
#vlog interrupt_controller.v
#vlog interrupt_controller_tb.v
vlog intp_ctrl.v
vlog intp_ctrl_tb.v

#elaboration
vsim -novopt -suppress 12110 intp_ctrl_tb 

add wave -r *
run -all
