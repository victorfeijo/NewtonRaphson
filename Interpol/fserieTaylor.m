function y = fserieTaylor(t, n, a, b)
    c = coefSerieTaylor(n, a, b)

    for p=1 : length(t)
        aux = 1;
        y(p) = c(n+1);
        for i=n :-1: 1
            aux = aux*t(p);
            y(p) = y(p) + c(i) * aux;
        end
    end
end
