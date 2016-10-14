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
p.v= [5 4 -10]; 
p.x = [3 3 2]; 

init = [p.x, p.v];
zdot = init;

opts.RelTol = 100;
opts.AbsTol = 10;

% Or see opt = odeset for4 all options.
tspan = [0,100];
% Integrate!
[time,zarray] = ode45(@RHS,tspan,init); % Can use many other integrators too (
z.x = zarray(:,[1 2 3]);
z.v = zarray(:,[4 5 6]);



%plot(0:time.h:time.n*time.tf,z);
% Plotting stuff
subplot(2,1,1);
hold on;
plot(time,z.x(:,1),'r');
plot(time,z.x(:,2),'*');
plot(time,z.x(:,3),'xm');
%plot(tspan,x);
xlim(tspan);
ylabel('$x$','Interpreter','latex','FontSize',24);

subplot(2,1,2);
hold on;
plot(time,z.v(:,1),'r');
plot(time,z.v(:,2),'*');
plot(time,z.v(:,3),'xm');
%plot(tspan,v);
xlim(tspan);
ylabel('$\dot{x}$','Interpreter','latex','FontSize',24);
xlabel('$time$','Interpreter','latex','FontSize',24);

%tracking stuff
figure(2);
subplot(3,1,1);
hold on;
plot(z.x(:,1),z.x(:,2),'r');
ylabel('$y$','Interpreter','latex','FontSize',24);
xlabel('$x$','Interpreter','latex','FontSize',24);

subplot(3,1,2);
hold on;
plot(z.x(:,3),z.x(:,2),'*');
ylabel('$y$','Interpreter','latex','FontSize',24);
xlabel('$z$','Interpreter','latex','FontSize',24);

subplot(3,1,3);
hold on;
plot(z.x(:,3),z.x(:,1),'xm');
ylabel('$x$','Interpreter','latex','FontSize',24);
xlabel('$z$','Interpreter','latex','FontSize',24);

