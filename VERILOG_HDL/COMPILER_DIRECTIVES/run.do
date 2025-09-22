vlib work
vdel -all
vlib work

#vlog define.v
#vlog define-1.v
vlog define-2.v

vsim work.tb
add wave -r *
run -all