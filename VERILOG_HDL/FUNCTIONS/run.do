vlib work
vdel -all
vlib work

#vlog func_sum_array.v
vlog static_automatic.v
#vlog static_automatic-1.sv

vsim work.tb
#add wave -r *
run -all