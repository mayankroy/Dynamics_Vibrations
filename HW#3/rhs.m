function zdot = rhs(t,z)
%Unpack
r = z(1:2);  % x  and y   position
v = z(3:4);  % vx and vy  velocity

%Central force. Assume unit mass and any
%free constant is set to 1 in consistent units

%ODEs
rdot = v;               % First Two Equations

%Various force laws for 2nd two equations
vdot = -r/norm(r);     %  constant force
%vdot = -r;             %  zero-rest-length spring
%vdot = -r/norm(r)^3;    % inverse square gravity

%packup again
zdot = [rdot;vdot];
end

