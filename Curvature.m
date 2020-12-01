function [x,t,vt]=Curvature(fname)
%% Load 
fullname=[fname,'.obj'];
[x,t,vt]=LoadOBJ(fullname);

%% Pre-computation 
MixArea = Mixed_Area(x,t);

%% Curvature
% mean_curvature
Mean_cur = Mean_curvature(MixArea,x,t);
% 归一化
Mean_cur = (Mean_cur - min(Mean_cur))./(max(Mean_cur)-min(Mean_cur));


% Gauss_curvature
Gauss_cur = Gauss_curvature(MixArea,x,t);
% 归一化
Gauss_cur = (Gauss_cur - min(Gauss_cur))./(max(Gauss_cur)-min(Gauss_cur));


%% Plot
figure;
trimesh(t,x(:,1),x(:,2),x(:,3),Mean_cur);
axis equal
title('Mean curvature');

figure;
trimesh(t,x(:,1),x(:,2),x(:,3),Gauss_cur);
axis equal
title('Gauss curvature');


end

