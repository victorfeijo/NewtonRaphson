function A = fescalonamento(n,A)

%processo de escalonamento, triangularização
for k=1:n-1 %passo do escalonamento
k;
A=fpivotacao(k,n,A);
	for i=k+1:n %linha a ser escalonada
		i;
		aux = A(i,k)/A(k,k);
		A(i,k) = 0; %para j = k o valor será nulo sempre
		for j = k+1:n+1
		j;
		A(i,j) = A(i,j) - aux*A(k,j); %Li < Li - aux*Lk
		end	%j
	end %i
end %k
end
