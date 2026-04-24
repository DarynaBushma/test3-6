module Bushma_Control (
    input clk,
    input reset,
    input x,
    output reg [1:3] MI
);

    parameter a1 = 2'b01, a2 = 2'b10, a3 = 2'b11;
    reg [1:0] curr_state, next_state;

    always @(*) begin
        case (curr_state)
            a1: next_state = (x) ? a3 : a2;
            a2: next_state = (x) ? a3 : a1;
            a3: next_state = (x) ? a1 : a2;
            default: next_state = a1;
        endcase
    end

    always @(posedge clk or posedge reset) begin
        if (reset)
            curr_state <= a1;
        else
            curr_state <= next_state;
    end

    always @(*) begin
        case (curr_state)
            a1:      MI = 3'b010;
            a2:      MI = 3'b100;
            a3:      MI = 3'b011;
            default: MI = 3'b000;
        endcase
    end

endmodule