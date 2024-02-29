% definição das primeiras variáveis
a = 2;
b = 1;
t = 0:0.01:4;
n = length(t);
A = 2;
B = 3;
omega = 4; 
omega2 = 5;

% definição das funções dos ângulos
theta = A*sin(omega*t);
thetap = A*omega*cos(omega*t);
phi = B*sin(omega2*t);
phip = B*omega2*cos(omega2*t);

% definição das matrizes posições iniciais
rAp = zeros(2,n);
rBp = zeros(2,n);

for i=1:n
     rAp(:,i) = thetap(i)*[0,-1;1,0]*[cos(theta(i)),-sin(theta(i));sin(theta(i)),cos(theta(i))]*[a;0];
     rBp(:,i) = rAp(:,i) + phip(i)*[0,-1;1,0]*[cos(phi(i)),-sin(phi(i));sin(phi(i)),cos(phi(i))]*[b;0];
end

for i=1:n
   plot([0 rAp(1,i) rBp(1,i)],[0 rAp(2,i) rBp(2,i)])
   axis([-20 20 -20 20]);
   M(i) = getframe;
end

movie(M)

