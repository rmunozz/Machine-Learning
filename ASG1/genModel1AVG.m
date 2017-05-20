%  Running 'genModel1AVG' will answer question 1(d) part E for generative model 1. 
%  This function iterates 100 times and calculates training/testing averages of each error
%  for each kind of function. This function returns train/test tables respectively.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Data generation:

n = 2;                                  				% dimension
t_train = 10;											% training size
t_test = 1000;											% test size
u = [0; ones(n-1,1)];                  				    % target weights
sigma = 0.1;                            				% noise level

% Declare sum variables:

sumw2_L1 = 0;
sumw2_L2 = 0;
sumw2_Loo = 0;

sumw1_L1 = 0;
sumw1_L2 = 0;
sumw1_Loo = 0;

sumwoo_L1 = 0;
sumwoo_L2 = 0;
sumwoo_Loo = 0;

sumw2_L1_test = 0;
sumw2_L2_test = 0;
sumw2_Loo_test = 0;

sumw1_L1_test = 0;
sumw1_L2_test = 0;
sumw1_Loo_test = 0;

sumwoo_L1_test = 0;
sumwoo_L2_test = 0;
sumwoo_Loo_test = 0;

% Declare error matrices for training/testing error :

avg_train_errors = zeros(3,3);
avg_test_erros = zeros(3,3);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Begin iteration :

for iter=(1:100)
	X_train = [ones(t_train,1) rand(t_train,n-1)];          % training pattern
	y_train = X_train*u + randn(t_train,1)*sigma;
	
	X_test = [ones(t_test,1) rand(t_test,n-1)];          	% test pattern
	y_test = X_test*u + randn(t_test,1)*sigma;
	
	% Train data :
	
	w2 = minL2(X_train, y_train);
	w1 = minL1(X_train, y_train);
	woo = minLoo(X_train, y_train);
	
	% Calculate training errors :
	
	pred1 = X_train * w1 - y_train;
	sumw1_L1 = sumw1_L1 + sum(abs(pred1));
	sumw1_L2 = sumw1_L2 + sum(pred1.^2);
	sumw1_Loo = sumw1_Loo + max(abs(pred1));
	
	pred2 = X_train * w2 - y_train;
	sumw2_L1 = sumw2_L1 + sum(abs(pred2));
	sumw2_L2 = sumw2_L2 + sum(pred2.^2);
	sumw2_Loo = sumw2_Loo + max(abs(pred2));
	
	pred3 = X_train * woo - y_train;
	sumwoo_L1 = sumwoo_L1 + sum(abs(pred3));
	sumwoo_L2 = sumwoo_L2 + sum(pred3.^2);
	sumwoo_Loo = sumwoo_Loo + max(abs(pred3));
	
	% Calculate testing errors :
	
	pred4 = X_test * w1 - y_test;
	sumw1_L1_test = sumw1_L1_test + sum(abs(pred4));
	sumw1_L2_test = sumw1_L2_test + sum(pred4.^2);
	sumw1_Loo_test = sumw1_Loo_test + max(abs(pred4));
	
	pred5 = X_test * w2 - y_test;
	sumw2_L1_test = sumw2_L1_test + sum(abs(pred5));
	sumw2_L2_test = sumw2_L2_test + sum(pred5.^2);
	sumw2_Loo_test = sumw2_Loo_test + max(abs(pred5));
	
	pred6 = X_test * woo - y_test;
	sumwoo_L1_test = sumwoo_L1_test + sum(abs(pred6));
	sumwoo_L2_test = sumwoo_L2_test + sum(pred6.^2);
	sumwoo_Loo_test = sumwoo_Loo_test + max(abs(pred3));
	
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Calculates averages for both training & testing errors:

avg_train_errors(1,1) = sumw1_L1/100;
avg_train_errors(1,2) = sumw1_L2/100;
avg_train_errors(1,3) = sumw1_Loo/100;

avg_train_errors(2,1) = sumw2_L1/100;
avg_train_errors(2,2) = sumw2_L2/100;
avg_train_errors(2,3) = sumw2_Loo/100;

avg_train_errors(3,1) = sumwoo_L1/100;
avg_train_errors(3,2) = sumwoo_L2/100;
avg_train_errors(3,3) = sumwoo_Loo/100;

printmat(avg_train_errors, 'Training Error Averages', 'w1 w2 woo', 'L1_error L2_error Loo_error')

avg_test_errors(1,1) = sumw1_L1_test/100;
avg_test_errors(1,2) = sumw1_L2_test/100;
avg_test_errors(1,3) = sumw1_Loo_test/100;

avg_test_errors(2,1) = sumw2_L1_test/100;
avg_test_errors(2,2) = sumw2_L2_test/100;
avg_test_errors(2,3) = sumw2_Loo_test/100;

avg_test_errors(3,1) = sumwoo_L1_test/100;
avg_test_errors(3,2) = sumwoo_L2_test/100;
avg_test_errors(3,3) = sumwoo_Loo_test/100;

printmat(avg_test_errors, 'Testing Error Averages', 'w1 w2 woo', 'L1_error L2_error Loo_error')