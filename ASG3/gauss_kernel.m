function [K] = gauss_kernel(X1, X2, sigma)

	% Euclidean Distance:
	D = pdist2(X1,X2);
	
	K = exp(-D.^2/(2*sigma^2));
	
end