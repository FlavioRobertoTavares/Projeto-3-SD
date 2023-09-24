module prioritary_encoder  (keypad, enablen, D, valid);

    input wire
        [9:0]keypad,
        enablen;

    output reg [3:0]D;
    output wire valid;
 
    always @(keypad)
        if (!enablen)
            D = (keypad == 10'b0000000001)? 0:
                (keypad == 10'b0000000010)? 1:
                (keypad == 10'b0000000100)? 2:
                (keypad == 10'b0000001000)? 3:
                (keypad == 10'b0000010000)? 4:
                (keypad == 10'b0000100000)? 5:
                (keypad == 10'b0001000000)? 6:
                (keypad == 10'b0010000000)? 7:
                (keypad == 10'b0100000000)? 8:
                (keypad == 10'b1000000000)? 9:
                4'b1111;

    //assign valid = (D == 4'b1111);
    assign valid = (D[3] & D[2] & D[1] & D[0]);


endmodule

