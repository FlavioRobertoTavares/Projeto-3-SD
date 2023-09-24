`timescale 1ms/1ns
`include "div_freq_100.v"

module tb_div_freq_100;
    reg clk;
    reg clk_1Hz;

    div_freq_100 DUT
    (
        .clk (clk),
        .clk_1Hz (clk_1Hz_tb)
    );

    initial begin
        $dumpfile("tb_div_freq_100.vcd");
        $dumpvars(0, tb_div_freq_100);

        clk = 1'b0;
        repeat(200)
            #5 clk = ~clk;
    end

endmodule