`timescale 1ns / 1ps

module Bushma_tb();
    reg clk;
    reg reset;
    reg x;
    wire [1:3] MI;

    Bushma_Control dut (
        .clk(clk),
        .reset(reset),
        .x(x),
        .MI(MI)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        reset = 1; x = 0;
        #15 reset = 0;
        
        #10 x = 0;
        #10 x = 0;
        #10 x = 1;
        #10 x = 1;
        #10 x = 1;
        #10 x = 0;
        #10 x = 1;
        
        #20 $stop;
    end

endmodule