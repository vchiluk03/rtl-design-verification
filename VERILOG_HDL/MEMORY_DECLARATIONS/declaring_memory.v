//Declaring memory examples

1.Declare a memory of 1KB size, each element size of 16 bits.
- 1KB = 1024 Byte = 1024*8 = 8192 bits.
- since, each location should have 16 bits ==> 512*2*8 ==>512*16 = 8192 bits.
- size = 1024*8 = 2**13.
- WIDTH = 16 = 2**4.
- DEPTH = 2**13/2**4 = 2**9 = 512.
- reg [15:0] memory [511:0]; 

2. Declare a memory of 256 bits size, whose depth is 64.
- 256/64 = 2**8/2**6 = 2**2 = 4
- reg [3:0] memory [63:0];
- Address size = 6 bits.

3. Declare a memory of 16KB memory, mem width is 32.
- Total memory size should be 16KB = 16*1024*8 = (2**4)*(2**10)*(2**3) = 2**17.
- width is 32 bits = 2**5.
- Depth = 2**17/2**5 = 2**12  = 1024*4 = 4096.
- reg [31:0] mem [2**12-1:0] ==> reg [31:0] mem [4095:0];

4. Declare 1GB memopry of width 32.
- 1GB= 1024MB = 1024*1024*1024*8 = 2**33 bits.
- width = 2**5.
- depth = 2**28.
- reg [31:0] mem [2**28-1:0];

5. Declare a byte addressed memory of 1KB size.
1KB= 1024Byte
reg [7:0] mem [1023:0];

6. Declare a word addressed memory of 1KB size.
1024Byte = 1024*8 = 512*16.
reg [15:0] mem [511:0];