close all;
clear;
clc;
%Spring Mass vertical system -- simplests

% Parameters
sys.m = 1;
sys.k = 1;
sys.g = 9.8;
sys.c = 1;


%Time
time.tf = 100;
time.n = 10;
time.h = 1/time.n; 


% initial conditions
p.v= [10 10]; 
p.x = [0 0]; 

init = [p.x, p.v];
zdot = init;

opts.RelTol = 1e-16;
opts.AbsTol = 1e-16;

% Or see opt = odeset for4 all options.
tspan = [0,15];
% Integrate!
[time,zarray] = ode45(@RHS,tspan,init); % Can use many other integrators too (
z.x = zarray(:,[1 2]);
z.v = zarray(:,[3 4]);

analytical.x = sys.m/sys.c * p.v(1)*(1- exp(-sys.c/sys.m*time));
analytical.y = - ((sys.m * sys.g*time)/sys.c) - (sys.m/sys.c) * (p.v(2) +  ((sys.m * sys.g)/sys.c))*(exp(-(sys.c*time)/sys.m));

%plot(0:time.h:time.n*time.tf,z);
% Plotting stuff
figure(1);
subplot(2,1,1);
hold on;
plot(time,z.x(:,1),'r');
plot(time,z.x(:,2),'.b');
%plot(tspan,x);
xlim(tspan);
ylabel('$x$','Interpreter','latex','FontSize',24);
plot(time, analytical.y+20,'r');
plot(time, analytical.x,'.b');

subplot(2,1,2);
hold on;
plot(time,z.v(:,1),'r');
plot(time,z.v(:,2),'.b');
%plot(tspan,v);
xlim(tspan);
ylabel('$\dot{x}$','Interpreter','latex','FontSize',24);
xlabel('$time$','Interpreter','latex','FontSize',24);


%tracking stuff
figure(2);
hold on;
plot(z.x(:,1),z.x(:,2),'*');
plot(analytical.x,analytical.y+20,'r');
%plot(tspan,v);
%xlim(z.x(:,1));
%axis ([0 5 0 5]);
ylabel('$y$','Interpreter','latex','FontSize',24);
xlabel('$x$','Interpreter','latex','FontSize',24);


