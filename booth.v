`timescale 1ns / 1ps
///////////////////////////////////////////////
//////////// Het soni / 19EC073 //////////////
///////////////////////////////////////////////

module booth(
    input wire [3:0] a,
    input wire [3:0] b,
    output [7:0] result
    );
	 
	 wire [3:0] a_bar;
	 wire [7:0] a_ext_pos,a_ext_neg;
	 
	 reg [3:0] a_neg;
	 reg [7:0] pp1,pp2,pp3,pp4;
	 
// 2's complement of the multiplicand

	 assign a_bar = ~a;
	 
	 always @ (a_bar)
		a_neg = a_bar + 1;
 
 // Multiplicand is set for the +1 and -1 case
 
	assign a_ext_pos = {{4{a[3]}},a};
	assign a_ext_neg = {{4{a_neg[3]}}, a_neg};
	
// for b[1:0]

	always @ (b, a_ext_neg)
	begin
		case (b[1:0])
2'b00:
				begin 
					pp1 = 8'h00;
					pp2 = 8'h00;
				end
				
2'b01:
				begin
					pp1 = a_ext_neg;
					pp2 = {{3{a[3]}}, a[3:0], 1'b0};
				end
				
2'b10:
				begin
					pp1 = 8'h00;
					pp2 = {a_ext_neg[6:0], 1'b0};
				end
			
2'b11:
				begin
					pp1 = a_ext_neg;
					pp2 = 8'h00;
				end
		endcase
	end
	
// for b[2:1]
	
	always @ (b, a_ext_pos, a_ext_neg)
	
	begin
		case (b[2:1])
2'b00: pp3 = 8'h00;
			
2'b01: pp3 = {a_ext_pos[5:0], 2'b00};
			
2'b10: pp3 = {a_ext_neg[5:0], 2'b00};
			
2'b11: pp3 = 8'h00;
		endcase
	end
	
//for b[3:2]


	always @ (b, a_ext_pos, a_ext_neg)
	
	begin
		case (b[3:2])
			
2'b00: pp4 = 8'h00;
			
2'b01: pp4 = {a_ext_pos[4:0], 3'b000};
			
2'b10: pp4 = {a_ext_neg[4:0], 3'b000};
		
2'b11: pp4 = 8'h00;
		endcase
	end
	

	assign result = pp1 + pp2 + pp3 + pp4;


endmodule


 