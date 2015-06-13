function y = fserieCheby(tPlot, n, a)
        b(1) = a(1);
        for ip=1 : length(tPlot)
	        for i = 2 : n+1
		        b(i) = a(i) + tPlot(ip)*b(i-1);
	        end
	        y(ip) = b(n+1);
	    end
end
