vlib work
vdel -all
vlib work

#vlog inter_delay.v
vlog intra_delay.v

vsim work.tb
add wave -r *
run -all