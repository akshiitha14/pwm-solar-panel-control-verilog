// Design Code

module PWM_Servo (
    input clk,
    input rst,
    input [7:0] light,
    output reg pwm_out
);

reg [7:0] duty_cycle;
reg [7:0] counter;

always @(*) begin
    if (light < 50)
        duty_cycle = 8'd40;
    else if (light < 150)
        duty_cycle = 8'd80;
    else
        duty_cycle = 8'd120;
end

always @(posedge clk or posedge rst) begin
    if (rst)
        counter <= 8'b0;
    else
        counter <= counter + 1;
end

// PWM output generation
always @(posedge clk) begin
    pwm_out <= (counter < duty_cycle) ? 1 : 0;
end

endmodule
