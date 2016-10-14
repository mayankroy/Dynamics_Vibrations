close all;
clear;
clc;
%Spring Mass vertical system -- simplests

% Parameters
sys.m1 = 1;
sys.m2 = 1;
sys.m3 = 1;

sys.k = 1;
sys.G = 10;


%Time
time.tf = 100;
time.n = 10;
time.h = 1/time.n; 


% initial conditions
p.r = 1.5;
p.x = [p.r*cosd(30) -p.r*sind(30) 0 p.r -p.r*cosd(30) -p.r*sind(30)]; 
p.d = 3;
p.w = 1.5*sqrt(8*sys.G*sys.m1/(sqrt(3)*p.d^3));
p.v= [p.w*sind(30)  p.w*cosd(30) -p.w 0 p.w*sind(30) -p.w*cosd(30)];


init = [p.x, p.v];
zdot = init;

opts.RelTol = 1e-16;
opts.AbsTol = 1e-16;

% Or see opt = odeset for4 all options.
tspan = [0,2];
% Integrate!
[time,zarray] = ode45(@RHSd,tspan,init); % Can use many other integrators too (
z.p1 = zarray(:,[1 2]);
z.p2 = zarray(:,[3 4]);
z.p3 = zarray(:,[5 6]);
z.v1 = zarray(:,[7 8]);
z.v2 = zarray(:,[9 10]);
z.v3 = zarray(:,[11 12]);



%plot(0:time.h:time.n*time.tf,z);
% Plotting stuff
subplot(2,1,1);
hold on;
plot(time,z.p1(:,1),'r');
plot(time,z.p2(:,1),'*');
plot(time,z.p3(:,1),'xm');
%plot(tspan,x);
xlim(tspan);
ylabel('$x$','Interpreter','latex','FontSize',24);

subplot(2,1,2);
hold on;
plot(time,z.v1(:,1),'r');
plot(time,z.v2(:,1),'*');
plot(time,z.v3(:,1),'xm');
%plot(tspan,v);
xlim(tspan);
ylabel('$\dot{x}$','Interpreter','latex','FontSize',24);
xlabel('$time$','Interpreter','latex','FontSize',24);

%tracking stuff
figure(2);
% subplot(3,1,1);
hold on;
plot(z.p1(:,1),z.p1(:,2),'r');
ylabel('$y$','Interpreter','latex','FontSize',24);
xlabel('$x$','Interpreter','latex','FontSize',24);

% subplot(3,1,2);
% hold on;
plot(z.p2(:,1),z.p2(:,2),'*');
ylabel('$y$','Interpreter','latex','FontSize',24);
xlabel('$x$','Interpreter','latex','FontSize',24);

% subplot(3,1,3);
% hold on;
plot(z.p3(:,1),z.p3(:,2),'xm');
ylabel('$y$','Interpreter','latex','FontSize',24);
xlabel('$x$','Interpreter','latex','FontSize',24);

