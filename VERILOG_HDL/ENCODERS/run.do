vlib work
vdel -all
vlib work

#vlog encoder_4x2_behv.v
vlog encoder_4x2_df.v
vlog tb.v

vsim work.tb
add wave -r *
run -all