#Compilation
vlog parameterized_memory.v
#vlog tb.v
#vlog tb-1.v
#vlog tb-2.v
#vlog back_door_access_tb.v
#vlog back_door_access_tb_1.v
#vlog back_door_access_tb_2.v
vlog test_cases_tb.v

#elaboration
vsim -novopt -suppress 12110 tb +testname=test_bd_write_fd_read
#vsim -novopt -suppress 12110 tb 

add wave -r *
run -all
