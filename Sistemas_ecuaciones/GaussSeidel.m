%Metodo de Gauss - Seidel

clear all
clc

%matriz a resolver
M =[8 59 509 4859 26.4
    59 509 4859 49397 204.8
    509 4859 49397 522899 1838.4
    4859 49397 522899 5689229 18164]    
    
[fila colu]=size(M);

%condiciones iniciales
x = zeros(fila,1)

for i= 1:20
  for i = 1:fila
    x(i)= (M(i,end) - M(i,1:end-1)*x + x(i)*M(i,i))/M(i,i);
  end
end

x
rref(M)