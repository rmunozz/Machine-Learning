function [c,X] = minL2poly(x, y, d)
	t=10;
	x_extend = rand(t,d-1);
	x = [x, x_extend];
	x = [x, ones(t,1)];
	X = x;
	A = transpose(x)*x;
	b = transpose(x)*y;
	
	c = A\b;