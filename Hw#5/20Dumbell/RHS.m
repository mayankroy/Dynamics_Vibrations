function zdot= RHS( t,init,sys)

p1 = [init(1), init(2)];
x1 = p1(1);
y1 = p1(2);
p2 = [init(3), init(4)];
x2 = p2(1);
y2 = p2(2);
v1 = [init(5), init(6)];
x1d = v1(1);
y1d = v1(2);
v2 = [init(7), init(8)];
x2d = v2(1);
y2d = v2(2);

%tth = (p2(2)-p1(2))/(p2(1)-p1(1));

% syms x1dd x1d x2d y1d y2d x1 y1 x2 y2 real
% 
% tth = (y2-y1)/(x2-x1);
% x2dd = -x1dd;
% y1dd = -x1dd*tth;
% y2dd = -y1dd;
% 
% x1dd = simplify(solve(subs((x1d-x2d)^2+(x1-x2)*(x1dd-x2dd)+(y1d-y2d)^2+(y1-y2)*(y1dd-y2dd)),x1dd));

tth = (y2-y1)/(x2-x1);

x1dd = ((x1d - x2d)^2 + (y1d - y2d)^2)/(2*x2 - 2*x1 + (2*(y1 - y2)^2)/(x1 - x2));
x2dd = -x1dd;
y1dd = x1dd*tth;
y2dd = -y1dd;

a1 = [x1dd, y1dd];
a2 = [x2dd, y2dd];

t

zdot = [v1, v2, a1, a2]'

end

