module hamming_encoder#(
	parameter WIDTH_SIPO=4,
	parameter WIDTH_PISO=7
)

(serial_in, serial_out, clk_slow, clk_fast, po1);

	input serial_in, clk_slow, clk_fast;	
	output serial_out;
	output [WIDTH_PISO-1:0] po1;
	wire [WIDTH_SIPO-1:0]sipo_po;
	wire [WIDTH_PISO-1:0]piso_pi;
	wire p0,p1,p2;
	wire piso_so;
	
	ShiftRegister_SIPO sipo_reg(.clk(clk_slow), .SI(serial_in), .PO(sipo_po));
    	
	assign p0 = sipo_po[0] ^ sipo_po[1] ^ sipo_po[3];
    	assign p1 = sipo_po[0] ^ sipo_po[2] ^ sipo_po[3];
    	assign p2 = sipo_po[1] ^ sipo_po[2] ^ sipo_po[3];


	assign piso_pi = {sipo_po[3:1], p2, sipo_po[0], p1, p0};
	assign po1 = piso_pi;

	Shiftregister_PISO piso_reg(.clk(clk_fast), .Parallel_In(piso_pi), .Serial_Out(piso_so));

	assign serial_out = piso_so;
	
endmodule
