%% Generate NACA0012 Coordinates for SolidWorks
% 300 mm chord, closed trailing edge, cosine-spaced points.
clear; clc;

c_mm = 300.0;
t = 0.12;
N = 101;

theta = linspace(0,pi,N);
x = 0.5*c_mm*(1+cos(theta));
xb = x/c_mm;

yt = 5*t.*(0.2969*sqrt(xb) ...
    - 0.1260*xb ...
    - 0.3516*xb.^2 ...
    + 0.2843*xb.^3 ...
    - 0.1036*xb.^4);

yu = c_mm*yt;

% Upper surface: trailing edge to leading edge.
% Lower surface: leading edge to trailing edge, without duplicating LE.
X = [x, fliplr(x(1:end-1))];
Y = [yu, -fliplr(yu(1:end-1))];
Z = zeros(size(X));

coords = [X(:), Y(:), Z(:)];
writematrix(coords,'NACA0012_300mm_xyz.txt','Delimiter','tab');

fprintf('NACA 0012 CAD coordinates generated.\n');
fprintf('Chord               = %.1f mm\n', c_mm);
fprintf('Maximum thickness   = %.1f mm\n', t*c_mm);
fprintf('Hinge station       = %.1f mm\n', 0.75*c_mm);
fprintf('Control chord       = %.1f mm\n', 0.25*c_mm);
fprintf('Coordinate points   = %d\n', size(coords,1));
fprintf('Created: NACA0012_300mm_xyz.txt\n');
