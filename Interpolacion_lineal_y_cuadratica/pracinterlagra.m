%Interpolación Diferencias divididas de Newton
%TecNM Celaya
%Ing Mecanica
%Metodos numericos
%Profe Hector
clear all
clc

%Datos para hacer interpolación
xi = [16 24 32 40];
fi = [9.87 8.418 7.305 6.413];

%para que valor de x quieres obtener el fi
xp = 27;

%grado de interpolacion
n = length(xi)-1;

%generar matriz donde guardar las diferencias dividivas
Z = zeros(n+1);
Z(:,1) = fi;
m = 0;

for i = 1:n
  for j = 1:n - m
    Z(j,i+1)= (Z(j+1,i)-Z(j,i))/(xi(j+i)-xi(j));
  endfor
  m = m + 1;
endfor

%vector de valores b
b = Z(1,:);

xx = 0;
x = zeros(1,n+1);
x(1,1) = 1;

%para obtener el vector de valores de x
for i = 1:n
  xx = x(i)*(xp-xi(i));
  x(i+1) = xx;
endfor

%transponer x para hacer operacion
x = x';
%multiplicamos matrices
fp = b*x;
