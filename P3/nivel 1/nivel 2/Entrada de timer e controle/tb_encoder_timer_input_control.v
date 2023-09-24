`timescale 1ms/1ns
`include "encoder_timer_input_control.v"

module tb_encoder_timer_input_control;
    reg[9:0] keypad;
    reg enablen;
    reg clk;
    wire[3:0] D_tb;
    wire loadn;
    wire pgt_1Hz;

    encoder_timer_input_control DUT
    (
        .keypad (keypad),
        .enablen (enablen),
        .clk (clk),
        .D (D_tb),
        .loadn (loadn),
        .pgt_1Hz (pgt_1Hz)
    );

    initial begin
        $dumpfile("tb_encoder_timer_input_control.vcd");
        $dumpvars(0, tb_encoder_timer_input_control);

        clk = 0;
        enablen = 0;
        keypad = 0;

        repeat(2) begin
            enablen = ~enablen;
            for (integer i = 0; i < 10; i = i+1) begin   
                keypad = 1 << i;
                repeat(20) #5 clk =~clk;
                keypad = 0;
                repeat(20) #5 clk =~clk;
            end
        end
        keypad = 10'h80;
        repeat(5) #5 clk =~clk;
        keypad = 10'h84;
        repeat(15) #5 clk =~clk;
        keypad = 10'h100;
        repeat(10) #5 clk =~clk;
        keypad = 10'h140;
        repeat(10) #5 clk =~clk;

    end

endmodule