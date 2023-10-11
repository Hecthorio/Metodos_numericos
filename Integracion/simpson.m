%TecNM, Celaya
%Ing mecanica
%Metodos numericos
%Profe Hecthorio
%03/05/2020
%Codigo para obtener integrales numericas a partir
%del metodo de Simpson 3/8.

clear all
clc

%declarar la funcion aplicando funciones anonimas
f = @(x) 0.2+25*x-200*x.^2+675*x.^3-900*x.^4+400*x.^5;

%dar de alta los limites de integracion
a=0;
b=0.8;

%calcular el tamaño de paso
h = (b-a)/3;

%calculo del vector de valores de x
x=zeros(4,1);
x(1,1)=a;
for i = 2:4
  x(i)=x(i-1)+h;
endfor

%evaluacion de la funcion para los valores de x
fx = f(x);

%calcular el area bajo la curva (el valor de
%la integral
I = 3*h/8*(fx(1)+3*fx(2)+3*fx(3)+fx(4));