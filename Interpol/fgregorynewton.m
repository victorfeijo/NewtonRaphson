function ygn = fgregorynewton(n,x,y,xp)
    #calculo das diferenças dividas de primeira ordem
    for i=1:n
        diferencadividida(1,i) = (y(i+1)-y(i))/(x(i+1)-x(i));
    end
    #calculo das diferenças dividas de ordem k
    for k=2:n
        for i=1:((n-k)+1)
            diferencadividida(k,i) = (diferencadividida(k-1,i+1)-diferencadividida(k-1,i))/(x(i+k)-x(i));
        end
    end
    #transpose(diferencadividida)
    for p=1:length(xp)  
        ygn(p) = y(1);
        for k=1:n
            produtorio = 1;
            for j=1:k
                produtorio = produtorio *(xp(p)-x(j));
            end
            ygn(p) += diferencadividida(k,1) * produtorio;
        end
    end
end
