%Interpolación por interpolacion de Lagrange
%Profe Hecthorio
%27/03/2020
%TecNM Celaya
%Metodos numericos

clear all
clc

%matriz de datos (recordar que el numero de datos debe ser uno mas que el numero del polinomio
x =[1 4 6];
y =[log(1) log(4) log(6)];

%grado del polinomio (numero de datos -1)
n = length(x)-1;

%valor que x del cual se buscara y
xi = 2;

yi = 0;
m = 1; %contador
for i = 1:n+1
  v = 1;
  for j = 1:n
    if i == j
      m = m + 1;
      v = v*(xi-x(m))/(x(i)-x(m));
      m = m + 1;
    end
    if i ~= j 
      v = v*(xi-x(m))/(x(i)-x(m));
      m = m + 1;
    end
  end
  yi = yi + v*y(i);
  m = 1;
end
yi
log(2)