vlib work
vdel -all
vlib work

#vlog comp_1bit_behv.v
#vlog comp_1bit_df.v
vlog comp_1bit_df-1.v
#vlog comp_1bit_gate.v

vlog tb.v

vsim work.tb
add wave -r *
run -all