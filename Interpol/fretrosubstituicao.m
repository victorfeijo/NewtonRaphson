function x= fretrosubstituicao(n,A)
%processo de retrosubstituição
if abs(A(n,n))<eps && abs(A(n, n+1))<eps
	'Sistema possível e indeterminado'
	x(n)=0;
else
	if abs(A(n,n))<eps && abs(A(n, n+1))>eps
	'Sistema impossível'
	x(n)=nan;
	else
	x(n) = A(n, n+1)/A(n,n);
	end
end

for i=n-1:-1:1
		soma = 0;
	for j=i+1:n
		soma = soma + A(i,j)*x(j);
	end	
	x(i) = (A(i, n+1) - soma)/A(i,i);
end
end
