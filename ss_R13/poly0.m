p = polyhedra([ ...
      0.25 -0.25 0; ...
      0.25  0.25 0; ...
     -0.25  0.25 0; ...
     -0.25 -0.25 0]',...
     [1 2 3 4])
 
T0 = ht;
clf;
plot(T0,'world');
plot(p);
axis equal;