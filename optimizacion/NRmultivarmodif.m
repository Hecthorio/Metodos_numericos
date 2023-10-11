%Newton Raphson multivariables modificado
%24/04/2018
%Héctor el espartano Olmos!! AUH! AUH! AUH!

clear all
clc

%codiciones iniciales
xo = 0;
yo = 0;
par = [xo yo];

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
pari = par;
k = 0;

while error > 0.0001
    %generar matriz jacobiana
    for i = 1:var
        paro = par; %resetear valores
        paro(i) = par(i)+incre; 
        b1 = b(paro);
        A(:,i) = (b1-bo)/incre; %jacobiano
        par(i) = par(i) - b1(i)/A(i,i);
        bo = b(par);
    end
    %calculo de diferencia de las variables hasta que no cambien más
    error = sum((pari - par).^2);
    pari = par;
    k = k + 1;
end

%parametros
par
error
k
