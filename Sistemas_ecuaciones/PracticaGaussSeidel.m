%Metodo de Gauss Seidel
%TecNM Celaya
%12/03/2020
%Nombre alumno: Hecthorio

clear all
clc

%matriz a solucionar
H=[6	15	55	152.6
15	55	225	585.6
55	225	979	2488.8];

%comando size regresa el numero
%de filas y columnas
[fil colu]=size(H);

%valores iniciales
x=zeros(1,fil);
x=x';

%gauss-seidel
error1=10; %valor inicial error (arbitrario)
xo=x; %valores anteriores
n = 0;
while error1>0.00001
  for i = 1:fil
    x(i,1)=(H(i,end)-H(i,1:end-1)*x+H(i,i)*x(i,1))/H(i,i);
  endfor
  error1=sum(abs((x-xo)./x*100));
  xo=x;
  n = n + 1;
end

x