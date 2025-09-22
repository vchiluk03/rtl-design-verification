#Compilation
vlog list.svh

vsim tb_top +testcase=test_n_wr_n_rd
add wave sim:/tb_top/pif/*

run -all