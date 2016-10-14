function zdot= RHS( t,init,sys)

x = init([1 2]);
v = init([3 4]);


a = ((-sys.c/sys.m * (norm(v))).*v)' - [0 sys.g]; % F = ma

zdot = [v;a'];

end

