vlib work 
vdel -all
vlib work 

#vlog real.v
#vlog real-1.v
vlog real_no_repetition.v

vsim work.tb
run -all