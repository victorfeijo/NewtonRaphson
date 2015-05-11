function xi = flocalizacao(n,coef)

    % --------Old method calculation-----------
    %r=1+max(abs(coef(2:n+1)))/abs(coef(1));

    % --------New method for better aproximation "Kogima"-------------
    q = 0;
    for i = 1 : n
        q(i) = (abs(coef(i+1))/coef(1))^(1/i);
    end
    [max1, idx] = max(q);
    q(idx) = 0;
    max2 = max(q);
    r = max1 + max2;
    xi(1:n)=complex(0.2*r,0.2*r);

    %-------------Cauchy method------------------
    xIn = 0;
    limite = 15;
    iter = 0;
    while iter < limite
        iter = iter + 1;
        x = 0;
        for i=1 : n
            x = x + (abs(coef(i+1)))/(abs(coef(1)))*xIn^(n-i);
        end
        x = x^(1/n);
        xIn = x;
    end
    %r = x;
    %xi(1:n)=complex(0.2*r,0.2*r);
end
