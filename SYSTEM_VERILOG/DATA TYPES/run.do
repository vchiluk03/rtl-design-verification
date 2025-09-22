vlib work
vdel -all
vlib work

#vlog integer-based.sv
#vlog integer-based-1.sv
#vlog data_types.sv
#vlog string.sv
vlog string_reverse.sv


vsim work.tb
add wave -r *
run -all