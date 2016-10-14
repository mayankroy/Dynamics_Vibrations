function zdot= RHS( t,z )
%System
sys.m = 1;
sys.k = 1;
sys.g = -9.8;

x = z([1 2]);
v = z([3 4]);

r = sqrt(x(1)^2 + x(2)^2);
theta = atan2(x(2),x(1));

a(1) = -(sys.k/sys.m)*x(1)^3;

a(2) = -(sys.k/sys.m)*x(2)^3;

%a(3) = -(sys.k/sys.m)*x(3) + sys.g/sys.m; % F = ma

zdot = [v;a'];

end

