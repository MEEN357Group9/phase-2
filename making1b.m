run car_2014;
cg=30/12;
%code Starts here
%Finding Moment of inertial of the motor
%% Motor
d_motor=FSAE_Race_Car.power_plant.diameter; %diameter of the motor in in.
dis_motor=FSAE_Race_Car.chassis.motor_X/12; %distance the motor is from the center of the car in ft. 
w_motor=FSAE_Race_Car.power_plant.weight;% weight of the motor.
m_motor=w_motor/32.2; %converting from lbf to slug.
r_motor=d_motor/2; %finding the radius. 
i_motor_self=2/5*m_motor*r_motor^2; %finding the moment of interial about its own center of mass, units: slugs*in^2
i_motor_self=i_motor_self/(12^2); %converting slug in^2 to slug ft^2
i_motor_cg=i_motor_self+m_motor*(abs(cg-dis_motor))^2; %calculating the moment of intertia about the center of gravity.
%% Driver
leg_length=FSAE_Race_Car.pilot.height*.6/12; %the length of the drivers legs in ft. 
body_length=FSAE_Race_Car.pilot.height*.4/12; %length of the rest of the drivers body in ft. 
leg_weight=FSAE_Race_Car.pilot.weight*.4/32.2; %weight of the drivers legs in slugs.
body_weight=FSAE_Race_Car.pilot.weight*.6/32.2; %weight of the rest of the drivers body in slugs.