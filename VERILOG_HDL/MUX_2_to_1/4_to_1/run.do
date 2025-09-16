vlib work
vdel -all
vlib work

#vlog mux_4to1-df.v
vlog mux_4to1-df-1.v
vlog tb.v

vsim work.tb
add wave -r * 
run -all
