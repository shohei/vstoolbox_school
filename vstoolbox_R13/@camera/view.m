function view(c,T0c,p,T0o)

pc = inverse(T0c)*T0o*p;

u = c.fu * x(pc) ./ z(pc) + c.u0;
v = c.fv * y(pc) ./ z(pc) + c.v0;

plot(u,v,'.','MarkerSize',20);

hold on;

patch('faces',faces(p),'vertices',[u; v]','FaceColor',GetFc(p));

hold off;

axis equal;
axis ij;
axis([0 c.hres-1 0 c.vres-1]);
