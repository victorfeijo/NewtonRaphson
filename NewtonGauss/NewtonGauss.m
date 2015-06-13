%Calculo de sistemas não lineares com metodo de NEWTON
dif = 1;
xi = [1, -1];
limite = 100;
criterio = 1e-10;
%Como o limite da derivada tende a 0, utilizar uma derivada inicial proxima de 0
dx = [0.01, 0.01];
iter = 0;

while dif > criterio && iter < limite

    iter = iter + 1;
    A = [ (f1([xi(1)+dx(1), xi(2)]) - f1(xi))/dx(1) , (f1([xi(1), xi(2)+dx(2)]) - f1(xi))/dx(2), -f1(xi);
          (f2([xi(1)+dx(1), xi(2)]) - f2(xi))/dx(1) , (f2([xi(1), xi(2)+dx(2)]) - f2(xi))/dx(2), -f2(xi); ]

    A = fescalonamento(2, A);
    dx = fretrosubstituicao(2, A);
    x = xi + dx
    xi = x;
    dif = max(abs(dx));

end
