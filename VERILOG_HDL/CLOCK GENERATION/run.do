vlib work
vdel -all
vlib work

#vlog clock.v
#vlog clock-1.v
vlog clock-2.v
#vlog sequence.v
#vlog sequence_tb.v

#vsim work.tb
vsim work.tb -voptargs=+freq=200

add wave -r *
run -all