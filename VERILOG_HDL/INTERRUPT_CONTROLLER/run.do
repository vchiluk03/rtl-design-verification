vlib work 
vdel -all
vlib work

#vlog interrupt_controller.v
vlog intp-1.v
vlog interrupt_controller_tb.v

vsim work.intp_ctrl_tb
add wave -r *
run -all