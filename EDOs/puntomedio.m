%TecNM, Celaya
%Ing Mecanica
%Métodos numericos
%22/05/20
%Método de punto medio (RK2)
%método para solucionar EDOs

clear all
clc

%condiciones iniciales
xo = 0; 
yo = 1;

%tamaño de paso
h = 0.5;

%valor final
xf = 4;

%dar de alta la funcion como una funcion anonima
f = @(x,y) -2*x^3+12*x^2 -20*x+8.5;

%COMENZAR CON EL ALGORTIMO

xi = xo;
yi = yo;
n = 1;

for i = xo:h:xf-h
  k1 = f(xi(n),yi(n));
  k2 = f(xi(n)+0.5*h,yi(n)+0.5*k1*h);
  yi(n+1) = yi(n) + k2*h;
  xi(n+1) = xi(n) + h;
  n = n + 1;
endfor

%graficar
plot(xi,yi,'ro')
hold on

%COMPARAR CON LA SOLUCION ANALITICA

n = 1;
y = yo;
x = xo;

for i = h:h:xf
 y(n+1) = -(i^4)/2+4*i^3-10*i^2+8.5*i+1;
 x(n+1) = i;
 n = n + 1;
endfor

plot(x,y,'-')
legend('Punto medio','Real')