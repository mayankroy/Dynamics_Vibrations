close all;
clear;
clc;
%Spring Mass vertical system -- simplests

% ParametersS



%Time
time.tf = 100;
time.n = 10;
time.h = 1/time.n; 


% initial conditions
p.v= [0 -0]; 
p.x = [0 10]; 

init = [p.x, p.v];
zdot = init;

opts.RelTol = 1e-16;
opts.AbsTol = 1e-16;

% Or see opt = odeset for4 all options.
tspan = [0,10];
% Integrate!
[time,zarray] = ode45(@RHS,tspan,init); % Can use many other integrators too (
z.x = zarray(:,[1]);
z.y = zarray(:,[2]);
z.vx = zarray(:,[3]);
z.vy = zarray(:,[4]);



%plot(0:time.h:time.n*time.tf,z);
% Plotting stuff
subplot(2,1,1);
hold on;
plot(time,z.x-(z.x+z.y)./2,'b');
%plot(time,z.vx(:,2),'*');
%plot(time,z.vx(:,3),'xm');
%plot(tspan,x);
xlim(tspan);
ylabel('$p1$','Interpreter','latex','FontSize',24);

subplot(2,1,2);
hold on;
plot(time,z.vx,'r');
%plot(time,z.vy(:,2),'*');
%plot(time,z.vy(:,3),'xm');
%plot(tspan,v);
xlim(tspan);
ylabel('$\dot{p1}$','Interpreter','latex','FontSize',24);
xlabel('$time$','Interpreter','latex','FontSize',24);

% Plotting stuff
figure(2);
subplot(2,1,1);
hold on;
plot(time,z.y,'b');

xlim(tspan);
ylabel('$p2$','Interpreter','latex','FontSize',24);

subplot(2,1,2);
hold on;
plot(time,z.vy,'r');
xlim(tspan);
ylabel('$\dot{p2}$','Interpreter','latex','FontSize',24);
xlabel('$time$','Interpreter','latex','FontSize',24);
