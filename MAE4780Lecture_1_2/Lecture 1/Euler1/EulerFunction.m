function z = EulerFunction(time,p,sys)

z.x=[ ];
z.v=[ ];

for i=0:time.h:time.n*time.tf 
  a = -(sys.k/sys.m)*p.x + sys.g/sys.m; % F = ma
  p.x = p.x + time.h * p.v; % Update position.
  p.v = p.v + time.h * a; % Update velocity.
  z.x = [z.x p.x]; % Concatenate the results.
  z.v = [z.v p.v]; % Concatenate the results.
  
end

end