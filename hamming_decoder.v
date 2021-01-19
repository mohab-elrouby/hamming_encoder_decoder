module hamming_decoder#(
	parameter WIDTH_SIPO=7,
	parameter WIDTH_PISO=4
)

(serial_in, serial_out, po1, clk_fast, clk_slow);

	input serial_in, clk_fast, clk_slow;	
	output serial_out;
	output [WIDTH_PISO-1:0] po1;
	wire [WIDTH_SIPO-1:0]sipo_po;
	wire [WIDTH_PISO-1:0]piso_pi;
	wire s0,s1,s2; // syndrom calc
	wire m0,m1,m2,m3; // syndrom matching
	wire c0,c1,c2,c3; // corrected data
	wire piso_so;	

	ShiftRegister_SIPO #(.WIDTH(7)) sipo_reg(.clk(clk_fast), .SI(serial_in), .PO(sipo_po));
	
	assign s0 = sipo_po[2] ^ sipo_po[4] ^ sipo_po[6] ^ sipo_po[0] ;
	assign s1 = sipo_po[2] ^ sipo_po[5] ^ sipo_po[6] ^ sipo_po[1] ;
	assign s2 = sipo_po[4] ^ sipo_po[5] ^ sipo_po[6] ^ sipo_po[3] ;

	assign m0 = s0 & s1 & ~s2;
	assign m1 = s0 & ~s1 & s2;
	assign m2 = ~s0 & s1 & s2;
	assign m3 = s0 & s1 & s2;

	assign c0 = m0 ^ sipo_po[2];
	assign c1 = m1 ^ sipo_po[4];
	assign c2 = m2 ^ sipo_po[5];
	assign c3 = m3 ^ sipo_po[6];

	assign piso_pi = {c3,c2,c1,c0};
	assign po1 = piso_pi;


	Shiftregister_PISO #(.WIDTH(4)) piso_reg(.clk(clk_slow), .Parallel_In(piso_pi), .Serial_Out(piso_so));
	
	assign serial_out = piso_so;



endmodule
