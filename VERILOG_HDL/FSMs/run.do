#Compilation
vlog pattern_detector.v
vlog tb.v

#elaboration
vsim -novopt -suppress 12110 tb 

add wave -r *
run -all
