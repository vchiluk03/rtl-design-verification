vlib work
vdel -all
vlib work

vlog alu_func.v

vsim work.tb
add wave -r * 
run -all