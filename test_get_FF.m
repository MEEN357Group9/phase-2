%Testing get_FF
t=linspace(0,100);
ff_2017_1;


%Code Starts Here
[t,X,V] = ff_data.trajectory(ff_data.t_prev, ff_data.X_prev,...
    (ff_data.t_out - ff_data.t_in)/ff_data.N, ff_data.t_in,...
    ff_data.t_out, ff_data.V_in, ff_data.V_out, ff_data.car);

%Driver
[R_f_d, R_r_d, dRdt_f_d, dRdt_r_d] = ff_data.roadway_d(ff_data.car.chassis.wheelbase/12,...
    ff_data.X_enter_d, X, V);

%Passenger
[R_f_p, R_r_p, dRdt_f_p, dRdt_r_p] =  ff_data.roadway_p(ff_data.car.chassis.wheelbase/12,...
    ff_data.X_enter_p, X, V);

        %For quater car 2 DOF
%For quater car 2 DOF
        %This is for the front half of the quarter car. 
        ww=(ff_data.car.wheel_front.weight+ff_data.car.wheel_back.weight)/2
        w=(ff_data.car.chassis.weight+ff_data.car.pilot.weight...
            +ff_data.car.power_plant.weight)/4; %One forth the weight of the car in lbf.
        
        % front damping ratio
        c=(ff_data.car.wheel_front.c+ff_data.car.wheel_back.c)/2*12; % ft
        
        % front spring constant
        k=(ff_data.car.wheel_front.k+ff_data.car.wheel_back.k)/2*12; % ft

        % forcing function matrix 
        FF=[w;...
           ww-c*dRdt_f_d-k*R_f_d];