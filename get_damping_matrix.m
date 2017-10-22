function C = get_damping_matrix( vibration_model, FSAE_Race_Car )
%This function returns the damping matrix of a car given the car data and
%vibration model
% Inputs:
%   vibration_model       Is a string indicating the desired vibration model
%   FSAE_Race_car        Is a structure that has the data for quantifying 
%                                        the mass matrix
%
% Outputs:
%  C                               Is a matrix containing the appropiate
%                                        damping in the appropriate places


% valid inputs
ad1 = 'quarter_car_1_DOF';
ad2 = 'quarter_car_2_DOF';
ad3 = 'half_car_2_DOF';
ad4 = 'half_car_4_DOF';


% input error checking
if ~ischar(vibration_model) 
    % the vibration model input is not a string
    error('vibration_model must be a string');
elseif strcmp(ad1,vibration_model) || strcmp(ad2,vibration_model) ...
        || strcmp(ad3,vibration_model) || strcmp(ad4, vibration_model)
    % all clear for run
elseif ~strcmp(ad1,vibration_model) && ~strcmp(ad2,vibration_model) ...
        && ~strcmp(ad3,vibration_model) && ~strcmp(ad4,vibration_model)
    % not the proper string
    error('The string for vibration_model must be either ''quarter_car_1_DOF'' or  ''quarter_car_2_DOF''.');
    
elseif ~isstruct(FSAE_Race_Car) 
    error('FSAE_Race_Car must be a structure');
else
end

if strcmp('quarter_car_1_DOF', vibration_model)
    % For quarter car 1 DOF
    % For front suspension
    LRF = get_leverage_ratio('front', FSAE_Race_Car);
    CF = LRF * FSAE_Race_Car.suspension_front.c;
    
    % For rear suspension
    LRR = get_leverage_ratio('rear', FSAE_Race_Car);
    CR = LRR * FSAE_Race_Car.suspension_rear.c;
    
    % Average damping
    avgC = (CF + CR)/2*12; % gives units of lb/(ft/sec)
    C = [ avgC 0; 0 0];
    
    
elseif strcmp('quarter_car_2_DOF', vibration_model)
    % For quarter car 2 DOF
    % For front suspension
    LRF = get_leverage_ratio('front', FSAE_Race_Car);
    CF = LRF * FSAE_Race_Car.suspension_front.c;
    
    % For rear suspension
    LRR = get_leverage_ratio('rear', FSAE_Race_Car);
    CR = LRR * FSAE_Race_Car.suspension_rear.c;
    
    % Average damping
    avgC = (CF + CR)/2*12; % gives units of lb/(ft/sec) 

    % For the wheels
    CW = ( FSAE_Race_Car.wheel_front.c + FSAE_Race_Car.wheel_rear.c )/2*12; % gives units of lb/(ft/sec)
    
    C = [ avgC -avgC; -avgC avgC+CW];
    
elseif strcmp(ad3, vibration_model)
    % For half car 2 DOF
    
    % note: l is full length of chassis; lf is the length from the front of the FSAE racecar to the
    % center of gravity; lr is the length from the rear of the FSAE racecar
    % to the center of gravity
    
    % getting the lengths 
    l = FSAE_Race_Car.chassis.length;
    cg = get_cg(FSAE_Race_Car); % ft
    lf = cg; % ft
    lr = l - cg; % ft
    
    % note: c1 is the front suspension damp; c2 is the rear suspension
    % damp; cf is the front wheel damp; cr is the rear suspension damp
    
    % front damp
    c1LR = get_leverage_ratio('front', FSAE_Race_Car);
    c1 = c1LR * FSAE_Race_Car.suspension_front.c * 12; % ft
    
    % rear damp
    c2LR = get_leverage_ratio('rear', FSAE_Race_Car);
    c2 = c2LR * FSAE_Race_Car.suspension_rear.c * 12; % ft
    
    % ASK ABOUT THE DAMPING MATRIX
    
    % matrix form 
    C = [ c1+c2, -c1*lf+c2*lr; -c1*lf+c2*lr, c1*lf^2+c2*lr^2];
    
    
elseif strcmp(ad4, vibration_model)
    % For half car 4 DOF
    
    % note: l is full length of chassis; lf is the length from the front of the FSAE racecar to the
    % center of gravity; lr is the length from the rear of the FSAE racecar
    % to the center of gravity
    
    % getting the lengths 
    l = FSAE_Race_Car.chassis.length;
    cg = get_cg(FSAE_Race_Car); % ft
    lf = cg; % ft
    lr = l - cg; % ft
    
    % note: c1 is the front suspension damp; c2 is the rear suspension
    % damp; cf is the front wheel damp; cr is the rear suspension damp
    
     % front damp
    c1LR = get_leverage_ratio('front', FSAE_Race_Car);
    c1 = c1LR * FSAE_Race_Car.suspension_front.c * 12; % ft
    
    % rear damp
    c2LR = get_leverage_ratio('rear', FSAE_Race_Car);
    c2 = c2LR * FSAE_Race_Car.suspension_rear.c * 12; %ft
    
    % front wheel damp
    cf = FSAE_Race_Car.wheel_front.c * 12; % ft
    
    % rear wheel damp
    cr = FSAE_Race_Car.wheel_rear.c * 12; % ft
    
    % matrix form
    C = [ c1+c2, -c1*lf+c2*lr, -c1, -c2;
        -c1*lf+c2*lr, c1*lf^2+c2*lr^2, c1*lf, -c2*lr;
        -c1, c1*lf, c1+cf, 0;
        -c2, -c2*lr, 0, c2+cr];
    
    
else
    error('something went wrong')
end

end

