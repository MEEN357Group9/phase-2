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
leg_displacement=FSAE_Race_Car.chassis.seat_X/12-leg_length; %Center line of the legs.
r=FSAE_Race_Car.pilot.girth/(2*pi)/12; %determinig the radius in ft.
i_leg_self=1/12*body_weight*(3*r^2+leg_length^2); %moment of inertia about itself.
i_leg_cg=i_leg_self+leg_weight*(abs(leg_displacement-cg))^2; %Moment of inertia about center of gravity.
body_displacement=FSAE_Race_Car.chassis.seat_X/12-r; %finding the centerline of the body cylinder.
i_body_self=.5*body_weight*r^2; %Moment of inertia about its center line.
i_body_cg=i_body_self+body_weight*(abs(body_displacement-cg))^2; %Moment of inertia about the center of gravity.
%% Chassiss
