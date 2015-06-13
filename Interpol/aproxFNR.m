clc;
clear;
format long;

a = 1;
b = 2;
n = 2; %Número de subdivisões do intervalo [a,b] que é o grau do polinômio
h = (b-a)/n;
x = a : h : b;
y = sqrt(x);
np = n*20;
hp = (b-a)/np;
xp = a: hp: b;

for i=1 : length(xp)
    iter = 0;
    limite = 100;
    ypi = 1;
    dif = 1;
    tolerancia = 1e-4;
    while dif > tolerancia && iter < limite
        iter = iter+1
        %Newton raphson
        yp(i) = 1/2*(ypi + (xp(i)/ypi))
        dif = abs(yp(i) - ypi);
        ypi =yp(i);
    end
end


valorExato = sqrt(xp);
erro = abs(yp - valorExato);
erromax = max(erro)

plot(x,y,"*;'f(x)=sqrt(x)';",xp, yp, "r;'Interpolador';",xp ,valorExato, "k;'Sqrt(x)';", 2.2,0.7)
%plot(xp,yp,"r;'Interpolador';", 2.2, 0.7)
%plot(xp, erro, "k;'Erro';")
