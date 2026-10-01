%% NACA0012 Control-Surface Hinge - Phase 2 Structural Sizing
% Analytical screening calculations for the hinge pin, lug, and bracket.

clear; clc;

%% Load model at design point
rho = 1.225;          % [kg/m^3]
V = 50;               % [m/s]
delta_deg = 25;       % [deg]
span = 0.600;         % [m]
cf = 0.075;           % [m]
S = span*cf;          % [m^2]
eta_delta = 0.65;
moment_arm = 0.40*cf; % [m]
horn_arm = 0.040;     % [m]
load_factor = 1.50;

q = 0.5*rho*V^2;
Cn = 2*pi*eta_delta*deg2rad(delta_deg);
F_control = q*S*Cn;
M_hinge = F_control*moment_arm;
F_horn = M_hinge/horn_arm;

R = load_factor*(abs(F_control) + abs(F_horn));

%% Geometry
d_pin = 11.8e-3;       % pin diameter [m]
d_lug_hole = 12.2e-3;  % lug hole [m]
t_lug = 18e-3;         % lug thickness [m]
w_lug = 29.6e-3;       % net-section width used in sizing [m]
t_ear = 25e-3;         % each bracket ear thickness [m]

%% Material screening allowables
Sy_pin = 1000e6;       % 17-4 PH stainless pin yield screening value [Pa]
Sy_al = 455e6;         % 7075-T6 aluminum screening value [Pa]
Sy_pin_shear = Sy_pin/sqrt(3);

%% Basic checks
A_pin = pi*d_pin^2/4;
tau_pin_double = R/(2*A_pin);

sigma_lug_bearing = R/(d_pin*t_lug);
sigma_lug_net = R/((w_lug-d_pin)*t_lug);
sigma_bracket_bearing = R/(d_pin*(2*t_ear));

FoS_pin_shear = Sy_pin_shear/tau_pin_double;
FoS_lug_bearing = Sy_al/sigma_lug_bearing;
FoS_lug_net = Sy_al/sigma_lug_net;
FoS_bracket_bearing = Sy_al/sigma_bracket_bearing;

%% Pin bending + shear model
% Simplified loaded-span estimate used for nominal pin stress.
L = t_lug + t_ear;          % effective span [m]
Mmax = R*L/4;               % nominal pin bending moment [N m]
sigma_b = 32*Mmax/(pi*d_pin^3);
sigma_vm_pin = sqrt(sigma_b^2 + 3*tau_pin_double^2);
FoS_pin_vm = Sy_pin/sigma_vm_pin;

fprintf('NACA0012 HINGE STRUCTURAL SIZING\n');
fprintf('--------------------------------\n');
fprintf('Design reaction            = %.2f N\n', R);
fprintf('Pin double-shear stress    = %.3f MPa\n', tau_pin_double/1e6);
fprintf('Lug bearing stress         = %.3f MPa\n', sigma_lug_bearing/1e6);
fprintf('Lug net-section stress     = %.3f MPa\n', sigma_lug_net/1e6);
fprintf('Bracket bearing stress     = %.3f MPa\n', sigma_bracket_bearing/1e6);
fprintf('\n');
fprintf('Pin nominal bending stress = %.3f MPa\n', sigma_b/1e6);
fprintf('Pin nominal von Mises      = %.3f MPa\n', sigma_vm_pin/1e6);
fprintf('Pin VM factor of safety    = %.2f\n', FoS_pin_vm);
fprintf('\n');
fprintf('Basic-screening FoS values:\n');
fprintf('Pin shear                  = %.1f\n', FoS_pin_shear);
fprintf('Lug bearing                = %.1f\n', FoS_lug_bearing);
fprintf('Lug net section            = %.1f\n', FoS_lug_net);
fprintf('Bracket bearing            = %.1f\n', FoS_bracket_bearing);
