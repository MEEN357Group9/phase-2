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



ff_data.t_prev = t;
ff_data.X_prev = X;