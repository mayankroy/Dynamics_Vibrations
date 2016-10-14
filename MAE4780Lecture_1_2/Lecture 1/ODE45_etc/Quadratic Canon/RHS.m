function zdot= RHS( t,z )
%System
sys.m = 1;
sys.k = 1;
sys.g = -9.8;
sys.c = 1;

x = z([1 2]);
v = z([3 4]);

speed = sqrt(v(1)^2 + v(2)^2);
angle = atan2(v(2),v(1));

a(1) = -sys.c/sys.m * speed^2 *cos(angle); % F = ma
a(2) = -sys.c/sys.m * speed^2 *sin(angle) + sys.g; % F = ma
zdot = [v;a'];

end

