module moving_average(

    input clk,
    input reset,
    input [15:0] sensor_in,

    output reg [15:0] average_out

);

reg [15:0] s0,s1,s2,s3;
reg [17:0] sum;

always @(posedge clk or posedge reset)
begin

    if(reset)
    begin
        s0<=0;
        s1<=0;
        s2<=0;
        s3<=0;
        average_out<=0;
    end

    else
    begin

        s3<=s2;
        s2<=s1;
        s1<=s0;
        s0<=sensor_in;

        sum = s0+s1+s2+s3;

        average_out<=sum>>2;

    end

end

endmodule
