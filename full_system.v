module full_system(serial_in, serial_out, clk_slow, clk_fast, error);

	input serial_in, clk_slow, clk_fast, error;
	output serial_out;
	wire encoder_out, decoder_in;

	assign decoder_in = error ^ encoder_out;

	hamming_encoder encoder(.serial_in(serial_in), .serial_out(encoder_out), .clk_slow(clk_slow), .clk_fast(clk_fast), .po1(po1));	
	hamming_decoder  decoder(.serial_in(decoder_in), .serial_out(serial_out), .po1(po1), .clk_fast(clk_fast), .clk_slow(clk_slow));


endmodule