`include "nivel 3\\AND OR NOT logico\\AND OR NOT logico.v"
`include "nivel 3\\Latch SR\\latch_sr.v"

module Controle_magnetron (input wire starn, stopn, clearn, door_closed, timer_done,
                            output wire mag_on);

wire set, reset;

AND_OR_NOT_logic DUT1(.starn(starn), .stopn(stopn), .clearn(clearn), .door_closed(door_closed),
                        .timer_done(timer_done), .set(set), .reset(reset));
                        
latch_sr DUT2(.set(set), .reset(reset), .mag_on(mag_on));

    
endmodule