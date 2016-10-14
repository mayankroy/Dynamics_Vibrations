function zdot= RHS( t,z )
%System
sys.m = 1;
sys.k = 10000000;
sys.g = -9.8;
sys.F = 1;
sys.l = 10;


syms x t real

theta = asin(x/sys.l);


x= z(1);
y = -simplify(sys.l*cos(theta));
y= eval(y);
v = z(2);

xd = v*cos(theta);
yd = v*sin(theta);

xdd = ((-(xd^2) -(yd^2) + sys.m*sys.g*y)/(x-y*y/x));
%ydd = (xdd*(x/y)-sys.m*sys.g);

zdot = [eval(xd) ;  eval(xdd)]

end


