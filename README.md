"# hamming_encoder_decoder" 

The design consists of 2 main modules
Encoder 
Decoder
The input data entering the encoder is serial data so we need to pass it through a serial to parallel register. Then we use the input data to generate the parity bits using xor gates.
The 4 bits input data in addition to 3 bits parity together enter a 7-bit parallel to serial register.
The output of the encoder is then transmitted and is to be fed as the input of the decoder.
The same happens in the decoder case, as the data enters the decoder it passes through a 7-bit serial to parallel register.

<img src="" width = "" height = ""/>
