% p2task4  Drives the  2014 Texas A&M race car of Phase 1 over the
% speed bump roadway using forcing-function data structures f_2014_1, f_2014_2, f_2014_3
% and f_2014_4.
%
% Phase 2, Task 4
% Group 9: Kelsey Banasik, Zarah Navarro, Sonia Sanchez, Harland Ashby
%

%% 
% Quarter Car 1 DOF
run ff_2014_1;

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


% Quarter Car 2 DOF
run ff_2014_2;

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


% Half Car 2 DOF
run ff_2014_3;

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


% Half Car 4 DOF
run ff_2014_4;

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


%% Heave

%Displacement
subplot(3,1,1)
plot(T1,X1(:,1),'k', T2,X2(:,1),'r', T3,X3(:,1),'b', T4,X4(:,1),'g')
ylim([-0.3 0.2])
legend('1/4 car 1 DOF','1/4 car 2 DOF','1/2 car 2 DOF','1/2 car 4 DOF')
title('Displacements: Heave of Car Hitting a Speed Bump')
xlabel('Time [s]')
ylabel('Displacement [ft]')

% Velocity
subplot(3,1,2)
plot(T1,V1(:,1),'k', T2,V2(:,1),'r', T3,V3(:,1),'b', T4,V4(:,1),'g')
ylim([-5 10])
legend('1/4 car 1 DOF','1/4 car 2 DOF','1/2 car 2 DOF','1/2 car 4 DOF')
title('Velocities: Heave of Car Hitting a Speed Bump')
xlabel('Time [s]')
ylabel('Velocity [ft/s]')

%Acceleration
subplot(3,1,3)
plot(T1,A1(:,1),'k', T2,A2(:,1),'r', T3,A3(:,1),'b', T4,A4(:,1),'g')
ylim([-200 300])
legend('1/4 car 1 DOF','1/4 car 2 DOF','1/2 car 2 DOF','1/2 car 4 DOF')
title('Accelerations: Heave of Car Hitting a Speed Bump')
xlabel('Time [s]')
ylabel('Acceleration [ft/s^2]')

%% Pitch

figure

%Displacement
subplot(3,1,1)
plot(T3,X3(:,2),'b', T4,X4(:,2),'g')
ylim([-4 4])
legend('1/2 car 2 DOF','1/2 car 4 DOF')
title('Rotation: Pitch of Car Hitting a Speed Bump')
xlabel('Time [s]')
ylabel('Rotation [deg]')

% Velocity
subplot(3,1,2)
plot(T3,V3(:,2),'b', T4,V4(:,2),'g')
ylim([-100 100])
legend('1/2 car 2 DOF','1/2 car 4 DOF')
title('Spin: Pitch of Car Hitting a Speed Bump')
xlabel('Time [s]')
ylabel('Velocity [deg/s]')

%Acceleration
subplot(3,1,3)
plot(T3,A3(:,2),'b', T4,A4(:,2),'g')
ylim([-4000 4000])
legend('1/2 car 2 DOF','1/2 car 4 DOF')
title('Rate of Spin: Pitch of Car Hitting a Speed Bump')
xlabel('Time [s]')
ylabel('Acceleration [deg/s^2]')


%% Front Axle

figure

%Displacement
subplot(3,1,1)
plot(T2,X2(:,2),'b', T4,X4(:,3),'g')
ylim([-0.3 0.1])
legend('1/4 car 2 DOF','1/2 car 4 DOF')
title('Displacements: Front Axle of Car Hitting a Speed Bump')
xlabel('Time [s]')
ylabel('Displacement [ft]')

% Velocity
subplot(3,1,2)
plot(T2,V2(:,2),'b', T4,V4(:,3),'g')
ylim([-10 10])
legend('1/4 car 2 DOF','1/2 car 4 DOF')
title('Velocities: Front Axle of Car Hitting a Speed Bump')
xlabel('Time [s]')
ylabel('Velocity [ft/s]')

%Acceleration
subplot(3,1,3)
plot(T2,A2(:,2),'b', T4,A4(:,3),'g')
ylim([-400 400])
legend('1/4 car 2 DOF','1/2 car 4 DOF')
title('Accelerations: Front Axle of Car Hitting a Speed Bump')
xlabel('Time [s]')
ylabel('Acceleration [ft/s^2]')


%% Rear Axle

figure

%Displacement
subplot(3,1,1)
plot(T4,X4(:,4),'g')
ylim([-0.3 0.1])
legend('1/2 car 4 DOF')
title('Displacements: Rear Axle of Car Hitting a Speed Bump')
xlabel('Time [s]')
ylabel('Displacement [ft]')

% Velocity
subplot(3,1,2)
plot(T4,V4(:,4),'g')
ylim([-10 10])
legend('1/2 car 4 DOF')
title('Velocities: Rear Axle of Car Hitting a Speed Bump')
xlabel('Time [s]')
ylabel('Velocity [ft/s]')

%Acceleration
subplot(3,1,3)
plot(T4,A4(:,4),'g')
ylim([-400 400])
legend('1/2 car 4 DOF')
title('Accelerations: Rear Axle of Car Hitting a Speed Bump')
xlabel('Time [s]')
ylabel('Acceleration [ft/s^2]')