function woo = minLoo(X,y)
	
	[t,n] = size(X);
	
	f = [zeros(n,1);1];
	
	U = [X, -ones(t,1)];
	V = [-X, -ones(t,1)];
	A = [U;V];
	
	b = [y; -y];
	
	z = linprog(f,A,b);
	woo = z(1:end-1);
	delta = z(end);