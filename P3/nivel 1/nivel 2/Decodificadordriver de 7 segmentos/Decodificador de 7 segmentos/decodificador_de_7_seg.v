module decodificador_de_7_seg (input wire sec_ones[3:0], sec_tens[3:0], mins[3:0],
                                    output reg sec_ones_segs[6:0], sec_tens_segs[6:0], mins_segs[6:0]);


    assign sec_ones_segs = 
    /* 0 */ (sec_ones == 4'b0000) ? 7'b000_0001 : 
    /* 1 */ (sec_ones == 4'b0001) ? 7'b100_1111 :
    /* 2 */ (sec_ones == 4'b0010) ? 7'b001_0010 :
    /* 3 */ (sec_ones == 4'b0011) ? 7'b000_0110 :
    /* 4 */ (sec_ones == 4'b0100) ? 7'b100_1100 :
    /* 5 */ (sec_ones == 4'b0101) ? 7'b010_0100 :
    /* 6 */ (sec_ones == 4'b0110) ? 7'b010_0000 :
    /* 7 */ (sec_ones == 4'b0111) ? 7'b000_1111 :
    /* 8 */ (sec_ones == 4'b1000) ? 7'b000_0000 :
    /* 9 */ (sec_ones == 4'b1001) ? 7'b000_0100 :
    /* d */ 8'bXXXX_XXXX;

        assign sec_tens_segs = 
    /* 0 */ (sec_tens == 4'b0000) ? 7'b000_0001 : 
    /* 1 */ (sec_tens == 4'b0001) ? 7'b100_1111 :
    /* 2 */ (sec_tens == 4'b0010) ? 7'b001_0010 :
    /* 3 */ (sec_tens == 4'b0011) ? 7'b000_0110 :
    /* 4 */ (sec_tens == 4'b0100) ? 7'b100_1100 :
    /* 5 */ (sec_tens == 4'b0101) ? 7'b010_0100 :
    /* 6 */ (sec_tens == 4'b0110) ? 7'b010_0000 :
    /* 7 */ (sec_tens == 4'b0111) ? 7'b000_1111 :
    /* 8 */ (sec_tens == 4'b1000) ? 7'b000_0000 :
    /* 9 */ (sec_tens == 4'b1001) ? 7'b000_0100 :
    /* d */ 8'bXXXX_XXXX;

    assign mins = 
    /* 0 */ (mins_segs == 4'b0000) ? 7'b000_0001 : 
    /* 1 */ (mins_segs == 4'b0001) ? 7'b100_1111 :
    /* 2 */ (mins_segs == 4'b0010) ? 7'b001_0010 :
    /* 3 */ (mins_segs == 4'b0011) ? 7'b000_0110 :
    /* 4 */ (mins_segs == 4'b0100) ? 7'b100_1100 :
    /* 5 */ (mins_segs == 4'b0101) ? 7'b010_0100 :
    /* 6 */ (mins_segs == 4'b0110) ? 7'b010_0000 :
    /* 7 */ (mins_segs == 4'b0111) ? 7'b000_1111 :
    /* 8 */ (mins_segs == 4'b1000) ? 7'b000_0000 :
    /* 9 */ (mins_segs == 4'b1001) ? 7'b000_0100 :
    /* d */ 8'bXXXX_XXXX;

    
endmodule