vlib work
vdel -all
vlib work

#vlog decoder_2x4_behv.v
#vlog decoder_2x4_df.v
vlog decoder_2x4_gate.v

vlog tb.v

vsim work.tb
add wave -r *
run -all