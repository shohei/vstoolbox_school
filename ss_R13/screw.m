clf;
T0 = ht;
p = polyhedra('tetrahedron',0.5);
plot(T0);
plot(p,T0);
vf = vfield(p,[-0.05 0 0]',[0 0 0.3]');
plotscrew(p,vf);
axis equal;
