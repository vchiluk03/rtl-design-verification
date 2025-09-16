#Compilation
vlog sync_fifo.v
#vlog sync_fifo_tb.v
vlog sync_test_cases_tb.v

#elaboration
vsim -novopt -suppress 12110 tb +TEST_NAME:test_concurrent_wr_rd

add wave -r *
run -all
