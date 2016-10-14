close all;
clear;
clc;
%Spring Mass vertical system -- simplests

% Parameters

%System
sys.m = 1;
sys.k = 1;
sys.g = -9.8;

%Time
time.tf = 10;
time.n = 5;
time.h = 1/time.n; 


% initial conditions
p.v=0; 
p.x = 0; 


z = EulerFunction(time,p,sys);

%plot(0:time.h:time.n*time.tf,z);
% Plotting stuff
subplot(2,1,1);
plot(0:time.h:time.n*time.tf,z.x);
%plot(tspan,x);
xlim([0,time.tf]);
ylabel('$x$','Interpreter','latex','FontSize',24);

subplot(2,1,2);
plot(0:time.h:time.n*time.tf,z.v);
%plot(tspan,v);
xlim([0,time.tf]);
ylabel('$\dot{x}$','Interpreter','latex','FontSize',24);
xlabel('$time$','Interpreter','latex','FontSize',24);