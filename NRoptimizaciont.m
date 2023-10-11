 %Newton Raphson multivariables con otimizacion de t
%26/04/2018
%Héctor el espartano Olmos!! AUH! AUH! AUH!

clear all
clc

%codiciones iniciales
xo = 0;
yo = 0;
par = [xo yo];

%parametros intervao busqueda de t
ab = [1.5 0.5];

%numero de variables
var = length(par);

%matriz de ecuaciones
b =@(par)[par(1)^2 - 10*par(1) + par(2)^2 + 8
          par(1)*par(2)^2 + par(1) - 10*par(2) + 8];

bo = b(par);
bf = -bo;

%calculo del Jacoviano
%%%calculo de derivadas numerica
incre = 0.00000001; %incremento de la derivada
error = 100; %diferencia entre cada iteracion de busqueda de parametros
k = 0; %iteraciones

while error > 0.00001
    %generar matriz jacobiana
    for i = 1:var
        paro = par; %resetear valores
        paro(i) = par(i)+incre; 
        b1 = b(paro);
        A(:,i) = (b1-bo)/incre; 
    end
    %resolver la matriz jacobi
    hj = (A)\bf; 
    hj = hj';
    %optimizacion de t
    F = [1 2 3 5 8]; %de la serie de Fibonacci
    for i=1:length(F)
        t = ab(1) + (ab(2)-ab(1))/F(i);
        hjj = t*hj + par;
        f = b(hjj);
        z(i,1) = sum(f.^2);
        z(i,2) = t;
    end
    for i=1:length(F)
        t = ab(2) - (ab(2)-ab(1))/F(i);
        hjj = t*hj + par;
        z(length(F)+i,1) = sum(b(hjj).^2);
        z(length(F)+i,2) = t;
    end
    %seleccion de mejor t
    j = find(z==min(z(:,1))); %posicion
    if sum(size(j)) > 2
        j = j(1,1);
    end
    hj = z(j,2)*hj + par; %calcular el nuevo vector otra vez
    error= sum((hj - par).^2);
    par = hj;
    bo = b(par);
    bf = -bo;
    k = k + 1;
end

%parametros
par
error
k