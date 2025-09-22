interface spi_intf(); //here, there are no common direction signals. So, there is no port list arguments.
bit sclk;
bit ssel;
bit mosi;
bit miso;
	
clocking master_cb@(posedge sclk);
	default input #0 output #1;
	output ssel,mosi;
	input miso;
endclocking
	
clocking slave_cb@(posedge sclk);
	default input #0;
	input ssel,mosi;
	output miso;
endclocking

endinterface
