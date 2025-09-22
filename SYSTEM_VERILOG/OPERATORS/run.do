vlib work
vdel -all
vlib work

vlog -sv +acc wildcard_operator.sv

vsim +acc work.tb
run -all