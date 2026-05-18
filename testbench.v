// Testbench Code

module PWM_Servo_Test;

reg clk, rst;
reg [7:0] light;
wire pwm_out;

PWM_Servo servo_inst(
    .clk(clk),
    .rst(rst),
    .light(light),
    .pwm_out(pwm_out)
);

always #10 clk = ~clk;

initial begin

    $dumpfile("solar_tracking.vcd");
    $dumpvars(0, PWM_Servo_Test);

    clk = 0;
    rst = 1;

    // Morning condition
    light = 8'd30;
    #20 rst = 0;

    // Noon condition
    #100 light = 8'd100;

    // Evening condition
    #100 light = 8'd200;

    #200 $finish;
end

endmodule
