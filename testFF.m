%test ff 
clear all
clc
run car_2016
run ff_2016_1
vibration_model='half_car_1_DOF'
t=0;
get_forcing_function(t,ff_data)

