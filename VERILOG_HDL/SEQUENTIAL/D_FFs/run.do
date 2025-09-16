vlib work
vdel -all
vlib work

vlog d-ff.v
vlog tb.v

vsim work.top
add wave -r *
run -all