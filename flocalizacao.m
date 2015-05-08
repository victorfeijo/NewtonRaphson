function xi = flocalizacao(n,coef)

    r=1+max(abs(coef(2:n+1)))/abs(coef(1));
    xi(1:n)=complex(0.2*r,0.2*r);
end
