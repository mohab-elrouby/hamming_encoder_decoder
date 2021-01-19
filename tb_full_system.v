module tb_full_system;

	reg clk_slow, clk_fast, serial_in;
	reg error = 0;
	wire serial_out;


	full_system fullSystem(serial_in, serial_out, clk_slow, clk_fast, error);

	initial begin
  		clk_slow=1;
  			forever begin
    			#70 clk_slow = ~clk_slow; // clock cycle = 140ns
  			end
		end
	initial begin
  		clk_fast=1;
  			forever begin
    			#40 clk_fast = ~clk_fast; // clock cycle = 80ns
  			end
		end

	initial begin
			@(posedge clk_slow);
			serial_in = 1;
    			@(posedge clk_slow);
			serial_in = 1;		// excpected output "1011"
    			@(posedge clk_slow);
			serial_in = 0;	
    			@(posedge clk_slow);
			serial_in = 1;
//********************************************************
			@(posedge clk_slow);
			serial_in = 1;
    			@(posedge clk_slow);
			serial_in = 0;		// excpected output "1001"
    			@(posedge clk_slow);
			serial_in = 0;
    			@(posedge clk_slow);
			serial_in = 1;
//********************************************************
			@(posedge clk_slow);
			serial_in = 0;		
    			@(posedge clk_slow);
			serial_in = 0;		// excpected output "1000"
			@(posedge clk_slow);
			serial_in = 0;		
    			@(posedge clk_slow);
			serial_in = 1;
	end

	initial begin 
		#240 	error = 1;	//generating some noise error 
		#80 	error = 0;
		
		#640	error = 1;
		#80 	error = 0;

		#560	error = 1;
		#80 	error = 0;

		#720	error = 1;
		#80 	error = 0;

		#720	error = 1;
		#80 	error = 0;

		#640	error = 1;
		#80 	error = 0;
	end

endmodule
