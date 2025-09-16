#Compilation
vlog async_fifo.v
vlog async_test_cases_tb.v

#elaboration
vsim -novopt -suppress 12110 tb +TEST_NAME:test_full

add wave -r *
run -all
