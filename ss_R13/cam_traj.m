n = size(T0c.signals.values,3);
plot(ht(T0c.signals.values(:,:,1)),'start');
hold on;
for i=2:5:n-1
    plot(ht(T0c.signals.values(:,:,i)));
end
plot(ht(T0c.signals.values(:,:,end)),'end');

%c = camera;
plot(c,ht(T0c.signals.values(:,:,1)));
plot(c,ht(T0c.signals.values(:,:,end)));

plot(T0o);
plot(p,T0o);
axis equal;
axis off;
hold off;
