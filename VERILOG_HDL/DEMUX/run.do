vlib work
vdel -all
vlib work

#vlog demux_1x4_behv.v
vlog demux_1x4_df.v
#vlog demux_1x4_gate.v
vlog tb.v

vsim work.tb
add wave -r *
run -all