function [FF, ff_data] = get_forcing_function(t,ff_data)




[t,X,V] = ff_data.trajectory(ff_data.t_prev, ff_data.X_prev,...
    (ff_data.t_out - ff_data.t_in)/ff_data.N, ff_data.t_in,...
    ff_data.t_out, ff_data.V_in, ff_data.V_out, ff_data.car);

%Driver
[R_f_d, R_r_d, dRdt_f_d, dRdt_r_d] = ff_data.roadway_d(ff_data.car.chassis.wheelbase/12,...
    ff_data.X_enter_d, X, V)

%Passenger
[R_f_p, R_r_p, dRdt_f_p, dRdt_r_p] =  ff_data.roadway_p(ff_data.car.chassis.wheelbase/12,...
    ff_data.X_enter_p, X, V)


%To get forcing function
switch ff_data.model 
    case 'quarter_car_1_DOF'
        
        
        
        
    case 'quarter_car_2_DOF'
  w=(FSAE_Race_Car.Chassis.weight+FSAE_Race_Car.pilot.weight+FSAE_Race_Car.power_plant.weight)/4; %One forth the weight of the car. 
  c=FSAE_Race_
        
        
        
       
    case 'half_car_2_DOF'
        
        
        
        
        
    case 'half_car_4_DOF'
        
        
        
        
        
end

    
    
    
    
    
    
ff_data.t_prev = t;
ff_data.X_prev = X;

end