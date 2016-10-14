close all;
clear;
clc;


syms t real

% Parameters
sys.m = 1;
sys.k = 1;
sys.g = 10;
sys.c = 4;
sys.range  = 2;
sys.l = 1;
%sys.a = 1000*sin(10*t);
%Time
tspan = [0,4];


% initial conditions
p.v=0; 
p.x = 2; 

init = [p.x, p.v];

%ode options
sys.odeopt = odeset; 
%sys.odeopt.RelTol = 1e-16;
%sys.odeopt.AbsTol = 1e-16;



% Integrate!
[time,zarray] = ode45(@RHS,tspan,init,sys.odeopt,sys); % Can use many other integrators too (
z.x = zarray(:,1);
z.v = zarray(:,2);



%plot(0:time.h:time.n*time.tf,z);
% Plotting stuff
subplot(2,1,1);
plot(time,z.x);
%plot(tspan,x);
xlim(tspan);
ylabel('$x$','Interpreter','latex','FontSize',24);

subplot(2,1,2);
plot(time,z.v);
%plot(tspan,v);
xlim(tspan);
ylabel('$\dot{x}$','Interpreter','latex','FontSize',24);
xlabel('$time$','Interpreter','latex','FontSize',24);

%tracking stuff
figure(2);
hold on;
plot(z.x,z.x.^2.*sys.c,'*');
%plot(analytical.x,analytical.y+20,'r');
%plot(tspan,v);
%xlim(z.x(:,1));
%axis ([-10 20 -10 20]);
ylabel('$y$','Interpreter','latex','FontSize',24);
xlabel('$x$','Interpreter','latex','FontSize',24);

