vlib work
vdel -all
vlib work

#vlog swap.v
vlog swap-1.v

vsim work.tb
add wave -r *
run -all