function yLagrange = fLagrange(n, x, y, xp)
    for p=1 : length(xp)
        yLagrange(p) = 0;
        for i=1 : n+1
        % Elemento da base dos polinômio de Lagrange
            produtorio = 1;
            for j=1: n+1
                if j != i
                    produtorio *= (xp(p)-x(j))/(x(i)-x(j));
                end
            end
            yLagrange(p) += y(i)*produtorio;
        end
    end
end
