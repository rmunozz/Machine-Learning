% Primal SVM Error
	
	beta = 1;
	
	[w,b] = primal_softmargin(X, y, beta);
	
	yhat_primal = margin_classify(Xtest,w,beta);

	[elem,~] = size(yhat_primal); 

	correct=0;
	for idx = 1:elem
		if yhat_primal(idx) == ytest(idx) 
			correct = correct + 1;
		end
	end
	
	% Calculate perecentage correct
	percentage_correct = correct / elem 