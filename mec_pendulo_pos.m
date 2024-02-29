clc;
clear;
close all;

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
phi = B*sin(omega2*t);

% definição das matrizes posições iniciais
rA = zeros(2,n);
rB = zeros(2,n);

% loop para definir os elementos das matrizes rA e rB ao longo do tempo
for i=1:n
   rA(:,i) = [cos(theta(i)),-sin(theta(i));sin(theta(i)),cos(theta(i))]*[a;0];
   rB(:,i) = rA(:,i) + [cos(phi(i)),-sin(phi(i));sin(phi(i)),cos(phi(i))]*[b;0];
end

% loop para plotar os frames e guardar em M(i)
for i=1:n
    plot([0 rA(1,i) rB(1,i)], [0 rA(2,i) rB(2,i)], rA(1,i), rA(2,i), 'o', rB(1,i), rB(2,i), 'o')
    axis([-3.5 3.5 -3.5 3.5])
    M(i) = getframe;
end

% rodar o filme com os frames obtidos
movie(M)
