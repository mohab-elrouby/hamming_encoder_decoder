module tb_encoder;
	reg clk_slow, clk_fast, serial_in;
	wire serial_out;
	wire [6:0] po1; 

	hamming_encoder uut(.serial_in(serial_in), .serial_out(serial_out), .clk_slow(clk_slow), .clk_fast(clk_fast), .po1(po1));
	
	initial begin
  		clk_slow=1;
  			forever begin
    			#70 clk_slow = ~clk_slow; 
  			end
		end
	initial begin
  		clk_fast=1;
  			forever begin
    			#40 clk_fast = ~clk_fast; 
  			end
		end

	initial 
		begin
			@(posedge clk_slow);
			serial_in = 1;
    			@(posedge clk_slow);
			serial_in = 1;		// excpected output "1010101"
    			@(posedge clk_slow);
			serial_in = 0;
    			@(posedge clk_slow);
			serial_in = 1;
//********************************************************
			@(posedge clk_slow);
			serial_in = 1;
    			@(posedge clk_slow);
			serial_in = 0;		// excpected output "1001100"
    			@(posedge clk_slow);
			serial_in = 0;
    			@(posedge clk_slow);
			serial_in = 1;
//********************************************************
			@(posedge clk_slow);
			serial_in = 1;
    			@(posedge clk_slow);
			serial_in = 1;		// excpected output "1010101"
    			@(posedge clk_slow);
			serial_in = 0;
    			@(posedge clk_slow);
			serial_in = 1;
  		end
endmodule
