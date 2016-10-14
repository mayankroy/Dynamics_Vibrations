function zdot= RHS( t,z )
%System
sys.m1 = 1;
sys.m2 = 1;
sys.m3 = 1;

sys.k = 1;
sys.G = 10;

p1 = z([1 2]);
p2 = z([3 4]);
p3 = z([5 6]);
v1 = z([7 8]);
v2 = z([9 10]);
v3 = z([11 12]);


r12 = p2-p1;
r23 = p3-p2;
r31 = p1-p3;


f12 = sys.G*sys.m1*sys.m2 * r12/(norm(r12)^3);
f23 = sys.G*sys.m2*sys.m3 * r23/(norm(r23)^3);
f31 = sys.G*sys.m3*sys.m1 * r31/(norm(r31)^3);

norm(r12)
norm(r23)
norm(r31)
norm(v1)
norm(v2)
norm(v3)

f21 = -f12;
f32 = -f23;
f13 = -f31;


a1 = (f12 + f13)/sys.m1;
a2 = (f23 + f21)/sys.m2;
a3 = (f32 + f31)/sys.m3;


zdot = [v1;v2;v3;a1;a2;a3];;

end

