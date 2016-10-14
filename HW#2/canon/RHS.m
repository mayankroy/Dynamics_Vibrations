function zdot= RHS( t,z )
%System
sys.m = 1;
sys.k = 1;
sys.g = -9.8;
sys.c = 1;

x = z([1 2]);
v = z([3 4]);

a(1) = -sys.c/sys.m * v (1); % F = ma
a(2) = -sys.c/sys.m * v (2) + sys.g; % F = ma
zdot = [v;a'];

end

