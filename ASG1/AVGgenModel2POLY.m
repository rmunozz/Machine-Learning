%  Running 'AVGgenModel2POLY' will answer question 2 part C for generative model 2. 
%  This function iterates 100 times and calculates training/testing averages of each error
%  for each kind of function. This function returns train/test tables respectively.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Data generation:

t = 10;													% training size
t_test = 1000;											% test size
sigma = 0.1;                            				% noise level

% Declare sum variables:

sumc1_L2 = 0;
sumc3_L2 = 0;
sumc5_L2 = 0;
sumc9_L2 = 0;

sumc1_L2_test = 0;
sumc3_L2_test = 0;
sumc5_L2_test = 0;
sumc9_L2_test = 0;

% Declare error matrices for training/testing error :

avgtrain_errors = zeros(4,1);
avgtest_errors = zeros(4,1);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Begin iteration :

for iter=(1:100)

	x = rand(t,1);											% training pattern       
	y = 0.5 - 10.4*x.*(x-0.5).*(x-1)+sigma*randn(t, 1);		

	x_test = rand(t_test, 1);								% testing pattern
	y_test = 0.5 - 10.4*x_test.*(x_test-0.5).*(x_test-1)+sigma*randn(t_test, 1);
	
	% Train data :
	
	[c1, X1] = minL2poly(x,y,1);
	[c3, X3] = minL2poly(x,y,3);
	[c5, X5] = minL2poly(x,y,5);
	[c9, X9] = minL2poly(x,y,9);
	
	X1_test = polyExtend(x_test,y_test,1);
	X3_test = polyExtend(x_test,y_test,3);
	X5_test = polyExtend(x_test,y_test,5);
	X9_test = polyExtend(x_test,y_test,9);
	
	% Calculate training errors :
	
	yhat1 = X1 * c1 - y;
	sumc1_L2 = sumc1_L2 + sum(yhat1.^2);
	
	yhat2 = X3 * c3 - y;
	sumc3_L2 = sumc3_L2 + sum(yhat2.^2);
	
	yhat3 = X5 * c5 - y;
	sumc5_L2 = sumc5_L2 + sum(yhat3.^2);
	
	yhat4 = X9 * c9 - y;
	sumc9_L2 = sumc9_L2 + sum(yhat4.^2);
	
	% Calculate testing errors :
	
	yhat5 = X1_test * c1 - y_test;
	sumc1_L2_test = sumc1_L2_test + sum(yhat5.^2);
	
	yhat6 = X3_test * c3 - y_test;
	sumc3_L2_test = sumc3_L2_test + sum(yhat6.^2);
	
	yhat7 = X5_test * c5 - y_test;
	sumc5_L2_test = sumc5_L2_test + sum(yhat7.^2);
	
	yhat8 = X9_test * c9 - y_test;
	sumc9_L2_test = sumc9_L2_test + sum(yhat8.^2);
	
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Calculates averages for both training & testing errors:

avgtrain_errors(1,1) = sumc1_L2/100;
avgtrain_errors(2,1) = sumc3_L2/100;
avgtrain_errors(3,1) = sumc5_L2/100;
avgtrain_errors(4,1) = sumc9_L2/100;

printmat(avgtrain_errors, 'Training Error Averages', 'c1 c3 c5 c9', 'L2_error')

avgtest_errors(1,1) = sumc1_L2_test/100;
avgtest_errors(2,1) = sumc3_L2_test/100;
avgtest_errors(3,1) = sumc5_L2_test/100;
avgtest_errors(4,1) = sumc9_L2_test/100;

printmat(avgtest_errors, 'Training Error Averages', 'c1 c3 c5 c9', 'L2_error')