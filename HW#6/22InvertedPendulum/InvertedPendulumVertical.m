close all;
clear;
clc;


syms t real

% Parameters
sys.m = 1;
sys.k = 1;
sys.g = 10;
sys.c = 0.5;
sys.range  = 2;
sys.l = 1;
%sys.a = 1000*sin(10*t);
%Time
tspan = [0,20];


% initial conditions
p.thetadot=0; 
p.theta = 0.15; 

init = [p.theta, p.thetadot];

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
plot(time,z.x.*(180/pi));
%plot(tspan,x);
xlim(tspan);
ylabel('$theta$','Interpreter','latex','FontSize',24);

subplot(2,1,2);
plot(time,z.v.*(180/pi));
%plot(tspan,v);
xlim(tspan);
ylabel('$\dot{theta}$','Interpreter','latex','FontSize',24);
xlabel('$time$','Interpreter','latex','FontSize',24);

%tracking stuff
figure(2);
hold on;
plot(sys.l.*sin(z.x),sys.l.*cos(z.x),'*');
%plot(analytical.x,analytical.y+20,'r');
%plot(tspan,v);
%xlim(z.x(:,1));
%axis ([-10 20 -10 20]);
ylabel('$y$','Interpreter','latex','FontSize',24);
xlabel('$x$','Interpreter','latex','FontSize',24);

