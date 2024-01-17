function plot(p,T,s)
% POLYHEDRA/PLOT Command figure plot of a polyhedra

if nargin < 3
    s = '.';
else
    s = strcat(s,'.');
end

if nargin < 2
    T = ht; % I4
end

p = T * p;

prevhold = ishold;

if ~prevhold
    hold on;
end

if p.showv==1
    plot3(p.m(1,:),p.m(2,:),p.m(3,:),s,'MarkerSize',20);
end

patch('faces',p.e,'vertices',p.m(1:3,:)','FaceColor',p.fc);

if ~prevhold
    hold off;
end
