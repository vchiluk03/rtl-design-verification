vlib work
vdel -all
vlib work

#vlog full_adder_dataflow.v
#vlog full_adder_behv.v
#vlog full_adder_gate-1.v
vlog full_adder_gate-2.v

vlog tb.v

vsim work.tb
add wave -r *
run -all