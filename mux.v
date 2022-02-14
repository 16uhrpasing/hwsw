//-----------------------------------------------------
// Design Name : mux_using_if
// File Name   : mux_using_if.v
// Function    : 2:1 Mux using If
// Coder       : Deepak Kumar Tala
//-----------------------------------------------------
module  mux(
output reg [3:0] muxout,
input reg [3:0] inzero,
input reg [3:0] inone,
input sel
);

//-------------Code Starts Here---------
always @ (sel or inone or inzero)
begin : MUX
  if (sel == 1'b0) begin
      mux_out = inzero;
  end else begin
      mux_out = inone;
  end
end

endmodule //End Of Module mux