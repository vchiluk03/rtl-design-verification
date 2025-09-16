vlib work
vdel -all
vlib work

vlog dff-multibit.v
vlog tb.v

vsim work.tb
add wave -r *
run -all