function A=fpivotacao(k,n,A)

maxmod = abs(A(k,k));
imaxmod = k;

for i=k+1 : n
	if abs(A(i,k))> maxmod
		maxmod = abs(A(i,k));
		imaxmod = i;
	end
end
	Aux= A(k,:);
	A(k,:) = A(imaxmod, :);
	A(imaxmod,:)= Aux;	
end
