%TecNM Celaya
%Ing. Mecanica
%Metodos numericos
%Profe Hecthorio
%Método de Euler

clear all
clc

%declarar nuestra condiciones iniciales
xi = 0; 
yi = 1;

%declarar el tamaño de paso
h = 0.1;

%declarar el punto final
xf = 4;

%agregar la ecuacion diferencial
f = @(x,y) -2*x^3+12*x^2-20*x+8.5;

%COMENZAR EL METODO EULER

%contador
n = 2;

for i=xi:h:xf
  fxy = f(xi(n-1),yi(n-1));
  yi(n) = yi(n-1) + h*fxy;
  xi(n) = xi(n-1) + h;
  n = n + 1;
endfor

plot(xi,yi,'o')
hold on

%SOLUCION ANALITICA
n = 2;
y = yi(1);
x = xi(1);
for i = xi(1):0.1:xf
  y(n) = -(i^4)/2+4*i^3-10*i^2+8.5*i+1;
  x(n) = i;
  n = n + 1;
endfor

plot(x,y,'ro')

legend(strcat('Euler h=',num2str(h)),'Analitica')