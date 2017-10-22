% Phase 2, Task 3a

clc; clear all; close all;

% Load data that we need
run car_2014.m

% Create the struct fields with which appropriate data will be paired
field_2014_1_1 = 't_prev'; % Data managed by the trajectory integrator (sec)
field_2014_1_2 = 'X_prev'; % Data managed by the trajectory integrator (ft)
field_2014_1_3 = 'car'; % Race car being driven (ie FSAE_Race_Car)
field_2014_1_4 = 'model'; % Vibration model (ie half_car_4_DOF)
field_2014_1_5 = 'trajectory'; % A handle to any admissible trajectory function
field_2014_1_6 = 't_in'; % Time upon entering the trajectory (sec)
field_2014_1_7 = 't_out'; % Time when leaving the trajectory (sec)
field_2014_1_8 = 'V_in'; % Velocity upon entering the trajectory (mph)
field_2014_1_9 = 'V_out'; % Velocity when leaving the trajectory (mph)
field_2014_1_10 = 'N'; % Number of time steps (ie h = [t_out - t_in]/N)
field_2014_1_11 = 'roadway_d'; % A handle to any admissible roadway function traversed by driver side
field_2014_1_12 = 'X_enter_d'; % Distance to engage the roadway waveform
field_2014_1_13 = 'roadway_p'; % A handle to any admissible roadway function traversed by passenger side
field_2014_1_14 = 'X_enter_p'; % Distance to engage the roadway waveform

% Now call specific data or straight up structs to values for big struct
value_2014_1_1 = 0;
value_2014_1_2 = 0;
value_2014_1_3 = FSAE_Race_Car;
value_2014_1_4 = 'quarter_car_1_DOF';
value_2014_1_5 = @trajectory;
value_2014_1_6 = 0; % sec
value_2014_1_7 = 1.5; % sec
value_2014_1_8 = 5; %mph
value_2014_1_9 = 5; % mph
value_2014_1_10 = 2500; 
value_2014_1_11 = @speed_bump;
value_2014_1_12 = 1; % ft
value_2014_1_13 = @speed_bump;
value_2014_1_14 = 1; % ft

% Now to set up the struct for the car
ff_data = struct(field_2014_1_1, value_2014_1_1, field_2014_1_2, value_2014_1_2, ...
    field_2014_1_3, value_2014_1_3, field_2014_1_4, value_2014_1_4, ...
    field_2014_1_5, value_2014_1_5, field_2014_1_6, value_2014_1_6, ...
    field_2014_1_7, value_2014_1_7, field_2014_1_8, value_2014_1_8, ...
    field_2014_1_9, value_2014_1_9, field_2014_1_10, value_2014_1_10, ...
    field_2014_1_11, value_2014_1_11, field_2014_1_12, value_2014_1_12, ...
    field_2014_1_13, value_2014_1_13, field_2014_1_14, value_2014_1_14);



