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
p.y = -(sys.l*cos(asin(p.x/sys.l)));
p.theta = asin(p.x/sys.l);
p.v = 0;
init = [p.x, p.y,  -p.v*cos(asin(p.x/sys.l)),  -p.v*p.x/sys.l,p.theta , 0];
zdot = init;

opts.RelTol = 1e-16;
opts.AbsTol = 1e-16;

% Or see opt = odeset for4 all options.
tspan = [0,10];
% Integrate!
[time,zarray] = ode45(@RHS,tspan,init); 
z.x = zarray(:,1);
z.y = zarray(:,2);
z.vx = zarray(:,3);
z.vy = zarray(:,4);

z.xtheta = sys.l.*sin(zarray(:,5));

deviation = z.xtheta - z.x;

%plot(0:time.h:time.n*time.tf,z);
% Plotting stuff
subplot(2,1,1);
hold on;
plot(time,z.x,'b');
plot(time,z.y,'r');
plot(time,z.xtheta,'g')
plot(time,deviation,'m');
%plot(time,z.vx(:,3),'xm');
%plot(tspan,x);
xlim(tspan);
ylabel('$x$','Interpreter','latex','FontSize',24);

subplot(2,1,2);
hold on;
plot(time,z.vx,'b');
plot(time,z.vy,'r');
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
