vlib work
vdel -all
vlib work

#vlog comp_2bit_behv.v
#vlog comp_2bit_df.v
#vlog comp_2bit_df-1.v
vlog comp_2bit_structural.v

vlog tb.v

vsim work.tb
add wave -r *
run -all