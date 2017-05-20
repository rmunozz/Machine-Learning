function [w, b] = primal_softmargin(X, y, beta)

	[t,n] = size(X);
	
	% Constructing A (step-by-step):
	A1 = ones(t,1);
	A2 = zeros(t,n);
	A3 = -eye(t);
	A4 = [A1, A2, A3]; % first half
	
	A5 = ones(t,1);
	A6 = [A5, X];
	A7 = -diag(y)*A6;
	A8 = -eye(t);
	A9 = [A7, A8]; % second half
	
	A = [A4;A9]; % Full A matrix
	
	
	% Constructing f: 
	f = [0; zeros(n,1); ones(t,1)];
	
	% Constructing c (inequality conditions): 
	c = [zeros(t,1); -ones(t,1)];
	
	% Constructing H: 
	H1 = [0; zeros(n,1); zeros(t,1)];
	H2 = [zeros(1,n); beta*eye(n); zeros(t,n)];
	H3 = [zeros(1,t); zeros(n,t); zeros(t)];
	H = [H1, H2, H3];
	
	% Optimize:
	z = quadprog(H,f,A,c);
	b = z(1:1);
	w = z(2:257);
	delta = z(n+1:end);
	
end