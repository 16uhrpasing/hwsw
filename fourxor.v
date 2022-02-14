//-----------------------------------------------------
// Design Name : mux_using_if
// File Name   : mux_using_if.v
// Function    : 2:1 Mux using If
// Coder       : Deepak Kumar Tala
//-----------------------------------------------------
module  fourxor(
output reg [3:0] xorout,
input reg [3:0] inone,
input reg [3:0] intwo
);

//-------------Code Starts Here---------
always @ (inone or intwo)
begin : FOURXOR
  assign xorout = inone ^ intwo;
end

endmodule //End Of Module mux