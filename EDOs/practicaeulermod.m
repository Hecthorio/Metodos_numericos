%TecNM de Ceyala
%Ing Mecanica
%Metodos numericos
%Profe Hector
%METODO EULER MODIFICADO

clear all
clc

%Condiciones iniciales
xi = 0;
yi = 2;

%Condicion final
xf = 4;

%tamaño de paso y error
h = 1;
er = 0.1;

%Dar de alta nuestra funcion
f = @(x,y) 4*exp(0.8*x)-0.5*y;

%DE AQUÍ EN ADELANTE COMIENZA EULER MODIFICADO

%prononer contador
n = 2;

for j = xi(1):h:xf
  %evaluar la funcion
  fxy = f(xi(n-1),yi(n-1));
  xi(n) = xi(n-1) + h;

  %calcular yio
  yio = yi(n-1) + fxy*h;

  %valor incial errn
  errn = 1000;

  while errn > er
    %calcular f(xi+1,yi+10)
    fxyo = f(xi(n),yio);

    yi(n) = yi(n-1) + (fxy+fxyo)/2*h;

    %calcular el error
    errn = abs((yi(n)-yio)/yi(n))*100;

    %cambiar el valor de la variable
    yio = yi(n);
  endwhile

  n = n + 1;
endfor

plot(xi,yi,'s')

hold on

%COMPARACION CON LA SOLUCION ANALITICA
n = 2;
y = yi(1); 
x = xi(1);

for i=x(1):0.1:xf+1
  y(n) = 4/1.3*(exp(0.8*i)-exp(-0.5*i))+2*exp(-0.5*i);
  x(n) = i;
  n = n + 1;
endfor

plot(x,y,'ro')
legend(strcat('Euler modificado h=',num2str(h)),'Analitica')