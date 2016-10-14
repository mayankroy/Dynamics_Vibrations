IC = [0 0.1 0 0]; % Initial guess for [x0 y0 vx0 vy0]
periodguess = 34;  % Initial guess for period

%ODE SOLUTION ACCURACY
options = odeset('RelTol', 1e-8, 'AbsTol',1e-8);

%How good is the initial guess?
initialdefect = error([ICguess  periodguess])

%Solve for orbit using initial guess
[tarray zarray] = ode45(@rhs,[0 periodguess],ICguess, options);
x = zarray(:,1);  y = zarray(:,2);
plot(x,y,':','LineWidth',3);hold on;
%Plot start and end points
plot(x([1 end]),y([1 end]),'.','MarkerSize',40)
axis('equal'); 

%USE FSOLVE to find a periodic orbit
root = fsolve(@error,[ICguess periodguess]);
ICroot     = root(1:4); % First 4 parameters are ICs
periodroot = root(5);   % Last parameter is the period

%Show final periodic orbit
[tarray zarray] = ode45(@rhs,[0 periodroot],ICroot, options);
x = zarray(:,1);  y = zarray(:,2);
plot(x,y,'LineWidth',5)
%Mark first and last points
plot(x([1 end]),y([1 end]),'.','MarkerSize',40)
axis('equal')
title('Trajectory of guess and of ''periodic'' solution')
xlabel('x'); ylabel('y');
legend('Motion from given initial guess', 'First and last points','Final solution')
shg  % Show graph


%GOODNESS OF RESULT (want all zeros
initialdefect  % show goodness of initial guess
error(root)    % show goodness of Fsolve root



hold off;
