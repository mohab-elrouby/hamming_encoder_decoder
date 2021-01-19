module ShiftRegister_SIPO#(
parameter WIDTH=4
)	
	
(clk, SI, PO);
	
	input clk,SI;
	output reg [WIDTH-1:0] PO;
	reg [WIDTH-1:0] tmp;
	reg [WIDTH-1:0] i = 4'h0; //counter to load each 4 bits into one word
	reg [3:0] j = 4'h0; //initial counter to synchronize the load counter with the data
	
	always @(posedge clk)begin
		tmp <= {SI, tmp[WIDTH-1:1]};	
	end
			
	always @(posedge clk)begin
		if(j <= 2) begin 
			j<=j+1;
		end

		else begin 
			if(i == WIDTH-1)begin 
				PO<=tmp;
				i<=0;
			end
			else begin
				i<=i+1;
			end 
		end
	end
endmodule
