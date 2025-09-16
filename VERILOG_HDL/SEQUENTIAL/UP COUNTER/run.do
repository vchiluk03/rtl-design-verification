vlib work
vdel -all
vlib work

#vlog up_counter_gate.v
vlog up_counter_structural.v
vlog tb.v

vsim work.tb
add wave -r *
run -all