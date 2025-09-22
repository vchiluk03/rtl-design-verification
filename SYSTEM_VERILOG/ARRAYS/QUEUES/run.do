vlib work
vdel -all
vlib work

#vlog -sv +acc queue.sv
#vlog -sv +acc queue-1.sv
vlog -sv +acc queue-2.sv

vsim +acc work.tb
run -all