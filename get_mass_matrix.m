function M = get_mass_matrix( vibration_model, FSAE_Race_Car )
%This function returns the mass matrix of a car given the car data and
%vibration model
% Inputs:
%   vibration_model       Is a string indicating the desired vibration model
%   FSAE_Race_car        Is a structure that has the data for quantifying 
%                                        the mass matrix
%
% Outputs:
%  M                               Is a matrix containing the appropiate
%                                        masses in the appropriate places

% valid inputs
ad1 = 'quarter_car_1_DOF';
ad2 = 'quarter_car_2_DOF';


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

% Determining and producing the matrix
if strcmp(ad1,vibration_model) == 1
    % M matrix for 1 DOF
    % chassis weight plus driver weight plus motor weight divided by 4 for
    % quarter car and then divided by 32.17 for slugs 
    m = ( FSAE_Race_Car.chassis.weight + FSAE_Race_Car.pilot.weight ...
        + FSAE_Race_Car.power_plant.weight ) / 4 / 32.17 ; % slugs
    
    M = [m 0; 0 0];
    
elseif strcmp(ad2,vibration_model) == 1
    % M matrix for 2 DOF
    % chassis weight plus driver weight plus motor weight divided by 4 for
    % quarter car and then divided by 32.17 for slugs 
    m = ( FSAE_Race_Car.chassis.weight + FSAE_Race_Car.pilot.weight ...
        + FSAE_Race_Car.power_plant.weight )/4 /32.17 ; % slugs
    % average of the weight of the tires
    mw = ( FSAE_Race_Car.wheel_front.weight + FSAE_Race_Car.wheel_rear.weight )...
        / 2 / 32.17; % slugs
    
    M = [m 0; 0 mw];
else
    error('something went wrong');
end

end

