poly2;

c = camera(1000,1000,256,256,512,512);
plot(c,T0c);
axis equal;

figure (2);	% figure 1 displays the 3D setup
clf;
view(c,T0c,p,T0o);
