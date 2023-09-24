`timescale 1ns/1ns
`include "non_recycling_counter.v"

module non_recycling_counter_teste;

    reg clock_TB, clear_TB, contador_TB;
  	wire  Q_TB;

  	non_recycling_counter DUT(.clock(clock_TB), .clear(clear_TB), .non_recycling_counter_output(Q_TB));

    initial
        begin

            $dumpfile("non_recycling_counter_teste.vcd");
            $dumpvars(0, non_recycling_counter_teste);

                clock_TB = 1; clear_TB=1; contador_TB = 0;
            #5   contador_TB = 3;
            #5   clear_TB = 0; 
          
            repeat(8)
                begin
                    #10 clock_TB = ~clock_TB;
                end

        end
endmodule