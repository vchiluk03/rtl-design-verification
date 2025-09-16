vlib work
vdel -all
vlib work

vlog parameterized_memory.v
vlog tb.v

vsim work.tb
add wave -r *
run -all