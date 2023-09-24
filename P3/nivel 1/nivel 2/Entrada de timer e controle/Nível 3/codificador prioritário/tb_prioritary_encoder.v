`timescale 1ns/1ns
`include "prioritary_encoder.v"

    module tb_prioritary_encoder;
    reg [9:0]keypad;
    reg enablen;
    wire [3:0]D;
    wire valid;

    prioritary_encoder DUT
    (
        .keypad (keypad),
        .enablen (enablen),
        .D (D)
    );

    initial begin
        $dumpfile("tb_prioritary_encoder.vcd");
        $dumpvars(0, tb_prioritary_encoder);

        enablen = 1'b0;

        repeat (2) begin
            enablen = ~enablen;
            for (integer i = 0; i < 10; i = i+1) begin
                keypad = 10'b0000000001 << i; #5;
            end
            keypad = 10'b00_0000_0000; #5;
            keypad = 10'b00_1000_0100; #5;
        end

    end

endmodule
