`timescale 1ns/1ps

module mem_test;

reg clk;
reg reset;
reg [15:0] sensor_data;

wire [15:0] sensor_out;
wire [15:0] average_out;
reg [15:0] sensor_mem [0:99];

integer i;

// Instantiate Sensor Interface
sensor_interface DUT(
    .clk(clk),
    .reset(reset),
    .sensor_data(sensor_data),
    .sensor_out(sensor_out)
);
moving_average MA(
    .clk(clk),
    .reset(reset),
    .sensor_in(sensor_out),
    .average_out(average_out)
);
// Clock
always #5 clk = ~clk;

// Read memory
initial begin
    $readmemh("sensor_data.mem", sensor_mem);
end

// Apply sensor values
initial begin

    clk = 0;
    reset = 1;
    sensor_data = 0;

    #20;
    reset = 0;

    for(i=0;i<100;i=i+1)
    begin
        sensor_data = sensor_mem[i];
        #10;
    end

    $finish;

end

endmodule