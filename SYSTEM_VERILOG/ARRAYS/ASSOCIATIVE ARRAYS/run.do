vlib work
vdel -all
vlib work

vlog -sv +acc assoc_array.sv

vsim +acc work.tb
run -all