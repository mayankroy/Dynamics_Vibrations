function zdot= RHS( t,z )
%System
sys.m1 = 1;
sys.m2 = 1;
sys.m3 = 1;

sys.k = 1;
sys.G = 1;

x = z([1 3 5]);
y = z([2 4 6]);

vx = z([7 9 11]);
vy = z([8 10 12]);

r12 = sqrt((x(1)-x(2))^2 + (y(1) - y(2))^2);
r23 = sqrt((x(2)-x(3))^2 + (y(2) - y(3))^2);
r31 = sqrt((x(3)-x(1))^2 + (y(3) - y(1))^2);

r12x = x(1)-x(2);
r23x = x(2)-x(3);
r31x = x(3)-x(1);

r12y = y(1)-y(2);
r23y = y(2)-y(3);
r31y = y(3)-y(1);

theta1 = atan2(r12x,r12y);
theta2 = atan2(r23x,r23y);
theta3 = atan2(r31x,r31y);

f12 = sys.G*sys.m1*sys.m2/(r12^2);
f23 = sys.G*sys.m1*sys.m2/(r23^2);
f31 = sys.G*sys.m1*sys.m2/(r31^2);

f12x = f12*cos(theta1);
f23x = f23*cos(theta2);
f31x = f31*cos(theta3);

f12y = f12*sin(theta1);
f23y = f23*sin(theta2);
f31y = f31*sin(theta3);

f21x = -f12x;
f32x = -f23x;
f13x = -f31x;

f21y = -f12y;
f32y = -f23y;
f13y = -f31y;

a1 = [f21x + f31x ; f21y + f31y];
a2 = [f32x + f12x ; f32y + f12y];
a3 = [f23x + f13x ; f23y + f13y];


zdot = [vx(1);vy(1);vx(2);vy(2);vx(3);vy(3);a1;a2;a3];

end

