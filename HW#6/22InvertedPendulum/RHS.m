function zdot= RHS( t,init,sys)

a = 10000*sin(500*t);
t
theta = init(1);
thetadot = init(2);
thetadotdot = (3/2)*(-a+sys.g)*(sin(theta)/sys.l); % F = ma

zdot = [thetadot,thetadotdot]';

end

