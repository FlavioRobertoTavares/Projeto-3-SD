`timescale 1ns/1ns
`include "prioritary_encoder.v"

    module tb_prioritary_encoder;
    reg [9:0]keypad;
    reg enablen;
    wire [3:0]D;

    prioritary_encoder DUT
    (
        .keypad (keypad),
        .enablen (enablen),
        .D (D)
    );

    initial begin
        $dumpfile("tb_prioritary_encoder.vcd");
        $dumpvars(0, tb_prioritary_encoder);

        enablen = 0;
        repeat(2) begin

            enablen = ~enablen;
            keypad = 10'b0000000001;
        #5  keypad = 10'b0000000010;
        #5  keypad = 10'b0000000100;
        #5  keypad = 10'b0000001000;
        #5  keypad = 10'b0000010000;
        #5  keypad = 10'b0000100000;
        #5  keypad = 10'b0001000000;
        #5  keypad = 10'b0010000000;
        #5  keypad = 10'b0100000000;
        #5  keypad = 10'b1000000000;
            
        end

    end

endmodule
