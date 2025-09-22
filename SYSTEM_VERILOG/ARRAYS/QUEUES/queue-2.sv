//Declare dynamic array of integers of size 10, Queue of integers of size 10.
//Copy Dynamic array elements to Queue. Do reverse copy also.
module tb;
int dyn_arr[];
int queue[$:19]; //index from 0 to 9.

initial begin 
	dyn_arr = new[10]; //index from 0 to 9
	foreach(dyn_arr[i]) dyn_arr[i] = $urandom_range(10,100);
	//copy this dynamic array contents to QUEUE.
	queue = dyn_arr; 
	$display("Dynamic array comtents:%p\nQueue Contents:%p",dyn_arr,queue);
	queue.shuffle();
	//do reverse Copy
	dyn_arr = queue;
	$display("Dynamic array comtents:%p\nQueue Contents:%p",dyn_arr,queue);
	repeat(5) queue.push_back($urandom_range(47,847));
	dyn_arr = queue;
	$display("Dynamic array comtents:%p\nQueue Contents:%p",dyn_arr,queue);
			//Dynamic array can grow automatically without using new when copying contents.
	
end


endmodule 