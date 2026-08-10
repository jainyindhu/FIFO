`timescale 1ns/1ps

module fifo_tb;

    reg clk;
    reg reset;

    reg wr_en;
    reg rd_en;

    reg [7:0] data_in;
    wire [7:0] data_out;

    wire full;
    wire empty;

    // Instantiate FIFO
    fifo #(
        .DATA_WIDTH(8),
        .DEPTH(4)
    ) uut (
        .clk(clk),
        .reset(reset),
        .wr_en(wr_en),
        .rd_en(rd_en),
        .data_in(data_in),
        .data_out(data_out),
        .full(full),
        .empty(empty)
    );

    // Clock generation
    always #5 clk = ~clk;

    initial begin

        // Generate waveform
        $dumpfile("waveform.vcd");
        $dumpvars(0, fifo_tb);

        clk = 0;
        reset = 1;
        wr_en = 0;
        rd_en = 0;
        data_in = 8'h00;

        #12;
        reset = 0;

        // -----------------------------
        // WRITE DATA
        // -----------------------------

        // Write 10
        @(negedge clk);
        wr_en = 1;
        data_in = 8'h10;

        // Write 20
        @(negedge clk);
        data_in = 8'h20;

        // Write 30
        @(negedge clk);
        data_in = 8'h30;

        // Write 40
        @(negedge clk);
        data_in = 8'h40;

        @(negedge clk);
        wr_en = 0;

        #2;

        $display("--------------------------------");
        $display("After Writing 4 Values");
        $display("FULL  = %b", full);
        $display("EMPTY = %b", empty);
        $display("--------------------------------");

        // -----------------------------
        // READ DATA
        // -----------------------------

        @(negedge clk);
        rd_en = 1;

        @(negedge clk);
        $display("Read Data = %h", data_out);

        @(negedge clk);
        $display("Read Data = %h", data_out);

        @(negedge clk);
        $display("Read Data = %h", data_out);

        @(negedge clk);
        $display("Read Data = %h", data_out);

        @(negedge clk);
        rd_en = 0;

        #2;

        $display("--------------------------------");
        $display("After Reading All Values");
        $display("FULL  = %b", full);
        $display("EMPTY = %b", empty);
        $display("--------------------------------");

        #20;

        $display("Simulation Completed");

        $finish;

    end

endmodule