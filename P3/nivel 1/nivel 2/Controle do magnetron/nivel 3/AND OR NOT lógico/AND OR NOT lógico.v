module AND_OR_NOT_logic (input wire starn, stopn, clearn, door_closed, timer_done,
                        output reg set, reset);
                        
    assign set = !starn && door_closed && !timer_done;
    assign reset = !stopn | !clearn | !door_closed | timer_done;

endmodule