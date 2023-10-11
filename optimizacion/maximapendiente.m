%Metodo del descenso de maxima pendiente
%26/04/2018
%Héctor el espartano Olmos!! AUH! AUH! AUH!

clear all
clc

%codiciones iniciales
xo = 0;
yo = 0;
zo = 0;
par = [xo yo zo];

%parametros intervao busqueda de t
ab = [0.01 0.00001];

%numero de variables
var = length(par);

%matriz de ecuaciones
b =@(par)[3*par(1) - cos(par(2)*par(3)) - 0.5
          par(1)^2 - 625*par(2)^2
          exp(-par(1)*par(2)) + 20*par(3) + (10*pi - 3)/3];

bo = b(par);
incre = 0.00000001;
F = [1 2 3 5 8]; %de la serie de Fibonacci
ii = 1; %contador
error = 100;
k = 0;

while error > 0.000000000001
    
    for ii = 1:length(F)*2
        if ii <= length(F)
            t = ab(1) + (ab(2)-ab(1))/F(ii);
        end
        if ii > length(F)
            t = ab(2) - (ab(2)-ab(1))/F(ii-length(F));
        end
        
        %calcular derivadas numericas
        for i=1:var
            paro = par;
            paro(i) = paro(i) + incre;
            bd = b(paro);
            A(:,i) = (bd.^2-bo.^2)/incre;
        end
        
        %calcular d
        for i = 1:var
            d(i) = sum(A(i,:));
        end
   
        parr = par - t*d;
        z(ii,1) = sum((b(parr).^2));
        z(ii,2) = t;
   end
    
    %seleccion de mejor t
    j = find(z==min(z(:,1))); %posicion
    if sum(size(j)) > 2
        j = j(1,1);
    end
    
    pari = par;
    par = par - z(j,2)*d;
    error = sum((par - pari).^2);
    %error = sum((parr - par).^2);
    k = k + 1;
    par = parr;
end

par
error
k
