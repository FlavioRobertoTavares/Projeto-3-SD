module Contador_mod6 (input wire loadn, clrn, clock, enable, input reg data[3:0]
                        output wire tc, zero, output reg tens[3:0]);


    always@(negedge loadn) begin
        if(loadn == 0)
            tens <= data;
    end

    always @(posedge clock or negedge clrn) begin

        if(clrn == 0)
            tens = 0;
        else
            if(enable == 1)
                if(tens == 0)
                    tens <= 6;
                    zero = 1;
                else
                    zero = 0;
                    tens <= tens -1;
                
            if(zero == 1 && enable == 1)
                tc = 1;
            else
                tc = 0;
    end

endmodule