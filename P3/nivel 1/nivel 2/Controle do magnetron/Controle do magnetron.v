`include "nivel 3\\AND OR NOT lógico\\AND OR NOT lógico.v"
`include "nivel 3\\Latch SR\\latch_sr.v"

module Controle_magnetron (input wire starn, stopn, clearn, door_closed, timer_done,
                            output reg mag_on);

wire set, reset;

AND_OR_NOT_logic DUT(.starn(starn), .stopn(stopn), .clearn(clearn), .door_closed(door_closed),
                        .timer_done(timer_done), .set(set), .reset(reset));
                        
latch_sr DUT(.set(set), .reset(reset), .mag_on(mag_on));

    
endmodule