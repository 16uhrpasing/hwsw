`timescale 1ns / 1ns
`include "shift_reg.v" 

module crc  ( input inputbit,
              input mainclk,
              output reg [5:0] output);

    wire mainclk;
    wire fallOffLine;

    wire sh1fallOffBit;
    wire sh2fallOffBit;
    wire sh3fallOffBit;

    wire xorone;
    wire xortwo;
    wire xorthree;

    always @ (posedge mainclk) //kann raus

        xor(xorone, inputbit, fallOffLine);

        shift_reg #(.MSB(2)) sh1(.bit(xorone),
                                .clk(mainclk),
                                .enabled(1),
                                .reset(0),
                                .out(),
                                .fallOffBit(sh1fallOffBit));

        xor(xortwo, sh1fallOffBit, fallOffLine);

        shift_reg #(.MSB(2)) sh2(.bit(xortw…

module half_adder 
  (
   i_bit1,
   i_bit2,
   o_sum,
   o_carry
   );
 
  input  i_bit1;
  input  i_bit2;
  output o_sum;
  output o_carry;
 
  assign o_sum   = i_bit1 ^ i_bit2;  // bitwise xor
  assign o_carry = i_bit1 & i_bit2;  // bitwise and
 
endmodule // half_adder

module shift_reg #(parameter MSB=8) ( input bit,
                                      input clk,
                                      input enabled,
                                      input reset,
                                      output reg [MSB-1:0] out,
                                      output fallOffBit);


    always @ (posedge clk)
        if (reset)
            out <= 0;
        else begin
            if (enabled)
                assign fallOffBit = out[MSB-1];
                out <= {out[MSB-2:0], bit};
            else
                out <= out;
        end
    end

endmodule

//shift_reg #2
//fallOfBit -> XOR -> input bit vom nächsten
//shift_reg #2  ^
//              ^
//letztes shift_reg fallOfBit