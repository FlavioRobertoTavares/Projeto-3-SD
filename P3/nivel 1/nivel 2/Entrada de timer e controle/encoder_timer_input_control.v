`include "nivel 2\\Entrada de timer e controle\\nivel 3\\divisor frequencia 100\\div_freq_100.v"
`include "nivel 2\\Entrada de timer e controle\\nivel 3\\codificador prioritario\\prioritary_encoder.v"
`include "nivel 2\\Entrada de timer e controle\\nivel 3\\contador nao reciclavel\\non_recycling_counter.v"
`include "nivel 2\\Entrada de timer e controle\\nivel 3\Multiplexador\\mux.v"

module encoder_timer_input_control (keypad, enablen, clk, D, loadn, pgt_1Hz);
       
    input wire[9:0] keypad;
    input wire enablen, clk;

    output [3:0] D;
    output wire loadn;
    output pgt_1Hz;

    wire clk_1Hz, single_edge;

       prioritary_encoder prioritary_encoder(keypad, enablen, D, loadn);
       div_freq_100 div_freq_100(clk, clk_1Hz);
       non_recycling_counter non_recycling_counter(clk, loadn, single_edge);
       mux mux(enablen, single_edge, clk_1Hz, pgt_1Hz);

endmodule