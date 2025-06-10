

`timescale 1ns / 1ps

module tb_mod3_counter_fsm;
    reg clk;
    reg rst;
    wire [1:0] count;

    mod3_counter_fsm uut (
        .clk(clk),
      	.rst(rst),
        .count(count)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
      	$dumpfile("mod3_counter_fsm.vcd");
        $dumpvars(0, tb_mod3_counter_fsm);

        $display("Time\tReset\tCount");
      $monitor("%0t\t%b\t%d", $time, rst, count);

      
        rst = 1;
        #10;

      
        rst = 0;
        #60;

       
        $finish;
    end
endmodule
