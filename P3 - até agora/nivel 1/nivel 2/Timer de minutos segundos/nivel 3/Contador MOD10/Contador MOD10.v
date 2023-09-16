module Contador_mod10 (input wire loadn, clrn, clock, enable, input reg data[3:0]
                        output wire tc, zero, output reg ones[3:0]);


    always@(negedge loadn) begin
        if(loadn == 0)
            ones <= data;
    end

    always @(posedge clock or negedge clrn) begin

        if(clrn == 0) 
            tens = 0;
        else
            if(enable == 1) 
                if(ones == 0) 
                    ones <= 9;
                    zero = 1;
                else
                    zero = 0;
                    ones <= ones -1;

            if(zero == 1 && enable == 1) 
                tc = 1;
            else
                tc = 0;
    end

endmodule