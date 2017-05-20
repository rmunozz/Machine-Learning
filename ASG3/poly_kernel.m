function [K] = poly_kernel(X1, X2, d)

	X3 = X1 * transpose(X2);
	
	K = (1+X3).^d;
	
end