% Dual SVM with Linear Kernel Error

	beta = 1;
	
	Ktrain = linear_kernel(X,X);
	[lambda,b] = dual_softmargin(Ktrain, y, beta);
	
	Ktest= linear_kernel(Xtest,X);
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
