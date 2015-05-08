function [x M] = fnr(xi, n, a)

    dif = 1;
    tolerancia = 1e-15;
    iter = 0;
    limite = 100;

    while dif > tolerancia && iter < limite

        iter = iter+1;
        %para raiz de xi de multiplicidade M
        [M R] = frestos(xi,n,a);
        %M = 3; %%%vamos contar o numero de restos proximos de zero...
        dx = - R(M)/(R(M+1)*M);
        x = xi + dx;
        xi = x;

    dif = abs(dx) + abs(R(1));

    end
    iter
    dif
    M
    x
end
