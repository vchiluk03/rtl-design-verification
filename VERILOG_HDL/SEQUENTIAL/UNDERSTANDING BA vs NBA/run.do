vlib work
vdel -all
vlib work

#vlog blocking.v
vlog nba.v

vsim work.tb
add wave -r *
run -all