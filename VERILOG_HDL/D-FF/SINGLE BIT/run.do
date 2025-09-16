vlib work
vdel -all
vlib work

vlog d-ff-chain.v
vlog tb.v

vsim work.tb
add wave -r *
run -all