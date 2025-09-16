vlib work
vdel -all
vlib work

#vlog p_encoder_4x2_behv.v
#vlog p_encoder_4x2_df.v
vlog p_encoder_4x2_df-1.v
#vlog p_encoder_4x2_gate.v

vlog tb.v

vsim work.tb
add wave -r *
run -all