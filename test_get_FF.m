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
        %This is for the front half of the qauter car. 
        w=(FSAE_Race_Car.chassis.weight+FSAE_Race_Car.pilot.weight...
            +FSAE_Race_Car.power_plant.weight)/4; %One forth the weight of the car in lbf.
        
        % front damping ratio
        c1LR = get_leverage_ratio('front', FSAE_Race_Car);
        c=c1LR * FSAE_Race_Car.suspension_front.c*12; % ft
        
        % front spring constant
        k1LR = get_leverage_ratio('front', FSAE_Race_Car);
        k=k1LR*FSAE_Race_Car.suspension_front.k*12; % ft
        
        % getting the lengths
        cg = get_cg(FSAE_Race_Car); % ft
        lf = cg; % ft
        
        % forcing function matrix 
        FF=[w-c*dRdt_f_d-R_f_d*k;...
           c*lf*dRdt_f_d+lf*R_f_d*k]