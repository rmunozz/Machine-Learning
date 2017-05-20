function w1 = minL1(X,y)

	[t,n] = size(X);
	
	f = [zeros(n,1); ones(t,1)];
    
    U = [X, -eye(t)];
	V = [-X, -eye(t)];
	A = [U;V];
	
	b = [y; -y];
	
	z = linprog(f,A,b);
	w1 = z(1:n);
	delta = z(n+1:end);