%metodo de Krylov

clear all
clc

%Matriz
M =[1 1 1 
    0 2 2
    3 -1 0];

%vector solucion inicial
n = length(M);    
y = zeros(n,1);
y(1) = 1;

b(:,1)=y;
for i = 2:n+1
  b(:,i)=M*y
  y = b(:,i);
end

rref(b)