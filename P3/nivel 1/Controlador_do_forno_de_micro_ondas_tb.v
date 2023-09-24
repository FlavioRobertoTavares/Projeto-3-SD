`timescale 1ms/1ms
`include "Controlador_do_forno_de_micro_ondas.v"


module Controlador_do_forno_de_micro_ondas_tb();

    reg startn, stopn, clearn, door_closed, clock;
    reg [9:0] keypad;
    wire mag_on;
    wire[6:0] sec_ones_segs, sec_tens_segs, mins_segs;

    Controlador_do_forno_de_micro_ondas DUT(.startn(startn), .stopn(stopn), .clearn(clearn), .door_closed(door_closed), .clock(clock), .keypad(keypad),
                                            .mag_on(mag_on), .sec_ones_segs(sec_ones_segs), .sec_tens_segs(sec_tens_segs), .mins_segs(mins_segs));

    initial clock = 0;

    always #5 clock = ~clock;


    initial begin
        $dumpfile("Controlador_do_forno_de_micro_ondas_tb.vcd");
        $dumpvars(0, Controlador_do_forno_de_micro_ondas_tb);
    end

        initial begin
            keypad = 9'b000000000;
            door_closed = 1;
            stopn = 1;
            startn = 1;

            // Inicializando o contador
            clearn = 1; #1;
            clearn = 0; #1;
            clearn = 1;

            // Digitando o 2
            #1100;
            keypad = 9'b000000100;
            #1100;
            keypad = 9'b000000000;

            // Digitando o 5
            #1100;
            keypad = 9'b000100000;
            #1100;
            keypad = 9'b000000000;

            // Digitando o 9
            #1100;
            keypad = 10'b1000000000;
            #1100;
            keypad = 9'b000000000;

            // Tentando abrir
            #1100;
            startn = 0;
            #1100;
            startn = 1;
            #1100;


            // Digitando o 9
            #1100;
            keypad = 10'b1000000000;
            #1100;
            keypad = 9'b000000000;

            // Digitando o 9
            #1100;
            keypad = 10'b1000000000;
            #1100;
            keypad = 9'b000000000;

            // Fechando a porta
            door_closed = 1;
            #1000;
            startn = 0;
            #1000;
            startn = 1;
            #2000;
            // Pausando o timer
            stopn = 0;
            #1000;
            stopn = 1;
            #1000;
            startn = 0;
            #1000;
            startn = 1;
            #2000;
            // Abrindo porta
            door_closed = 0;
            #1000;
            door_closed = 1;
            #3000000;
            $finish();
    end




endmodule