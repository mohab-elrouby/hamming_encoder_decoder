# Hamming encoder decoder system

## Design schematic

The design consists of 2 main modules
Encoder 
Decoder
The input data entering the encoder is serial data so we need to pass it through a serial to parallel register. Then we use the input data to generate the parity bits using xor gates.
The 4 bits input data in addition to 3 bits parity together enter a 7-bit parallel to serial register.
The output of the encoder is then transmitted and is to be fed as the input of the decoder.
The same happens in the decoder case, as the data enters the decoder it passes through a 7-bit serial to parallel register.

<img src="https://user-images.githubusercontent.com/58495398/104976209-573ec580-5a05-11eb-9760-091f213beaf7.png"/>

## Simulation output
note that the output is the same as the input even though we added error pulse in the middle
<img src="https://user-images.githubusercontent.com/58495398/104976635-5a868100-5a06-11eb-99e5-4f7e098063f2.png"/>

