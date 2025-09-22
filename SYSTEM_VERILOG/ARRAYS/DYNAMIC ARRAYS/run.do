vlib work
vdel -all
vlib work

#vlog -sv +acc dynamic_array.sv
vlog -sv +acc built_in_func.sv
#vlog -sv +acc da_insert.sv
#vlog -sv +acc da_delete.sv
#vlog -sv +acc da_reverse.sv

vsim +acc work.tb
run -all