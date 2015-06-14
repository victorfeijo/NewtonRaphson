clear;
clc;
format long;
% Aproximar f(x) = ln(x) com x[1,2]
% Vamos mapear o intervalo em x -> t , com t[-1,1]
% x(t) = 0.5t + 1.5
a = 1;
b = 2;
n = 3;
ti = 0; % Ponto médio do intervalo t[-1,1] por expansão de série de taylor
tPlot = [-1 : 1/100 : 1];
sTaylor = fserieTaylor(tPlot, n, a, b);
xPlot = 0.5 * (b-a).*tPlot + 0.5*(b+a);
% Serie de Chebyschev
%passo 1
% 0.00283505757266572  -0.01701034543599429   0.20412414523193151   1.22474487139158894
%passo 2 -> determinar chebyschev
% 0.00283505757266572*(T3+3*T1)/4 - 0.01701034543599429*(T2+T0)/2 + 0.20412414523193151*T1 + 1.22474487139158894*T0
% 1.21623969867359 T0+0.206250438411431 T1-0.0085051727179971 T2+0.00070876439316643 T3
%passo 3 -> avaliar o erro de truncamento
% erro de truncamento MCLAUREN(max) = 0.0156250000000000
% erro de truncamento CHEBYSCHEV(max) = 0.00308641975308642 é menor que o erro de truncamento de mclauren
%passo 4 -> pegar a série truncada e escrever em termos de x
% 0.0028350575726657 t^3-0.017010345435994 t^2+0.20412414523193 t+1.2247448713916
coef = [-0.017010345435994  0.2041241452319 1.2247448713916];
% O grau do polinomio do chebyshev foi reduzido para 2
sChebyschev = fserieCheby(tPlot, length(coef)-1, coef);
% Calculo do valor exato
valorExato = sqrt(xPlot);
% Calculo do gregory newton interpolado
h = (b-a)/n;
x = a : h : b
y = sqrt(x)
ygregorynewton = fgregorynewton(n, x, y, xPlot);
erroInterpolador = abs(ygregorynewton - valorExato);
erroSerieTaylor = abs(sTaylor - valorExato);
erroCheby = abs(sChebyschev - valorExato);

% Calculo do polinomio racional de Padé

sPade = fPade(tPlot, a, b);
erroPade = abs(sPade - valorExato);
erroMaxPade = max(erroPade)

%plot( xPlot, erroInterpolador, "r;'Erro Interpolador';", xPlot, erroSerieTaylor, "b;'Erro Taylor';", xPlot, erroCheby, "k;'Erro Chebyschev';", xPlot, erroPade, "g;'Erro Padé';")
plot( xPlot ,valorExato , "y;'Valor Exato';", xPlot , ygregorynewton, "r;'GregoryNewton';",xPlot , sTaylor, "b;'Serie Taylor';", xPlot , sChebyschev, "k;'ChebySchev';", xPlot , sPade, "g;'Padé';", 2.2,0.7)
