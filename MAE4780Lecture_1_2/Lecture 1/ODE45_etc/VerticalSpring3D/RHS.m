function zdot= RHS( t,z )
%System
sys.m = 1;
sys.k = 1;
sys.g = -9.8;

x = z([1 2 3]);
v = z([4 5 6]);

a(1) = -(sys.k/sys.m)*x(1);

a(2) = -(sys.k/sys.m)*x(2);

a(3) = -(sys.k/sys.m)*x(3) + sys.g/sys.m; % F = ma

zdot = [v;a'];

end

