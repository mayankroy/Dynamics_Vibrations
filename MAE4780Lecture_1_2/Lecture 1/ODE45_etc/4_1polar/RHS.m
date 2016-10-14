function zdot= RHS( t,z )
%System
sys.m = 1;
sys.k = 1;
%sys.g = -9.8;

x = z([1 2]);
v = z([3 4]);

a(1) = x(1)*v(2)^2;

a(2) = 2*v(1)*v(2)/x(1);

%a(3) = -(sys.k/sys.m)*x(3) + sys.g/sys.m; % F = ma

zdot = [v;a'];

end

