vlib work
vdel -all
vlib work

vlog priority_arbiter.v
vlog tb.v

vsim work.tb
add wave -r *
run -all
