module TB;

reg clk;
reg reset;
reg car_entered;
reg is_uni_car_entered;
reg car_exited;
reg is_uni_car_exited;
reg [4:0] current_hour;

wire [9:0] uni_parked_car;
wire [9:0] parked_car;
wire [9:0] uni_vacated_space;
wire [9:0] vacated_space;
wire uni_is_vacated_space;
wire is_vacated_space;

// get instant from parking management module
parking_management PM (
    clk,
    reset,
    car_entered,
    is_uni_car_entered,
    car_exited,
    is_uni_car_exited,
    current_hour,
    uni_parked_car,
    parked_car,
    vacated_space,
    uni_vacated_space,
    uni_is_vacated_space,
    is_vacated_space
);

integer i;

//clock
always begin
    for (i = 0; i < 120; i = i + 1) begin
        #5 clk = ~clk;
    end
    current_hour = current_hour + 1;
    if (current_hour > 23)
        current_hour = 0;
end


initial begin
    //initialize
    clk = 0;
    reset = 1;
    car_entered = 0;
    is_uni_car_entered = 0;
    car_exited = 0;
    is_uni_car_exited = 0;
    current_hour = 0;
    
    //reset
    #10 reset = 0;

    car_entered = 1;
    #1200
    car_entered = 0;
    #3600
    car_entered = 1;
    is_uni_car_entered = 1;
    #2000
    car_entered = 0;
    is_uni_car_entered = 0;
    #1000
    car_exited = 1;
    #3000
    is_uni_car_exited = 1;
    #3600
    is_uni_car_exited = 0;
    //stop simulation
    #100 $stop;
end

endmodule
