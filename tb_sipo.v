module tb_sipo;
	reg SI, clk;
	wire [3:0] PO;
	
	ShiftRegister_SIPO uut(.clk(clk), .SI(SI), .PO(PO));

	initial begin
  		clk=1;
  			forever begin
    				#20 clk = ~clk; //clock time = 40ns
  			end
		end
	
	initial 
		begin
    			@(posedge clk);
			SI = 1;
    			@(posedge clk);
			SI = 0;
    			@(posedge clk);
			SI = 1;
    			@(posedge clk);
			SI = 1;
    			@(posedge clk);
			SI = 1;
    			@(posedge clk);
			SI = 0;
		end
endmodule
