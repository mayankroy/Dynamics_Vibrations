close all;
clear;
clc;

% Parameters
sys.m = 1;
sys.k = 1;
sys.g = 10;
sys.c = 0.5;
sys.range  = 2;
%Time

% Set options
sys.odeopt = odeset; % Set ODE45 options options. We pass these in p so ode45
                     % inside of the optimization can see it too.
sys.odeopt.Events = @Event;  % Event function (y==0 when cannonball lands)

opt.opt = optimset('fmincon'); % Set optimization options


opt.lower = [0.1,0];     %theta v0
opt.upper = [pi/2,3e6];  %theta v0 

opt.init = [pi/3,10];

%FMINCON
INIT = fmincon(@optimalAngle,opt.init,[],[],[],[],opt.lower,opt.upper,@Constraint,opt.opt,sys);



tspan = [0,5];

% initial conditions
v = INIT(2);
theta = INIT(1);
p.v= [v*cos(theta) v*sin(theta)]; 
p.x = [0 0]; 

init = [p.x, p.v];
zdot = init;

opts.RelTol = 1e-16;
opts.AbsTol = 1e-16;

% Or see opt = odeset for4 all options.

% Integrate!
[time,zarray] = ode45(@RHS,[0,10],init,sys.odeopt,sys); % Can use many other integrators too (
z.x = zarray(:,[1 2]);
z.v = zarray(:,[3 4]);


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
%plot(time, analytical.y+20,'r');
%plot(time, analytical.x,'.b');

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
%plot(analytical.x,analytical.y+20,'r');
%plot(tspan,v);
%xlim(z.x(:,1));
%axis ([0 5 0 5]);
ylabel('$y$','Interpreter','latex','FontSize',24);
xlabel('$x$','Interpreter','latex','FontSize',24);


