module non_recycling_counter(
    input wire clock,
    input wire clear,
    output reg non_recycling_counter_output
);

    reg [2:0] counter;

    always @(posedge clock or posedge clear) begin
        if (clear) begin
            counter <= 3'b000;
            non_recycling_counter_output <= 0;
        end else if (counter == 3) begin
                counter <= counter + 1'b1;
                non_recycling_counter_output <= 1;
            end else if (counter < 7) begin
                counter <= counter + 1'b1;
            end
        end
endmodule
