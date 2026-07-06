
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/02/2026 06:49:22 PM
// Design Name: 
// Module Name: sensor_interface
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
module sensor_interface(

    input clk,
    input reset,
    input [15:0] sensor_data,

    output reg [15:0] sensor_out

);

always @(posedge clk or posedge reset)
begin
    if(reset)
        sensor_out <= 16'd0;
    else
        sensor_out <= sensor_data;
end
moving_average MA (

    .clk(clk),
    .reset(reset),
    .sensor_in(sensor_out),
    .average_out(average_out)

);
endmodule
