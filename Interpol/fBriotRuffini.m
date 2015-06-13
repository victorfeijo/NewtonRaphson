function y = fBriotRuffini(n, a, t)
     b(1) = a(1);
     for i = 2 : n+1
	b(i) = a(i) + t*b(i-1);
     end
     y = b(n+1);
end
