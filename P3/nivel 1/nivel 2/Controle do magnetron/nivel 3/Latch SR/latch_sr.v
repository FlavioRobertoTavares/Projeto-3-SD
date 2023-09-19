module latch_sr (input wire set, reset, output reg mag_on);

    always @(set or resert) begin
        if(set == 0 && reset == 1)
            mag_on <= 0;
        else if(set == 1 && reset == 0)
            mag_on <= 1;
        else if(set == 1 && reset == 1)
            mag_on <= 0;
    end
    
endmodule