function c = coefSerieTaylor(n, a, b)
    c(n+1) = f(0, a, b);
    c(n) = 1/4* (((1/2)*(b+a))^(-1/2))*(b-a);
    aux=1;

    for i=2 : n
        aux = aux * (-2*i + 3);
        c(n-i+1) = (1/factorial(i)) * (1/2^(2*i)) * aux * (b-a)^i * ((1/2)*(b+a))^(-(2*i - 1)/2);
    end
end
