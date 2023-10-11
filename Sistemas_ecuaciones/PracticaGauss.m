%Eliminación Gaussiana
%05/03/2020
%Héctor Olmos
%metodos numericos

%limpian la pantalla de comandos y las variables
clear all
clc

x=[3 -0.1 -0.2 7.85
  0.1 7 -0.3 -19.3
  0.3 -0.2 10 71.4];
  
[fila colum] = size(x);

%nomalización de la matriz
for i=1:fila
  x(i,:)=x(i,:)/x(i,i);
endfor

%eliminacion hacia adelante
for j=1:fila-1
  for i=j+1:fila
    x(i,:)=x(i,:)-x(j,:)*x(i,j)/x(j,j);
  endfor
endfor

%eliminación hacia atras
for j = fila:-1:1
  for i = j-1:-1:1
    x(i,:)=x(i,:)-x(j,:)*x(i,j)/x(j,j);
  endfor
endfor

%nomalización de la matriz
for i=1:fila
  x(i,:)=x(i,:)/x(i,i);
endfor