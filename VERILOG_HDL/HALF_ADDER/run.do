vlib work
vdel -all
vlib work

vlog half-adder-dataflow.v
#vlog half-adder-behv.v
#vlog half-adder-gate.v

vlog half-adder-tb.v

vsim work.half_adder_tb
add wave -r *
run -all