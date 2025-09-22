vlib work
vdel -all
vlib work

#vlog ../1-bit_full_adder.v
vlog param_full_adder.v
vlog tb.v +define+MACRO=15

vsim work.tb
add wave -r *
run -all