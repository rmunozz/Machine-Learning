% Dual SVM with Polynomial Kernel Error

	beta = 1;
	d = 2;
	
	Ktrain = poly_kernel(X,X,d);
	[lambda,b] = dual_softmargin(Ktrain, y, beta);
	
	Ktest= poly_kernel(Xtest,X, d);
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