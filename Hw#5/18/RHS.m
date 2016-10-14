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
y = z(2);
%y = -simplify(sys.l*cos(theta));
%y= eval(y);
%v = z(2);

%xd = v*cos(theta);
%yd = v*sin(theta);
xd = z(3);
yd = z(4);


%for check!!

theta = z(5);
thetad = z(6);
thetadd = sys.g/sys.l*sin(theta);

xdd = ((-(xd^2) -(yd^2) + sys.m*sys.g*y)/(x-y*y/x));
ydd = (- xdd*(y/x) - sys.g);

zdot = [xd ; yd ; xdd ; ydd; thetad; thetadd]

end


