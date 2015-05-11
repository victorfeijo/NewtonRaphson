function raiz = roots2(coef)
    n = length(coef) -1;  % grau do polinômio
    ni = n;
    coefi = coef;
    %grafico(n,coef)
    % 1º localização das n raízes
    xi = flocalizacao(n,coef)
    % 2º determinação das n raízes
    nRaizes = n;
    iRaiz = 1;
    while iRaiz <= nRaizes
        [x(iRaiz) M] = fnr(xi(iRaiz),n,coef);
        %refinamento da raiz encontrada no polinomio original
        [x(iRaiz) M] = fnr(x(iRaiz),ni,coefi);
        raiz(iRaiz : iRaiz + (M-1)) = x(iRaiz);
        [n coef] = freducaograu (n, coef, x(iRaiz), M)
        iRaiz = iRaiz + M;
    end
    raiz = transpose(raiz);
end
