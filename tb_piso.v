module tb_piso;
	reg [6:0]PI;
	reg clk;
	wire SO;
	
	Shiftregister_PISO #(.WIDTH(7)) uut(.clk(clk), .Parallel_In(PI), .Serial_Out(SO));

	initial begin
  		clk=1;
  			forever begin
    				#20 clk = ~clk; //clock time = 40ns
  			end
		end

	
	initial 
		begin
    			@(posedge clk);
			PI = 7'b1101101;
		end
endmodule
