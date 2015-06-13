function yp = fValorPolinomio(n, x, y, xp)
%Cálculo dos coeficientes
numEqua = n+1;
for i=1 : numEqua
    for j=1 : numEqua-1
        A(i,j) = x(i)^(numEqua-j);
    end
    % x^0 = 1, nao tem necessidade de calcular no laço
    A(i,numEqua) = 1;
    A(i,numEqua+1) = y(i);
end
a = fGauss(numEqua, A)
%Fim do cálculo dos coenficientes

    b(1) = a(1);
     for p=1 : length(xp)
	    for i = 2 : n+1
		    b(i) = a(i) + xp(p)*b(i-1);
	    end
	    yp(p) = b(n+1);
	 end
end
