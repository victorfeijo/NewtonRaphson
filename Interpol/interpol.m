clc;
clear;
format long;
a = 1;
b = 2;
n = 2; %Número de subdivisões do intervalo [a,b] que é o grau do polinômio
h = (b-a)/n;
x = a : h : b
y = sqrt(x)
np = n*20;
hp = (b-a)/np;
xp = a: hp: b;
yp = fValorPolinomio(n, x, y, xp);
valorExato = sqrt(xp);
erro = abs(yp - valorExato);
erromax = max(erro)
yLagrange = fLagrange(n, x, y, xp);
ygregorynewton = fgregorynewton(n, x, y, xp);
plot(x,y,"*;'f(x)=sqrt(x)';",xp, yp, "r;'Interpolador';",xp ,valorExato, "k;'Sqrt(x)';",xp , yLagrange, "c;'Lagrange';",xp , ygregorynewton, "g;'GregoryNewton';", 2.2,0.7)
%plot(xp, erro, "k;'Erro';")
