close all;
clear;
clc;
%Spring Mass vertical system -- simplests

% ParametersS
sys.m = 1;
sys.k = 10000000;
sys.g = -9.8;
sys.F = 1;
sys.l = 10;


%Time
time.tf = 100;
time.n = 10;
time.h = 1/time.n; 


% initial conditions
p.v= 0.0; 
p.x = 4.0 ; 

init = [p.x, p.v];
zdot = init;

opts.RelTol = 1e-16;
opts.AbsTol = 1e-16;

% Or see opt = odeset for4 all options.
tspan = [0,10];
% Integrate!
[time,zarray] = ode45(@RHS,tspan,init); 
z.x = zarray(:,[1]);
%z.y = zarray(:,[2]);
z.vx = zarray(:,[2]);
%z.vy = zarray(:,[4]);
theta = asin(z.x./sys.l);

z.y = -sys.l.*cos(theta);


%plot(0:time.h:time.n*time.tf,z);
% Plotting stuff
subplot(2,1,1);
hold on;
plot(time,z.x,'b');
%plot(time,z.vx(:,2),'*');
%plot(time,z.vx(:,3),'xm');
%plot(tspan,x);
xlim(tspan);
ylabel('$x$','Interpreter','latex','FontSize',24);

subplot(2,1,2);
hold on;
plot(time,z.vx,'r');
%plot(time,z.vy(:,2),'*');
%plot(time,z.vy(:,3),'xm');
%plot(tspan,v);
xlim(tspan);
ylabel('$\dot{x}$','Interpreter','latex','FontSize',24);
xlabel('$time$','Interpreter','latex','FontSize',24);

% Plotting stuff
figure(2);
% subplot(2,1,1);
hold on;
plot(z.x,z.y,'*b');

%xlim(tspan);
ylabel('$y$','Interpreter','latex','FontSize',24);

% subplot(2,1,2);
% hold on;
% plot(time,z.vy,'r');
% xlim(tspan);
% ylabel('$\dot{p2}$','Interpreter','latex','FontSize',24);
xlabel('$x$','Interpreter','latex','FontSize',24);
