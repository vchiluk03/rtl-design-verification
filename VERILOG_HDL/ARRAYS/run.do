vlib work 
vdel -all
vlib work

#vlog mem_array.v
#vlog array-1.v
#vlog array-2.v
vlog array-3.v
#vlog array-4.v
#vlog array-5.v
#vlog urandom_using_random.v
#vlog urandom_using_random_parameterized.v


vsim work.tb
run -all