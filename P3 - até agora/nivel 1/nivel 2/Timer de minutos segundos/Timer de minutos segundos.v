`include "nivel 3\\Contador MOD6\\Contador MOD6.v"
`include "nivel 3\\Contador MOD6\\Contador MOD10.v"

module Controlador_timer (input wire  loadn, clrn, clock, en, input reg data[3:0]
                          output wire zero, output reg sec_ones[3:0], sec_tens[3:0], mins[3:0];);
    
    wire zero1, zero2, zero3;
    wire tc1, tc2, tc3;
    Contador_mod10 DUT(.loadn(loadn), .clrn(clrn), .clock(clock), .enable(en), .data(data), .tc(tc1), .zero(zero1), .ones(sec_ones));
    Contador_mod6 DUT(.loadn(loadn), .clrn(clrn), .clock(clock), .enable(tc1), .data(sec_ones), .tens(sec_tens), .tc(tc2), .zero(zero2));
    Contador_mod10 DUT(.loadn(loadn), .clrn(clrn), .clock(clock), .enable(tc2), .data(sec_tens), .tc(tc3), .zero(zero3), .ones(mins));
    assign zero = zero1 && zero2 && zero3;

endmodule
