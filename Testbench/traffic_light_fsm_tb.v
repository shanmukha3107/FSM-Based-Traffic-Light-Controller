`timescale 1ns/1ps

module traffic_light_fsm_tb;

    reg clk;
    reg reset;

    wire red;
    wire yellow;
    wire green;

    traffic_light_fsm uut (
        .clk(clk),
        .reset(reset),
        .red(red),
        .yellow(yellow),
        .green(green)
    );

    always #5 clk = ~clk;

    initial begin
        $dumpfile("Simulation/traffic_light.vcd");
        $dumpvars(0, traffic_light_fsm_tb);

        clk = 0;
        reset = 1;

        $display("Traffic Light FSM Test Started");

        #12 reset = 0;

        repeat (6) begin
            @(posedge clk);
            #1;
            $display("Time=%0t | RED=%b YELLOW=%b GREEN=%b",
                     $time, red, yellow, green);
        end

        $display("Traffic Light FSM Test Completed");
        $finish;
    end

endmodule
