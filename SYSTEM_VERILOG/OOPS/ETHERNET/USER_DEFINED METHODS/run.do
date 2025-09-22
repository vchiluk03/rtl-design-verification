vlog top.sv

#vsim top +test_name=test_fixed_len
#vsim top +test_name=test_fixed_source_addr_50_dest_addr_200 
#vsim top +test_name=test_fixed_source_addr_inline_constraint
vsim top +test_name=test_fixed_preamble

run -all