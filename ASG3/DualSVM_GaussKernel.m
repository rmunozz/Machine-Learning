% Dual SVM with Gaussian Kernel Error

	sigma = 10;
	beta = 1;
	
	Ktrain = gauss_kernel(X,X,sigma);
	[lambda,b] = dual_softmargin(Ktrain, y, beta);
	
	Ktest= gauss_kernel(Xtest,X, sigma);
	yhat_dual = dual_classify(Ktest, lambda, b, y, beta);


	[elem,~] = size(yhat_dual); 

	correct=0;
	for idx = 1:elem
		if yhat_dual(idx) == ytest(idx) 
			correct = correct + 1;
		end
	end
	
	% Calculate perecentage correct
	percentage_correct = correct / elem 