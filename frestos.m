function [M R] = frestos(xi,n,a);
    ngrau = n;
    n;
    a;
    for nrestos = 1 : ngrau + 1
        nrestos;
        %primeira divisão
	    b(1) = a(1);
	    for i = 2 : n+1
		    b(i) = a(i) + xi*b(i-1);
	    end
	    R(nrestos) = b(n+1);
	    %segunda divisão Pn-1(x)
	    n = n-1;
	    a = b;
	end
    %% conta no numero de restos nulos, cuja sema é menor que 0.1
    R;
    M = 1;
    somaRestos=(abs(R(1)) + abs(R(2)))/abs(a(1));
    while somaRestos < 0.1
        M = M + 1;
        somaRestos += abs(R(M+1))/abs(a(1));
    end
end
