#compilation
#vlog mailbox.sv
#vlog mailbox-1.sv
#vlog event.sv
#vlog event-1.sv
#vlog event-2.sv
#vlog event-3.sv
#vlog event-4.sv
#vlog event_SV_STYLE.sv
#vlog semaphore.sv
vlog semaphore-1.sv

#elaboration
vsim top -sv_seed 84365

#simulation
run -all
