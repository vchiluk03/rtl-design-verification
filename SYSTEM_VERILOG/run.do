vlib work
vdel -all
vlib work

vlog -sv +acc apb_tx.sv
vlog top.sv

vsim +acc work.top
run -all