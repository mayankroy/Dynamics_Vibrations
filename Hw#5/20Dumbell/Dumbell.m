close all;
clear;
clc;


syms t real

% Parameters
sys.m1 = 1;
sys.m2 = 1;
sys.k = 1;
sys.g = 10;
sys.c = 4;
sys.range  = 2;
sys.l = 10;
%sys.a = 1000*sin(10*t);
%Time
tspan = [0,0.7];


% initial conditions
p.v1=[0 5]; 
p.v2=[0 -5];
p.p1 = [-5 0]; 
p.p2 = [5 0]
init = [p.p1, p.p2, p.v1, p.v2];

%ode options
sys.odeopt = odeset; 
%sys.odeopt.RelTol = 1e-16;
%sys.odeopt.AbsTol = 1e-16;



% Integrate!
[time,zarray] = ode45(@RHS,tspan,init,sys.odeopt,sys); % Can use many other integrators too (
z.p1 = zarray(:,[1 2]);
z.p2 = zarray(:,[3 4]);
z.v1 = zarray(:,[5 6]);
z.v2 = zarray(:,[7 8]);




%plot(0:time.h:time.n*time.tf,z);
% Plotting stuff
subplot(2,1,1);
plot(time,z.p1(:,1),'*r');
%plot(time,z.p1(:,2),'*b');
xlim(tspan);
ylabel('$position(x)$','Interpreter','latex','FontSize',24);

subplot(2,1,2);
plot(time,z.v1(:,1),'*r');
%plot(time,z.v1(:,2),'*b');
xlim(tspan);
ylabel('$\dot{x}$','Interpreter','latex','FontSize',24);
xlabel('$time$','Interpreter','latex','FontSize',24);

%tracking stuff
figure(2);
hold on;
plot(z.p1(:,1),z.p1(:,2),'r');
plot(z.p2(:,1),z.p2(:,2),'b');
%plot(analytical.x,analytical.y+20,'r');
%plot(tspan,v);
%xlim(z.x(:,1));
%axis ([-10 20 -10 20]);
ylabel('$y$','Interpreter','latex','FontSize',24);
xlabel('$x$','Interpreter','latex','FontSize',24);

