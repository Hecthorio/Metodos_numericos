%Newton Raphson multivariables modificado
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
pari = par;
k = 0;
F = [1 2 3 5 8]; %de la serie de Fibonacci
ii = 1; %contador

while error > 0.00001
    
    for ii = 1:length(F)*2
        
        if ii <= length(F)
            t = ab(1) + (ab(2)-ab(1))/F(ii);
        end
        if ii > length(F)
            t = ab(2) - (ab(2)-ab(1))/F(ii-length(F));
        end
        
        %generar matriz jacobiana
        paro = par; %resetear valores
        bo = b(paro);
        for i = 1:var
            paro(i) = par(i)+incre;
            b1 = b(paro);
            A(:,i) = (b1-bo)/incre; %jacobiano
            paro(i) = par(i) - t*b1(i)/A(i,i);
            bo = b(paro);
        end        
        z(ii,:) = [sum(bo.^2) t];
    end
    
    %seleccion de mejor t
    j = find(z==min(z(:,1))); %posicion
    if sum(size(j)) > 2
        j = j(1,1);
    end
    
    paro = par; %resetear valores
    bo = b(paro);
    for i = 1:var
        paro(i) = par(i)+incre;
        b1 = b(paro);
        A(:,i) = (b1-bo)/incre; %jacobiano
        paro(i) = par(i) - z(j,2)*b1(i)/A(i,i);
        bo = b(paro);
    end
    
    par = paro;
    
    error = sum((pari - par).^2);
    pari = par;
    k = k + 1;
end

%parametros
par
error
k
