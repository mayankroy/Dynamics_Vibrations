function zdot= RHS( t,init,sys)

a = 10000*sin(500*t);
t
x = init(1);
xdot = init(2);
xdotdot = (-sys.m*sys.g*2*sys.c*x-4*sys.c^2*x*xdot^2)/(1+4*sys.c^2*x^2); % F = ma

zdot = [xdot,xdotdot]';

end

