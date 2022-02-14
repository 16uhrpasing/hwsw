`include "mux.v" 
`include "fourxor.v" 


module xormux( 
input inmuxpoly,
input inmuxnull,
input inmuxsel,
input reg [3:0] xorinput,
output reg [3:0] xoroutput);

    wire muxoutwire;

    mux ourmux(muxoutwire, inmuxnull, inmuxpoly);

    fourxor(xoroutput, muxoutwire, xorinput);

endmodule