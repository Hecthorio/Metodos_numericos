%diferencias finitas
%04/03/2020

clear all
clc

%temperaturas alrededor de la placa
T1=250;
T2=450;
T3=10;
T4=500;

%numero de nodos
n = 50;

%acomodar temperaturas en 
T = zeros(n);
T(1,:) = T2;
T(end,:) = T4;
T(:,1) = T1;
T(:,end) = T3;

%resolver por metodo Jacovi
for k = 1:100
  for i = 2:n-1
    for j=2:n-1
      T(i,j) = (T(i-1,j)+T(i+1,j)+T(i,j-1)+T(i,j+1))/4;
    endfor
  endfor
  pcolor(T)
  pause(1)
  hold
endfor

%pcolor(T)