vlib work 
vdel -all
vlib work

vlog fork-join.v
#vlog fork-join-1.v
#vlog fork-join-2.v
#vlog fork-join-3.v

vsim work.tb
run -all