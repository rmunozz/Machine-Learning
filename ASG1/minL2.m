function w2 = minL2(X,y)
	
	A = transpose(X)*X;
	b = transpose(X)*y;
	
	w2 = A\b;