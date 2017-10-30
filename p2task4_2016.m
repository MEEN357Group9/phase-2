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

xlim([0 1])
ylim([0 0.07])