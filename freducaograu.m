function  [n a] = freducaograu (n, a, x, M)
     %primeira divisão
     b(1) = a(1);
     for iDivisao=1 : M
	    for i = 2 : n+1
		    b(i) = a(i) + x*b(i-1);
	    end
	    R(iDivisao) = b(n+1);
	    %segunda divisão Pn-1(x)
	    n = n-1;
	    a = b;
	 end
end
