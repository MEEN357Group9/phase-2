% p2task4_2017  Drives the  2017 Texas A&M race car of Phase 1 over the
% cobblestone roadway using forcing-function data structures f_2017_1, f_2017_2, f_2017_3
% and f_2017_4.
%
% Phase 2, Task 4
% Group 9: Kelsey Banasik, Zarah Navarro, Sonia Sanchez, Harland Ashby
%

%clc;
%clear all;
%close all;


% 1/4 Car 1 DOF
run ff_2017_1;

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

% 1/4 Car 2 DOF
run ff_2017_2;

D2 = ff_data;
FN2 = @(t, D2) get_forcing_function(t, D2);
X02 = get_static_deflection(D2.model, D2.car);
DOF2 = size(X02, 1);
V02 = zeros(DOF2, 1);
A02 = zeros(DOF2, 1);
M2 = get_mass_matrix(D2.model, D2.car);
C2 = get_damping_matrix(D2.model, D2.car);
K2 = get_stiffness_matrix(D2.model, D2.car);

[T2, X2, V2, A2] = Newmark(X02, V02, A02, M2, C2, K2, FN2, D2);

% 1/2 Car 2 DOF
run ff_2017_3;

D3 = ff_data;
FN3 = @(t, D3) get_forcing_function(t, D3);
X03 = get_static_deflection(D3.model, D3.car);
DOF3 = size(X03, 1);
V03 = zeros(DOF3, 1);
A03 = zeros(DOF3, 1);
M3 = get_mass_matrix(D3.model, D3.car);
C3 = get_damping_matrix(D3.model, D3.car);
K3 = get_stiffness_matrix(D3.model, D3.car);

[T3, X3, V3, A3] = Newmark(X03, V03, A03, M3, C3, K3, FN3, D3);

% 1/2 Car 4 DOF
run ff_2017_4;

D4 = ff_data;
FN4 = @(t, D4) get_forcing_function(t, D4);
X04 = get_static_deflection(D4.model, D4.car);
DOF4 = size(X04, 1);
V04 = zeros(DOF4, 1);
A04 = zeros(DOF4, 1);
M4 = get_mass_matrix(D4.model, D4.car);
C4 = get_damping_matrix(D4.model, D4.car);
K4 = get_stiffness_matrix(D4.model, D4.car);

[T4, X4, V4, A4] = Newmark(X04, V04, A04, M4, C4, K4, FN4, D4);


%% Displays heave (in ft) for cars 1, 2, 3, and 4

figure
% Displacement
subplot(3,1,1);
plot(T1,X1(:,1),T2,X2(:,1),'r',T3,X3(:,1),'b',T4,X4(:,1),'g');
title('Displacements: Heave of a Car hitting Cobblestone');
xlabel('Time [s]');
ylabel('Displacement [ft]');
legend('1/4 Car 1 DOF', '1/4 Car 2 DOF', '1/2 Car 2 DOF', '1/2 Car 4 DOF', 'location', 'northeast');

% Velocity
subplot(3,1,2);
plot(T1,V1(:,1),T2,V2(:,1),'r',T3,V3(:,1),'b',T4,V4(:,1),'g');
title('Velocities: Heave of a Car hitting Cobblestone');
xlabel('Time [s]');
ylabel('Velocity [ft/s]');
legend('1/4 Car 1 DOF', '1/4 Car 2 DOF', '1/2 Car 2 DOF', '1/2 Car 4 DOF', 'location', 'northeast');

% Acceleration
subplot(3,1,3);
plot(T1,A1(:,1),T2,A2(:,1),'r',T3,A3(:,1),'b',T4,A4(:,1),'g');
title('Acceleration: Heave of a Car hitting Cobblestone');
xlabel('Time [s]');
ylabel('Acceleration [ft/s^2]');
legend('1/4 Car 1 DOF', '1/4 Car 2 DOF', '1/2 Car 2 DOF', '1/2 Car 4 DOF', 'location', 'northeast');


%% Displays pitch (in degrees) for cars 3 and 4

figure 
% Displacement
subplot(3,1,1);
plot(T3,X3(:,2),'b',T4,X4(:,2),'g');
title('Rotation: Pitch of a Car hitting Cobblestone');
xlabel('Time [s]');
ylabel('Rotation [Degree]');
legend('1/2 Car 2 DOF', '1/2 Car 4 DOF', 'location', 'northeast');

% Velocity
subplot(3,1,2);
plot(T3,V3(:,2),'b',T4,V4(:,2),'g');
title('Spin: Pitch of a Car hitting Cobblestone');
xlabel('Time [s]');
ylabel('Rotation [Degree/s]');
legend('1/2 Car 2 DOF', '1/2 Car 4 DOF', 'location', 'northeast');

% Acceleration
subplot(3,1,3);
plot(T3,A3(:,2),'b',T4,A4(:,2),'g');
title('Rate of Spin: Pitch of a Car hitting Cobblestone');
xlabel('Time [s]');
ylabel('Rotation [Degree/s^2]');
legend('1/2 Car 2 DOF', '1/2 Car 4 DOF', 'location', 'northeast');


%% Displays front axle motion for cars 2 and 4

figure 
% Displacement
subplot(3,1,1);
plot(T2,X2(:,2),'b',T4,X4(:,3),'g');
title('Displacement: Front Axle of a Car hitting Cobblestone');
xlabel('Time [s]');
ylabel('Displacement [ft]');
legend('1/4 Car 2 DOF', '1/2 Car 4 DOF', 'location', 'northeast');

% Velocity
subplot(3,1,2);
plot(T2,V2(:,2),'b',T4,V4(:,3),'g');
title('Velocities: Front Axle of a Car hitting Cobblestone');
xlabel('Time [s]');
ylabel('Velocity [ft/s]');
legend('1/4 Car 2 DOF', '1/2 Car 4 DOF', 'location', 'northeast');

% Acceleration
subplot(3,1,3);
plot(T2,A2(:,2),'b',T4,A4(:,3),'g');
title('Acceleration: Front Axle of a Car hitting Cobblestone');
xlabel('Time [s]');
ylabel('Acceleration [ft/s^2]');
legend('1/4 Car 2 DOF', '1/2 Car 4 DOF', 'location', 'northeast');



%% Displays rear axle motion for car 4

figure 
% Displacement
subplot(3,1,1);
plot(T4,X4(:,4),'g');
title('Displacement: Rear Axle of a Car hitting Cobblestone');
xlabel('Time [s]');
ylabel('Displacement [ft]');
legend('1/2 Car 4 DOF', 'location', 'northeast');

% Velocity
subplot(3,1,2);
plot(T4,X4(:,4),'g');
title('Velocity: Rear Axle of a Car hitting Cobblestone');
xlabel('Time [s]');
ylabel('Velocity [ft/s]');
legend('1/2 Car 4 DOF', 'location', 'northeast');

% Acceleration
subplot(3,1,3);
plot(T4,X4(:,4),'g');
title('Acceleration: Rear Axle of a Car hitting Cobblestone');
xlabel('Time [s]');
ylabel('Acceleration [ft/s^2]');
legend('1/2 Car 4 DOF', 'location', 'northeast');





