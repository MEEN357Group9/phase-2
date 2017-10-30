%test
% p2task4  Drives the  2016 Texas A&M race car of Phase 1 over the
% speed bump roadway using forcing-function data structures f_2016_1, f_2014_2, f_2014_3
% and f_2016_4.
%
% Phase 2, Task 4
% Group 9: Kelsey Banasik, Zarah Navarro, Sonia Sanchez, Harland Ashby
%

clc;
clear all;
close all;

% 1/4 car 1 DOF
run ff_2016_1;

D = ff_data;
FN = @(t, D) get_forcing_function(t, D);
X0 = get_static_deflection(D.model, D.car);
DOF = size(X0, 1);
V0 = zeros(DOF, 1);
A0 = zeros(DOF, 1);
M = get_mass_matrix(D.model, D.car);
C = get_damping_matrix(D.model, D.car);
K = get_stiffness_matrix(D.model, D.car);

[T1, X1, V1, A1] = Newmark(X0, V0, A0, M, C, K, FN, D);

% 1/4 car 2 DOF
run ff_2016_2;

D = ff_data;
FN = @(t, D) get_forcing_function(t, D);
X0 = get_static_deflection(D.model, D.car);
DOF = size(X0, 1);
V0 = zeros(DOF, 1);
A0 = zeros(DOF, 1);
M = get_mass_matrix(D.model, D.car);
C = get_damping_matrix(D.model, D.car);
K = get_stiffness_matrix(D.model, D.car);

[T2, X2, V2, A2] = Newmark(X0, V0, A0, M, C, K, FN, D);

% 1/2 car 2 DOF
run ff_2016_3;

D = ff_data;
FN = @(t, D) get_forcing_function(t, D);
X0 = get_static_deflection(D.model, D.car);
DOF = size(X0, 1);
V0 = zeros(DOF, 1);
A0 = zeros(DOF, 1);
M = get_mass_matrix(D.model, D.car);
C = get_damping_matrix(D.model, D.car);
K = get_stiffness_matrix(D.model, D.car);

[T3, X3, V3, A3] = Newmark(X0, V0, A0, M, C, K, FN, D);

% 1/2 car 4 DOF
run ff_2016_4;

D = ff_data;
FN = @(t, D) get_forcing_function(t, D);
X0 = get_static_deflection(D.model, D.car);
DOF = size(X0, 1);
V0 = zeros(DOF, 1);
A0 = zeros(DOF, 1);
M = get_mass_matrix(D.model, D.car);
C = get_damping_matrix(D.model, D.car);
K = get_stiffness_matrix(D.model, D.car);

[T4, X4, V4, A4] = Newmark(X0, V0, A0, M, C, K, FN, D);

% 4 figures each with 3 plots 

% heave (uses cars 1,2,3,4)
figure
subplot(3,1,1)
plot(T1,X1(:,1),'k', T2,X2(:,1),'r', T3,X3(:,1), 'b', T4,X4(:,1), 'g')
title('Displacements: Heave of a Car Hitting a Tar Strip')
xlabel('Time [s]')
ylabel('Displacement [ft]')
legend('1/4 car 1 DOF','1/4 car 2 DOF', ...
    '1/2 car 2 DOF','1/2 car 4 DOF', 'location', 'northeast')

subplot(3,1,2)
plot(T1,V1(:,1),'k', T2,V2(:,1),'r', T3,V3(:,1), 'b', T4,V4(:,1), 'g')
title('Velocities: Heave of a Car Hitting a Tar Strip')
xlabel('Time [s]')
ylabel('Velocity [ft/s]')
legend('1/4 car 1 DOF','1/4 car 2 DOF', ...
    '1/2 car 2 DOF','1/2 car 4 DOF', 'location', 'northeast')

subplot(3,1,3)
plot(T1,A1(:,1),'k', T2,A2(:,1),'r', T3,A3(:,1), 'b', T4,A4(:,1), 'g')
title('Accelerations: Heave of a Car Hitting a Tar Strip')
xlabel('Time [s]')
ylabel('Acceleration [ft/s^2]')
legend('1/4 car 1 DOF','1/4 car 2 DOF', ...
    '1/2 car 2 DOF','1/2 car 4 DOF', 'location', 'northeast')

% pitch (uses cars 3,4)
figure
subplot(3,1,1)
plot(T3,X3(:,2), 'b', T4,X4(:,2), 'g')
title('Rotation: Pitch of a Car Hitting a Tar Strip')
xlabel('Time [s]')
ylabel('Rotation [deg]')
legend('1/2 car 2 DOF','1/2 car 4 DOF', 'location', 'northeast')

subplot(3,1,2)
plot(T3,V3(:,2), 'b', T4,V4(:,2), 'g')
title('Spin: Pitch of a Car Hitting a Tar Strip')
xlabel('Time [s]')
ylabel('Rotation [deg/s]')
legend('1/2 car 2 DOF','1/2 car 4 DOF', 'location', 'northeast')

subplot(3,1,3)
plot(T3,A3(:,2), 'b', T4,A4(:,2), 'g')
title('Rate of Spin: Pitch of a Car Hitting a Tar Strip')
xlabel('Time [s]')
ylabel('Rotation [deg/s^2]')
legend('1/2 car 2 DOF','1/2 car 4 DOF', 'location', 'northeast')

% front wheel motion ( uses cars 2,4)
figure
subplot(3,1,1)
plot(T2,X2(:,2), 'b', T4,X4(:,3), 'g')
title('Displacements: Front Axle of a Car Hitting a Tar Strip')
xlabel('Time [s]')
ylabel('Displacement [ft]')
legend('1/4 car 2 DOF','1/2 car 4 DOF', 'location', 'northeast')

subplot(3,1,2)
plot(T2,V2(:,2), 'b', T4,V4(:,3), 'g')
title('Velocities: Front Axle of a Car Hitting a Tar Strip')
xlabel('Time [s]')
ylabel('Velocity [ft/s]')
legend('1/4 car 2 DOF','1/2 car 4 DOF', 'location', 'northeast')

subplot(3,1,3)
plot(T2,A2(:,2), 'b', T4,A4(:,3), 'g')
title('Accelerations: Front Axle of a Car Hitting a Tar Strip')
xlabel('Time [s]')
ylabel('Acceleration [ft/s^2]')
legend('1/4 car 2 DOF','1/2 car 4 DOF', 'location', 'northeast')

% rear wheel motion ( uses car 4)
figure
subplot(3,1,1)
plot(T4,X4(:,4), 'g')
title('Displacements: Front Axle of a Car Hitting a Tar Strip')
xlabel('Time [s]')
ylabel('Displacement [ft]')
legend('1/2 car 4 DOF', 'location', 'northeast')

subplot(3,1,2)
plot( T4,V4(:,4), 'g')
title('Velocities: Front Axle of a Car Hitting a Tar Strip')
xlabel('Time [s]')
ylabel('Velocity [ft/s]')
legend('1/2 car 4 DOF', 'location', 'northeast')

subplot(3,1,3)
plot(T4,A4(:,4), 'g')
title('Accelerations: Front Axle of a Car Hitting a Tar Strip')
xlabel('Time [s]')
ylabel('Acceleration [ft/s^2]')
legend('1/2 car 4 DOF', 'location', 'northeast')

