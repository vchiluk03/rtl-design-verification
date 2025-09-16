vlib work
vdel -all
vlib work

vlog func_4bit_FA.v

vsim work.tb
add wave -r * 
run -all