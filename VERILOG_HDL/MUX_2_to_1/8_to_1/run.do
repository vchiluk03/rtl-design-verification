vlib work
vdel -all
vlib work

#vlog mux_8to1-gate.v
#vlog mux_8to1-gate-1.v
#vlog mux_8to1-df.v
vlog mux_8to1-df-1.v
#vlog mux_8to1-behv.v
#vlog mux_8to1-behv-1.v

#vlog tb.v
vlog tb_monitor.v

vsim work.tb
add wave -r *
run -all