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
thetapp = -A*omega*omega*sin(omega*t);
phi = B*sin(omega2*t);
phip = B*omega2*cos(omega2*t);
phipp = -B*omega*omega*sin(omega2*t);


% definição das matrizes posições iniciais
rApp = zeros(2,n);
rBpp = zeros(2,n);

for i=1:n
     rApp(:,i) = thetapp(i)*[0,-1;1,0]*[cos(theta(i)),-sin(theta(i));sin(theta(i)),cos(theta(i))]*[a;0] - (thetap(i)^2)*([cos(theta(i)),-sin(theta(i));sin(theta(i)),cos(theta(i))]*[a;0]);
     rBpp(:,i) = rApp(:,i) + phipp(i)*[0,-1;1,0]*[cos(phi(i)),-sin(phi(i));sin(phi(i)),cos(phi(i))]*[b;0] - (phip(i)^2)*([cos(phi(i)),-sin(phi(i));sin(phi(i)),cos(phi(i))]*[b;0]);
end

for i=1:n
   plot([0 rApp(1,i) rBpp(1,i)],[0 rApp(2,i) rBpp(2,i)])
   axis([-300 300 -250 250]);
   M(i) = getframe;
end

movie(M)

