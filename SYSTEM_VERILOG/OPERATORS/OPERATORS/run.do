#Compilation
vlog operators.sv
vlog operators-1.sv

#elaboration
vsim tb -sv_seed 597349 

run -all
