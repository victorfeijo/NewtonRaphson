function c = coefSerieTaylor(n, a, b)
    c(n+1) = f(0, a, b);
    for i=1 : n
        c(n-i+1) = ((-1)^(i+1) * (b-a)^i * (b+a)^(-i))/i;
    end
end
