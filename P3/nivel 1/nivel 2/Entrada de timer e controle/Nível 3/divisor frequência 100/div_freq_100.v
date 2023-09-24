
`define END_OF_COUNT Q == 49 //6'b11_0010

module div_freq_100 (input wire clk,
                    output reg clk_1Hz);

    reg [5:0] Q = 0;
    initial clk_1Hz = 0;

    always @(posedge clk)

        if (END_OF_COUNT) begin
        
            clk_1Hz <= ~clk_1Hz;
            Q <= 0;

        end else
            Q <= Q+1;
    

endmodule

`undef END_OF_COUNT