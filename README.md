# spring2024-parking-management

My Parking Management Project in Verilog.

## Tools

- **Modelsim**


## Implementation Details

### parking_management

This module is the main part of the parking management system.
It tracks the number of normal and university cars, manages free spaces, and outputs needed signals.

#### Inputs

- `car_entered`: as per the requirements stated in the question
- `is_uni_car_entered`: as per the requirements stated in the question
- `car_exited`: as per the requirements stated in the question
- `is_uni_car_exited`: as per the requirements stated in the question
- `current_hour`: additional signal to indicate current time

#### Outputs

- `uni_parked_car`: as per the requirements stated in the question
- `parked_car`: as per the requirements stated in the question
- `uni_vacated_space`: as per the requirements stated in the question
- `vacated_space`: as per the requirements stated in the question
- `uni_is_vacated_space`: as per the requirements stated in the question
- `is_vacated_space`: as per the requirements stated in the question


### Testbench

Testbench covers corner cases and gauranty functionality of our system.

## How to Run
To simulate the module first we need to run Modelsim. We have used the following guide to do this and simulate a verilog code with a testbench using Modelsim. https://staff.cs.upt.ro/~opritoiu/modelsim/rmt/index.html

Here is a screenshot of running Modelsim:
![image](https://github.com/MahdiShokoufi/spring2024-parking-management/blob/main/Document/Screenshot%202024-06-29%20123139.png)

## Results   
   ![image](https://github.com/MahdiShokoufi/spring2024-parking-management/blob/main/Document/Screenshot%202024-06-29%20123549.png)


## Author

- **Name**: Mahdi Shokoufi
- **Student Number**: 401110115
