%Metodos numericos
%Polinomios Lagrange
%TecNM, Celaya. Ing Mecanica
%Profe Hector
clear all
clc

%valores
xi = [16 24 32 40];
fi = [9.87 8.418 7.305 6.413];

%valor de busqueda
xp = 27;

%grado de la interpolacion;
n = length(xi) - 1;
q = 1;
fp = 0;

for i = 1:n+1
  for j = 1:n+1
    if j == i
      q = q*1;
    end
    if j ~= i
      q = q*(xp-xi(j))/(xi(i)-xi(j));
    end
  endfor
  fp = fp + q*fi(i);
  q = 1;
endfor
xp
fp