#Compilation
vlog struct.sv

#elaboration
vsim top -sv_seed 95869

run -all
