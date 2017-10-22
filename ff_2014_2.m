% Phase 2, Task 3a

clc; clear all; close all;

% Load data that we need
run car_2014.m

% Create the struct fields with which appropriate data will be paired
field_2014_2_1 = 't_prev'; % Data managed by the trajectory integrator (sec)
field_2014_2_2 = 'X_prev'; % Data managed by the trajectory integrator (ft)
field_2014_2_3 = 'car'; % Race car being driven (ie FSAE_Race_Car)
field_2014_2_4 = 'model'; % Vibration model (ie half_car_4_DOF)
field_2014_2_5 = 'trajectory'; % A handle to any admissible trajectory function
field_2014_2_6 = 't_in'; % Time upon entering the trajectory (sec)
field_2014_2_7 = 't_out'; % Time when leaving the trajectory (sec)
field_2014_2_8 = 'V_in'; % Velocity upon entering the trajectory (mph)
field_2014_2_9 = 'V_out'; % Velocity when leaving the trajectory (mph)
field_2014_2_10 = 'N'; % Number of time steps (ie h = [t_out - t_in]/N)
field_2014_2_11 = 'roadway_d'; % A handle to any admissible roadway function traversed by driver side
field_2014_2_12 = 'X_enter_d'; % Distance to engage the roadway waveform
field_2014_2_13 = 'roadway_p'; % A handle to any admissible roadway function traversed by passenger side
field_2014_2_14 = 'X_enter_p'; % Distance to engage the roadway waveform

% Now call specific data or straight up structs to values for big struct
value_2014_2_1 = 0;
value_2014_2_2 = 0;
value_2014_2_3 = FSAE_Race_Car;
value_2014_2_4 = 'quarter_car_2_DOF';
value_2014_2_5 = @trajectory;
value_2014_2_6 = 0; % sec
value_2014_2_7 = 1.5; % sec
value_2014_2_8 = 5; %mph
value_2014_2_9 = 5; % mph
value_2014_2_10 = 2500; 
value_2014_2_11 = @speed_bump;
value_2014_2_12 = 1; % ft
value_2014_2_13 = @speed_bump;
value_2014_2_14 = 1; % ft

% Now to set up the struct for the car
ff_data = struct(field_2014_2_1, value_2014_2_1, field_2014_2_2, value_2014_2_2, ...
    field_2014_2_3, value_2014_2_3, field_2014_2_4, value_2014_2_4, ...
    field_2014_2_5, value_2014_2_5, field_2014_2_6, value_2014_2_6, ...
    field_2014_2_7, value_2014_2_7, field_2014_2_8, value_2014_2_8, ...
    field_2014_2_9, value_2014_2_9, field_2014_2_10, value_2014_2_10, ...
    field_2014_2_11, value_2014_2_11, field_2014_2_12, value_2014_2_12, ...
    field_2014_2_13, value_2014_2_13, field_2014_2_14, value_2014_2_14);



