class mem_env;
mem_agent agentDA[]; //Creating array of agents 

function new();
	agentDA = new[mem_common::NUM_OF_AGENTS]; // Allocating memory to dynamic array 
	foreach(agentDA[i]) 
		agentDA[i] = new(); //Allocating memory to each agent 
endfunction
	
task run();
fork 
	agentDA[0].run();
	agentDA[1].run();
	agentDA[2].run();
join
endtask
	
endclass