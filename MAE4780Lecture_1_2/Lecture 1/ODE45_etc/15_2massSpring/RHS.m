function zdot= RHS( t,z )
%System
sys.m = 1;
sys.k = 10000000;
sys.g = -9.8;
sys.F = 1;
sys.l = 10;


x = z([1 2]);
v = z([3 4]);

a(2) = -(sys.k/sys.m)*((x(2) - x(1)) - sys.l);

a(1) = (sys.F - sys.m*a(2))/sys.m;


zdot = [v;a']

end


