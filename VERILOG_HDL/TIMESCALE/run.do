vlib work
vdel -all
vlib work

vlog timescale.v

vsim work.tb
add wave -r *
run -all