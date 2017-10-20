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


% input error checking
if ~ischar(vibration_model) 
    error('vibration_model must be a string');
elseif strcmp('quarter_car_1_DOF',vibration_model) || strcmp('quarter_car_2_DOF',...
        vibration_model) 
    
elseif ~strcmp('quarter_car_1_DOF',vibration_model) && ~strcmp('quarter_car_2_DOF',...
        vibration_model) 
    error('The string for vibration_model must be either ''quarter_car_1_DOF'' or  ''quarter_car_2_DOF''.');
    
elseif ~isstruct(FSAE_Race_Car) 
    error('FSAE_Race_Car must be a structure');
else
end

if strcmp('quarter_car_1_DOF', vibration_model)
    % For 1 DOF
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
    % For 2 DOF
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
end

end

