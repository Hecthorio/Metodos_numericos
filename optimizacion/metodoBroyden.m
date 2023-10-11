%Método de Broyden
%25/04/2018
%Tec de Celaya
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
par = par';
pari = par;
k = 0;

%generar matriz jacobiana
for i = 1:var
    paro = par; %resetear valores
    paro(i) = par(i)+incre; 
    b1 = b(paro);
    J(:,i) = (b1-bo)/incre; %jacobiano
end

Ji = inv(J);
par = par - J\bo; %J\bo es la inversa
bn = b(par); %funciones evualda en nuevos valores
Ai = Ji + ((par-pari)-Ji*(bn-bo))*(par-pari)'*Ji/((par-pari)'*Ji*(bn-bo));
pari = par; 
par = par - Ai*bn;

while error > 0.00001
    bn = b(par);
    bo = b(pari);
    w = (par-pari)-Ai*(bn-bo); %calcular esto aparte
    An = Ai + (w*(par-pari)'*Ai)/((par-pari)'*Ai*(bn-bo));
    pari = par;
    par = par - An*bn;
    Ai = An;
    %calculo de diferencia de las variables hasta que no cambien más
    error = sum((pari - par).^2);
    k = k + 1;
end

%parametros
par
error
k
