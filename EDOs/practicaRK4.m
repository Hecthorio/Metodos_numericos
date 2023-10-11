%TecNM Celaya
%Ing Mecanica
%Métodos numericos
%Profe Hecthorio
%01/06/2020
%En este script resuleve EDO's a partir de RK4.

clear all
clc

%condiciones inciciales
yo = 0; 
xo = 0;

%valor del tamaño de paso
h = 1;

%valor final
xf = 2;

%Funcion anonima, EDO
f = @(x,y) 0.5*12*100*(20-2.5)*(20-x)/(100-2.5*x);

%DE AQUÍ EN ADELANTE YA COMIENZA EL MÉTODO RK4

xi = xo;
yi = yo;
n = 1;

for i = h:h:xf
  k1 = f(xi(n),yi(n));
  k2 = f(xi(n)+0.5*h,yi(n)+0.5*k1*h);
  k3 = f(xi(n)+0.5*h,yi(n)+0.5*k2*h);
  k4 = f(xi(n)+h,yi(n)+k3*h);
  yi(n+1)= yi(n)+h/6*(k1+2*k2+2*k3+k4);
  xi(n+1)= xi(n)+h;
  n = n + 1;
endfor

plot(xi,yi,'o')
