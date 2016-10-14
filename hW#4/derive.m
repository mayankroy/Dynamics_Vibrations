clear all; close all;

% Setup variables
syms t m phi phidot theta thetadot real
r = 1;
px = 0;
py = 0;


%Moving particles
mb1 = ([2 + r*cos(theta),r*sin(theta),0]'); 
mb2 = ([-2 - r*cos(theta),-r*sin(theta),0]');

%Welded particles
mb3 = [0,2,0]'; 
mb4 = [0,-2,0]'; 

%Moving plate and frame F wrt M
fTm = [cos(phi) -sin(phi) 0 ; sin(phi) cos(phi) 0; px py 1];

%Postion of particles in world frame F
fb1 = fTm*mb1
fb2 = fTm*mb2;
fb3 = fTm*mb3;
fb4 = fTm*mb4;

%Velocity of particles in world frame F


v1 = jacobian(fb1,[t, phi, theta])*[1,phidot, thetadot]' % Mass chain rule to get d/dt of the positions.
v2 = jacobian(fb2,[t,phi, theta])*[1,phidot, thetadot]';
%Welded particles
v3 = jacobian(fb3,phi)*phidot; 
v4 = jacobian(fb4,phi)*phidot;



%Angular momentum
h1 = cross(fb1,m*v1);
h2 = cross(fb2,m*v2);
%welded particles
h3 = cross(fb3,m*v3);
h4 = cross(fb4,m*v4);

%phidot in terms of theta.
phidot_inTheta = simplify(solve(h1 + h2 + h3 + h4,phidot)) 

%paramterisation of theta and theta dot
theta = (1 - cos(t))*pi;
thetadot = jacobian(theta,t);

%phidot in theta
phidot_inTime = simplify(eval(phidot_inTheta)); 


positions = eval([fb1(1:2)',fb2(1:2)',fb3(1:2)',fb4(1:2)']);

t = transpose(0:0.01:1*pi); % Time interval.
phi_dot = subs(phidot_inTime) % Evaluate phidot using the function we wrote in derive.m
phi_dot = simplify(phi_dot);

phi = eval(cumtrapz(t,phi_dot)) % Integrate angular rate over time to get phi. No ode45 required!
theta = eval(theta)
positions = eval(positions) % Get positions of all the particles (written in derive.m).


%% Plotting/animation
fig = figure;
%fig.Position = [100,100,1200,1000];
axis(2*[-4,4,-5.5,5.5]);
% Animation of plate

for time = 1:size(t,1)
    
    time
    pause(0.01);
hold off
axis(2*[-4,4,-5.5,5.5]);

plot(positions(time,1),positions(time,2),'.','MarkerSize',40)% The 4 masses
axis(2*[-4,4,-5.5,5.5]);

hold on
axis(2*[-4,4,-5.5,5.5]);

plot(positions(time,3),positions(time,4),'.','MarkerSize',40)
plot(positions(time,5),positions(time,6),'.','MarkerSize',40)
plot(positions(time,7),positions(time,8),'.','MarkerSize',40)

end


z.x = positions(:,1);
z.y = positions(:,2);
z.vx = positions(:,5);
z.vy = positions(:,6);



%plot(0:time.h:time.n*time.tf,z);
% Plotting stuff
subplot(2,1,1);
hold on;
plot(t,z.x,'b');
plot(t,z.vx,'*');
%plot(time,z.vx(:,3),'xm');
%plot(tspan,x);
%xlim(t);
ylabel('$b1x,b3x$','Interpreter','latex','FontSize',24);

subplot(2,1,2);
hold on;
plot(t,z.y,'r');
plot(t,z.vy,'*');
%plot(time,z.vy(:,3),'xm');
%plot(tspan,v);
%xlim(t);
ylabel('$b1y,b3y$','Interpreter','latex','FontSize',24);
xlabel('$time$','Interpreter','latex','FontSize',24);

% Plotting stuff
figure(2);
subplot(2,1,1);
hold on;
plot(t,phi,'b');

%xlim(time);
ylabel('$phi$','Interpreter','latex','FontSize',24);

subplot(2,1,2);
hold on;
plot(t,theta,'r');
%xlim(time);
ylabel('$\dot{theta}$','Interpreter','latex','FontSize',24);
xlabel('$time$','Interpreter','latex','FontSize',24);
% Write two functions.
%matlabFunction(positions,'file','positions');
%matlabFunction(phidot_inTime,'file','phidot');


