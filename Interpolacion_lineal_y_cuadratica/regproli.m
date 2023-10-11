%TecMN Celaya
%Ing Mecanica
%Métodos numericos
%Regresión polinomial
clear all
clc

%Aquí se agregan los datos
x =[0 1 2 3 4 5];
y =[2.1 7.7 13.6 27.2 40.9 61.1];

%aquí se pone el orden polinomio
m = 3;

%numero de datos
n = length(x);

xi = zeros(1,m*2);
xi(1,1) = n; 

for i = 2:m*2 + 1
  xi(1,i) = sum(x.^(i-1)); 
endfor

yi = zeros(1,m+1);
x = x';
for i = 1:m+1
  yi(1,i) = y*x.^(i-1);
endfor

M = zeros(m+1,m+2);
w = 0;
for i = 1:m+1
  for j = 1:m+1
    M(i,j) = xi(j+w);
  endfor
  w = w + 1;
endfor

yi = yi';
M(:,end) = yi;

%DE AQUI PARA ADELANTE ES GAUSS-SEIDEL

%matriz a solucionar
H=M;

%comando size regresa el numero
%de filas y columnas
[fil colu]=size(H);

%valores iniciales
x=zeros(1,fil);
x=x';

%gauss-seidel
error1=10; %valor inicial error (arbitrario)
xo=x; %valores anteriores
n = 0;
while error1>0.00001
  for i = 1:fil
    x(i,1)=(H(i,end)-H(i,1:end-1)*x+H(i,i)*x(i,1))/H(i,i);
  endfor
  error1=sum(abs((x-xo)./x*100));
  xo=x;
  n = n + 1;
end
xo