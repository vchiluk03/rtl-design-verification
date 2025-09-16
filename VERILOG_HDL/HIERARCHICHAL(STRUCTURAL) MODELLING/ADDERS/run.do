vlib work
vdel -all
vlib work

vlog 1-bit_full_adder.v
vlog 4-bit_full_adder.v
vlog tb.v

vsim work.tb
add wave -r *
run -all