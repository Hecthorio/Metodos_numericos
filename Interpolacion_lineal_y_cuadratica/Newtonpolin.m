%Interpolación por diferencias divividas de Newton
%Profe Hecthorio
%27/03/2020
%TecNM Celaya
%Metodos numericos

clear all
clc

%matriz de datos (recordar que el numero de datos debe ser uno mas que el numero del polinomio
x =[1 4 5 6];
y =[log(1) log(4) log(5) log(6)];

%grado del polinomio (numero de datos -1)
n = length(x);

%valor que x del cual se buscara y
xi = 2;

%generar una matriz donde guardar datos
Z = zeros(n,n);

%agregar los valores de y en la columna 1
Z(:,1) = y;

m = 1;
for i = 2:n
  for j = 1:n-m
    Z(j,i)= (Z(j,i-1)-Z(j+1,i-1))/(x(j)-x(j+i-1));
  endfor
  m = m + 1;
endfor

v = zeros(n,1);
for i = 2:n
  if i == 2
    v(i) = xi-x(i-1);  
  else
    v(i) = v(i-1)*(xi-x(i-1));
  end
endfor

%multiplicar cada uno de los terminos
yi = Z(1,:)*v