module Contador_mod6 (input wire loadn, clrn, clock, enable, input wire [3:0] data,
                        output wire tc, zero, output reg [3:0] tens);


    always@(negedge clrn)begin
        if(clrn == 0)
            tens = 0;
    end

    assign zero = (tens == 0)? 1:0;
    assign tc = enable && zero;

    always@(posedge clock) begin
        if(enable == 1)
            if(tens == 0)
                tens <= 5;
            else
                tens <= tens -1;
        else
            begin
                if(loadn == 0)
                    tens <= data;
            end
    end

endmodule