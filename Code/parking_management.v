module parking_management(
    input clk,
    input reset,
    input car_entered,
    input is_uni_car_entered,
    input car_exited,
    input is_uni_car_exited,
    input [4:0] current_hour,
    output reg [9:0] uni_parked_car,
    output reg [9:0] parked_car,
    output reg [9:0] vacated_space,
    output reg [9:0] uni_vacated_space,
    output uni_is_vacated_space,
    output is_vacated_space
);

//parking constraints
parameter MAX_TOTAL_CAPACITY = 700;
reg [9:0] max_free_capacity;
wire [9:0] uni_space;

assign uni_space = MAX_TOTAL_CAPACITY - max_free_capacity;

//determine free spaces
assign uni_vacated_space = uni_space - uni_parked_car;
assign vacated_space = max_free_capacity - parked_car;

//determine does free space exist
assign uni_is_vacated_space = (uni_vacated_space > 0);
assign is_vacated_space = (vacated_space > 0);

//determine capacity with current_hour
always @(posedge clk or posedge reset) begin
    if (reset) begin
        max_free_capacity <= 500;
    end else begin
        if (current_hour < 8)
            max_free_capacity <= 500;
        else if (current_hour >= 8 && current_hour < 13)
            max_free_capacity <= 200;
        else if (current_hour >= 13 && current_hour < 16)
            max_free_capacity <= 200 + (current_hour - 12) * 50;
        else
            max_free_capacity <= 500;
    end
end

//main
always @(posedge clk or posedge reset) begin
    if (reset) begin
        uni_parked_car <= 0;
        parked_car <= 0;
    end else begin
        //car entered
        if (car_entered) begin
            //uni car
            if (is_uni_car_entered) begin
                if (uni_is_vacated_space)
                    uni_parked_car <= uni_parked_car + 1;
            //normal car
            end else begin
                if (is_vacated_space)
                    parked_car <= parked_car + 1;
            end
        end

        //car exited
        if (car_exited) begin
            //uni car
            if (is_uni_car_exited) begin
                if (uni_parked_car > 0)
                    uni_parked_car <= uni_parked_car - 1;
            //normal car
            end else begin
                if (parked_car > 0)
                    parked_car <= parked_car - 1;
            end
        end
    end
end

endmodule

