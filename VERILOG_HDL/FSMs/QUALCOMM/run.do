#Compilation
vlog pattern_detector_1.v
vlog tb-1.v

#elaboration
vsim -novopt -suppress 12110 tb 

add wave -r *
run -all
