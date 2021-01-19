module Shiftregister_PISO#(
parameter WIDTH=7
)	
(clk, Parallel_In, Serial_Out);

	input clk;
	input [WIDTH-1:0]Parallel_In;
	output reg Serial_Out;
	reg [WIDTH-1:0]tmp;
	reg [3:0]i = 0; //counter to check if the the first time to load has occured 
	
	always @(posedge clk)begin
		if(i == 0)begin 
				tmp<=Parallel_In;
				Serial_Out<=tmp[0];
				i<=i+1;
			end 
		else if(i<=WIDTH-1)
			begin	
				Serial_Out<=tmp[0];
				tmp<={1'b0, tmp[WIDTH-1:1]};	
				i<=i+1;		
			end 
		else begin 
				Serial_Out<=tmp[0];
				i <= 1;
				tmp<=Parallel_In;
			end
	end
endmodule
