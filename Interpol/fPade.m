function y = fPade(tPlot, a, b)
    % Grau total do polinomio de McLaurin M = 4
    n = 2;
    m = 2;
    M = n + m;
    c = coefSerieTaylor(M, a, b)
    cM = c(end : -1: 1)
    matriz = [cM(2) cM(3) -cM(4);
              cM(3) cM(4) -cM(5)];
    S = fGauss(2, matriz);
    B(3) = S(1);
    B(2) = S(2);
    B(1) = 1;
    A(1) = cM(1);
    A(2) = cM(1)*B(2) + cM(2);
    A(3) = cM(1)*B(3) + cM(2)*B(2) + cM(3);
A
B
    coefB=B(end : -1: 1)
    coefA=A(end : -1: 1)

    for ip=1 : length(tPlot)
        y(ip) = fBriotRuffini(n, coefA, tPlot(ip))/fBriotRuffini(m, coefB, tPlot(ip));
    end
end
