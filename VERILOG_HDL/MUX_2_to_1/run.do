vlib work
vdel -all
vlib work

#vlog mux_2to1-behv.v
#vlog mux_2to1-df.v
#vlog mux_2to1-df-1.v
vlog mux_2to1-gate.v

vlog tb.v

vsim work.tb
add wave -r *
run -all 