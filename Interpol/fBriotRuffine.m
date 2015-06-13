function y = fBriotRuffine(n, a, x)
      b(1) = a(1);
	      for i = 2 : n+1
		      b(i) = a(i) + x*b(i-1);
	      end
	      y = b(n+1);
end
