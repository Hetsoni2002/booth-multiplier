`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   23:56:09 10/01/2021
// Design Name:   booth
// Module Name:   C:/Users/sys/Documents/verilog/booth multiplier/boothmultiplier/boothtest.v
// Project Name:  boothmultiplier
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: booth
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module boothtest;

	// Inputs
	reg [3:0] a;
	reg [3:0] b;

	// Outputs
	wire [7:0] result;
		integer i;
		integer j;
	// Instantiate the Unit Under Test (UUT)
	booth uut (
		.a(a), 
		.b(b), 
		.result(result)
	);

	initial begin
		a=4'b0000;
		b=4'b0000;
//		for (i=0; i< 8; i = i+1)
//		begin
//			a=a+4'b0001;
//			for (j=0; j< 16; j=j+1)
//			begin 
//				b=b+4'b0001;
//				#10;
//			end
//		end
		
		
		// Initialize Inputs
		a = 4'b0010;
		b = 4'b1111;
		#10
		a = 4'b0010;
		b = 4'b0110;
		#10
		a = 4'b0010;
		b = 4'b1010;
		#10
		a = 4'b0010;
		b = 4'b1111;
		#10
		a = 4'b0010;
		b = 4'b0110;
		#10
		a = 4'b0010;
		b = 4'b0101;
		
        
		// Add stimulus here

	end
      
endmodule

