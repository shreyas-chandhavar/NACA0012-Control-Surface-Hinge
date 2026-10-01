%% MATLAB vs SolidWorks FEA Comparison
clear; clc; close all;

design_reaction = 322.33;       % [N]
matlab_vm = 21.632;             % [MPa] nominal analytical pin stress
fea_vm = 35.730;                % [MPa] local peak von Mises stress
matlab_fos = 46.20;
fea_fos = 14.08;
target_fos = 3.00;
fea_strain_max = 3.0840e-4;
fea_disp_max_mm = 0.3716;

stress_ratio = fea_vm/matlab_vm;

fprintf('MATLAB VS SOLIDWORKS FEA COMPARISON\n');
fprintf('-----------------------------------\n');
fprintf('Design hinge reaction        = %.2f N\n', design_reaction);
fprintf('MATLAB nominal pin VM stress = %.3f MPa\n', matlab_vm);
fprintf('FEA local peak VM stress     = %.3f MPa\n', fea_vm);
fprintf('FEA / analytical stress      = %.2f x\n\n', stress_ratio);
fprintf('MATLAB minimum FoS           = %.2f\n', matlab_fos);
fprintf('FEA minimum FoS              = %.2f\n', fea_fos);
fprintf('Target screening FoS         = %.2f\n\n', target_fos);
fprintf('FEA maximum strain           = %.4e\n', fea_strain_max);
fprintf('FEA maximum displacement     = %.4f mm\n', fea_disp_max_mm);

figure;
bar([matlab_vm, fea_vm]);
set(gca,'XTickLabel',{'MATLAB nominal pin stress','SolidWorks FEA local peak'});
ylabel('von Mises stress [MPa]');
title('Analytical Nominal Stress vs FEA Local Peak Stress');
grid on;
text(1, matlab_vm+1, sprintf('%.2f MPa',matlab_vm),'HorizontalAlignment','center');
text(2, fea_vm+1, sprintf('%.2f MPa',fea_vm),'HorizontalAlignment','center');

figure;
bar([matlab_fos, fea_fos]);
hold on;
yline(target_fos,'--','Target FoS = 3');
set(gca,'XTickLabel',{'MATLAB analytical','SolidWorks FEA'});
ylabel('Minimum factor of safety');
title('Structural Safety Margin Comparison');
grid on;
text(1, matlab_fos+1, sprintf('%.1f',matlab_fos),'HorizontalAlignment','center');
text(2, fea_fos+1, sprintf('%.1f',fea_fos),'HorizontalAlignment','center');
