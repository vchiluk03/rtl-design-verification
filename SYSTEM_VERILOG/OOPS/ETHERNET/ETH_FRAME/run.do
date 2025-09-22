#vlog eth_frame-4.sv
#vlog randc.sv
#vlog eth_frame_static.sv
vlog eth_frame_static-1.sv

vsim top -sv_seed 46574

run -all