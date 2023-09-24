module div_freq_100 (input wire clk,
                    output reg clk_1Hz);

    reg [5:0] Q = 0;
    initial clk_1Hz = 0;

    always @(posedge clk)

        if (Q == 49) begin
        
            clk_1Hz <= ~clk_1Hz;
            Q <= 0;

        end else
            Q <= Q+1;
    

endmodule