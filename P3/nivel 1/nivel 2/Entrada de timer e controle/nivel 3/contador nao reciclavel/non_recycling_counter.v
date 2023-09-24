module non_recycling_counter(
    input wire clock,
    input wire clear,
    output wire non_recycling_counter_output
);

    reg [2:0] counter;
    initial counter = 0;

    always @(posedge clock or posedge clear) begin
        if (clear) begin
            counter <= 0;
        end else if (counter < 7) begin
            counter <= counter + 1;
        end
    end

    assign non_recycling_counter_output = (counter >= 4);

endmodule