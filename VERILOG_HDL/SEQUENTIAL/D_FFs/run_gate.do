
vlib work
vdel -all
vlib work

vlog dff_gate.v
vlog tb_gate.v

vsim work.tb
add wave -r *
run -all