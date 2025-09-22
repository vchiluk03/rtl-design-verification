#compilaton
#vlog lifo_example.sv
#vlog fifo_example.sv
#vlog lifo_fifo.sv
#vlog lifo_fifo_1.sv
vlog lifo_fifo_2.sv

#elaboration
vsim top -sv_seed

#simulation
run -all