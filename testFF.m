%test ff 
clear all
clc
run car_2016
run ff_2016_1
vibration_model='half_car_4_DOF'
t=0;
get_stiffness_matrix( vibration_model, FSAE_Race_Car )

