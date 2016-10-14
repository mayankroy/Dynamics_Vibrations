close all;
clear;
clc;
%Spring Mass vertical system -- simplests

% Parameters



%Time
time.tf = 100;
time.n = 10;
time.h = 1/time.n; 


% initial conditions
p.v=0; 
p.x = 0; 

init = [p.x, p.v];
zdot = init;

opts.RelTol = 100;
opts.AbsTol = 10;

% Or see opt = odeset for4 all options.
tspan = [0,100];
% Integrate!
[time,zarray] = ode45(@RHS,tspan,init); % Can use many other integrators too (
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



