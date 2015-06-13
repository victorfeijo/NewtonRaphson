c = 100;
n = 2;
dif = 1;
xi = 1.5;
criterio = 1e-15;
limite = 100;
iter = 0;
while iter < limite && dif > criterio
    iter = iter + 1
    x = xi - (xi^n - c)/(n*(xi^(n-1)));
    dif = abs(xi - x)
    xi = x;
end;

x
