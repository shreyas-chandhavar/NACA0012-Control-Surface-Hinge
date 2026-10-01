%% NACA0012 Control-Surface Hinge - Phase 1 Load Model
% Screening-level aerodynamic/control-surface load model.
% Units: SI unless stated otherwise.

clear; clc; close all;

%% Geometry and constants
rho = 1.225;             % air density [kg/m^3]
c = 0.300;               % main chord [m]
span = 0.600;            % control-surface span [m]
cf = 0.075;              % control-surface chord [m]
S = span * cf;           % control-surface area [m^2]
horn_arm = 0.040;        % horn arm [m]
eta_delta = 0.65;        % screening flap/control effectiveness factor
moment_arm = 0.40 * cf;  % assumed aerodynamic force arm [m]

V = 10:5:50;             % velocity sweep [m/s]
delta_deg = -25:5:25;    % control-surface deflection sweep [deg]

%% Sweep
[VV, DD] = meshgrid(V, delta_deg);
q = 0.5 .* rho .* VV.^2;
delta_rad = deg2rad(DD);

% Screening normal-force coefficient
Cn = 2*pi*eta_delta .* delta_rad;

F_control = q .* S .* Cn;
M_hinge = F_control .* moment_arm;
F_horn = M_hinge ./ horn_arm;

%% Reference operating point: 30 m/s, 10 deg
V_ref = 30;
delta_ref = 10;
q_ref = 0.5*rho*V_ref^2;
Cn_ref = 2*pi*eta_delta*deg2rad(delta_ref);
F_ref = q_ref*S*Cn_ref;
Mh_ref = F_ref*moment_arm;
Fhorn_ref = Mh_ref/horn_arm;

%% Maximum screened point: 50 m/s, 25 deg
V_max = 50;
delta_max = 25;
q_max = 0.5*rho*V_max^2;
Cn_max = 2*pi*eta_delta*deg2rad(delta_max);
F_max = q_max*S*Cn_max;
Mh_max = F_max*moment_arm;
Fhorn_max = Mh_max/horn_arm;

fprintf('REFERENCE CONDITION\n');
fprintf('V = %.1f m/s, delta = %.1f deg\n', V_ref, delta_ref);
fprintf('q = %.2f Pa\n', q_ref);
fprintf('Cn = %.4f\n', Cn_ref);
fprintf('Control-surface force = %.2f N\n', F_ref);
fprintf('Hinge moment = %.3f N m\n', Mh_ref);
fprintf('Horn force = %.2f N\n\n', Fhorn_ref);

fprintf('MAXIMUM SCREENED CONDITION\n');
fprintf('V = %.1f m/s, delta = %.1f deg\n', V_max, delta_max);
fprintf('q = %.2f Pa\n', q_max);
fprintf('Cn = %.4f\n', Cn_max);
fprintf('Control-surface force = %.2f N\n', F_max);
fprintf('Hinge moment = %.3f N m\n', Mh_max);
fprintf('Horn force = %.2f N\n', Fhorn_max);

%% Optional plots
figure;
surf(VV, DD, abs(F_control));
xlabel('Velocity [m/s]');
ylabel('Deflection [deg]');
zlabel('|Control-surface force| [N]');
title('Control-Surface Load Screening');
grid on;

figure;
surf(VV, DD, abs(M_hinge));
xlabel('Velocity [m/s]');
ylabel('Deflection [deg]');
zlabel('|Hinge moment| [N m]');
title('Hinge Moment Screening');
grid on;
