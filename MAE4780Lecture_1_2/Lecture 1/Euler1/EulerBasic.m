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
time.tf = 100;
time.n = 80;
time.h = 1/time.n; 


% initial conditions
v=0; 
x = 0; 
z.x=[ ];
z.v=[ ];

for i=0:time.h:time.n*time.tf 
  a = -(sys.k/sys.m)*x + sys.g/sys.m; % F = ma
  x = x + time.h * v; % Update position.
  v = v + time.h * a; % Update velocity.
  z.x = [z.x x]; % Concatenate the results.
  z.v = [z.v v]; % Concatenate the results.
  
end

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