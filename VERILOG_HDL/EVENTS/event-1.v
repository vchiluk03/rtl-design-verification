//whenever any event is triggered, the statemenst that are waiting for that event to happen, willl be executed   
module tb;
event e1,e2,e3;

initial begin
	@(e3); 
	$display("process-1");
end

initial begin 
	@(e2);
	$display("process-2");
	->e3;
end

initial begin
	@(e1); //It has to wait until event e1, will be triggered
	$display("process-3");
	->e2;
end

initial begin 
	$display("process-4");
	->e1;
end
endmodule 