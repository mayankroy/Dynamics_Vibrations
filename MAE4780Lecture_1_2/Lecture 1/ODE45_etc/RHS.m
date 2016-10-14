function zdot= RHS( t,z )
%System
sys.m = 1;
sys.k = 1;
sys.g = -9.8;

x = z(1);
v = z(2);

a = -(sys.k/sys.m)*x + sys.g/sys.m; % F = ma

zdot = [v,a]';

end

