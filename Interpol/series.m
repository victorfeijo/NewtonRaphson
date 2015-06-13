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
% 0.0123456790123457t³ -0.0555555555555556t² + 0.3333333333333333t¹ + 0.4054651081081644t⁰
%passo 2 -> determinar chebyschev
% 0.0123456790123457*(T3+3*T1)/4 - 0.0555555555555556*(T2+T0)/2 + 0.3333333333333333*T1 + 0.4054651081081644*T0
% 0.377687330330387 T0 + 0.342592592592593 T1 - 0.0277777777777778 T2 + 0.00308641975308642 T3
%passo 3 -> avaliar o erro de truncamento
% erro de truncamento MCLAUREN(max) = 0.0156250000000000
% erro de truncamento CHEBYSCHEV(max) = 0.00308641975308642 é menor que o erro de truncamento de mclauren
%passo 4 -> pegar a série truncada e escrever em termos de x
% 0.377687330330387 + 0.342592592592593 t¹ - 0.0277777777777778 (2t²-1)
% -0.055555555555556t² + 0.342592592592593t¹ + 0.405465108108165
coef = [-0.055555555555556  0.342592592592593 0.405465108108165];
% O grau do polinomio do chebyshev foi reduzido para 2
sChebyschev = fserieCheby(tPlot, length(coef)-1, coef);
% Calculo do valor exato
valorExato = sqrt(xPlot);
% Calculo do gregory newton interpolado
h = (b-a)/n;
x = a : h : b
y = log(x)
ygregorynewton = fgregorynewton(n, x, y, xPlot);
erroInterpolador = abs(ygregorynewton - valorExato);
erroSerieTaylor = abs(sTaylor - valorExato);
erroCheby = abs(sChebyschev - valorExato);

% Calculo do polinomio racional de Padé

sPade = fPade(tPlot, a, b);
erroPade = abs(sPade - valorExato);

%plot( xPlot, erroInterpolador, "r;'Erro Interpolador';", xPlot, erroSerieTaylor, "b;'Erro Taylor';", xPlot, erroCheby, "k;'Erro Chebyschev';", xPlot, erroPade, "g;'Erro Padé';")
plot( xPlot ,valorExato , "y;'Valor Exato';", xPlot , ygregorynewton, "r;'GregoryNewton';",xPlot , sTaylor, "b;'Serie Taylor';", xPlot , sChebyschev, "k;'ChebySchev';", xPlot , sPade, "g;'Padé';", 2.2,0.7)
