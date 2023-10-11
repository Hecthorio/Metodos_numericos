%TecNM, Celaya
%Ing Mecanica
%Métodos numericos
%Prof. Héctor
%Método de Ralston (RK2)
%Método para solución de EDOs
%22/05/2020

clear clc
clc

%Dar de alta condiciones iniciales
xo = 0;
yo = 1;

%dar de alta tamaño de paso
h = 0.5;

%valor de final de la integracion
xf = 4;

%dar de alta nuestra funcion anonima
f = @(x,y) -2*x^3+12*x^2-20*x+8.5;

%COMENZAR CON EL ALGORITMO

xi = xo;
yi = yo;
n = 1;

for i = h:h:xf
  k1 = f(xi(n),yi(n));
  k2 = f(xi(n)+3/4*h,yi(n)+3/4*k1*h);
  yi(n+1) = yi(n)+ (k1/3+2*k2/3)*h;
  xi(n+1) = xi(n) + h ;
  n = n + 1;
endfor

plot(xi,yi,'rs')
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
legend('Ralston','Real')