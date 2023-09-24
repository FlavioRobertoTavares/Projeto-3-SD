module Contador_mod10 (input wire loadn, clrn, clock, enable, input wire [3:0] data,
                        output wire tc, zero, output reg [3:0] ones);


    always@(negedge clrn)begin
        if(clrn == 0)
            ones = 0;
    end

    assign zero = (ones == 0)? 1:0;
    assign tc = enable && zero;

    always@(posedge clock) begin
        if(enable == 1)
            if(ones == 0)
                ones <= 9;
            else
                ones <= ones -1;
        else
            begin
                if(loadn == 0)
                    ones <= data;
            end
    end

endmodule