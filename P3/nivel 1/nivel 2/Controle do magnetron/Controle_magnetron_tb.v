`timescale 1ps/1ps
`include "Controle do magnetron.v"

module Controle_magnetron_tb();

    reg starn, stopn, clearn, door_closed, timer_done;
    wire mag_on;

    Controle_magnetron DUT(.starn(starn), .stopn(stopn), .clearn(clearn), .door_closed(door_closed), .timer_done(timer_done),
                            .mag_on(mag_on));

    initial begin
        $dumpfile("Controle_magnetron_tb.vcd");
        $dumpvars(0, Controle_magnetron_tb);

        starn = 0; door_closed = 1; timer_done = 0;
        stopn = 1; clearn = 1;  

        #10 door_closed = 0; //abriu a porta

        #5 door_closed = 1; // fechou a porta

        #5 stopn = 0; //deu stop

        #5 stopn = 1; //tirou stop

        #5 timer_done = 1; // tempo acabou

    end


endmodule