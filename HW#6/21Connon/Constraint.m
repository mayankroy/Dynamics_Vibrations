function [c,ceq] = Constraint(init,sys)

theta = init(1);
v0 = init(2);

v = v0.*[cos(theta),sin(theta)];

INIT = [0,0,v];

[t,z] = ode45(@RHS,[0,10],INIT,sys.odeopt,sys);

c = 0; 
ceq = sys.range - z(end,1); 

end
