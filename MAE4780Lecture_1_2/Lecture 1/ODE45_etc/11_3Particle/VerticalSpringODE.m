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
p.v= [0.993240737/2 0.886473146/2 -0.993240737/2 -0.886473146/2 0.993240737 0.886473146]; 
p.x = [0.997000436 0.224308753 0.97000436 0.24308753 0 0]; 

init = [p.x, p.v];
zdot = init;

opts.RelTol = 1e-16;
opts.AbsTol = 1e-16;

% Or see opt = odeset for4 all options.
tspan = [0,10];
% Integrate!
[time,zarray] = ode45(@RHS,tspan,init); % Can use many other integrators too (
z.x = zarray(:,[1 3 5]);
z.y = zarray(:,[2 4 6]);
z.vx = zarray(:,[7 9 11]);
z.vy = zarray(:,[8 10 12]);



%plot(0:time.h:time.n*time.tf,z);
% Plotting stuff
subplot(2,1,1);
hold on;
plot(time,z.vx(:,1),'r');
plot(time,z.vx(:,2),'*');
plot(time,z.vx(:,3),'xm');
%plot(tspan,x);
xlim(tspan);
ylabel('$x$','Interpreter','latex','FontSize',24);

subplot(2,1,2);
hold on;
plot(time,z.vy(:,1),'r');
plot(time,z.vy(:,2),'*');
plot(time,z.vy(:,3),'xm');
%plot(tspan,v);
xlim(tspan);
ylabel('$\dot{x}$','Interpreter','latex','FontSize',24);
xlabel('$time$','Interpreter','latex','FontSize',24);

%tracking stuff
figure(2);
subplot(3,1,1);
hold on;
plot(z.x(:,1),z.y(:,2),'r');
ylabel('$y$','Interpreter','latex','FontSize',24);
xlabel('$x$','Interpreter','latex','FontSize',24);

subplot(3,1,2);
hold on;
plot(z.x(:,2),z.y(:,2),'*');
ylabel('$y$','Interpreter','latex','FontSize',24);
xlabel('$x$','Interpreter','latex','FontSize',24);

subplot(3,1,3);
hold on;
plot(z.x(:,3),z.y(:,3),'xm');
ylabel('$y$','Interpreter','latex','FontSize',24);
xlabel('$x$','Interpreter','latex','FontSize',24);

