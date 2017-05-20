function [lambda, b] = dual_softmargin(K, y, beta)

	[t,n] = size(y);
	
	% Constructing A:
	A = [-eye(t);eye(t)];
	
	% Constructing f (TRANSPOSE THIS?):
	f = [-ones(t,1)];
	
	% Constructing c (inequality conditions):
	c = [zeros(t,1); ones(t,1)];
	
	% Constructing H:
	H1 = diag(y)*K*diag(y);
	H = 1/beta * H1; 
	
	% Constructing Aeq:
	Aeq = transpose(y);
	
	% Constructing beq:
	beq = 0;

	% Optimize:	
	z = quadprog(H,f,A,c,Aeq,beq);
	lambda = z(1:end);

	% Recovering b:
	idx = 0 < lambda & lambda < 1; % lambda is the vector of Lagrange multipliers
	b = 1/sum(idx) * sum(y(idx) - 1/beta * K(idx, :) * diag(y) * lambda);
	
end
	
	