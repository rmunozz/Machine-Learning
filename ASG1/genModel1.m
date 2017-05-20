% Running 'genModel1' will answer question 1(d) parts A,B,C,D for the generative model 1.
% Returns values of w2, w1, and woo | Plots 2D graph | Prints Train/Test Error Matrix.
% Check 'Workspace' on MATLAB for all other variables.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Data generation:

n = 2;                                  				% dimension
t_train = 10;											% training size
t_test = 1000;											% test size
u = [0; ones(n-1,1)];                  				    % target weights
sigma = 0.1;                            				% noise level
X_train = [ones(t_train,1) rand(t_train,n-1)];          % training pattern
y_train = X_train*u + randn(t_train,1)*sigma;

X_test = [ones(t_test,1) rand(t_test,n-1)];          	% test pattern
y_test = X_test*u + randn(t_test,1)*sigma;

w2 = minL2(X_train, y_train)
w1 = minL1(X_train, y_train)
woo = minLoo(X_train, y_train)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% 2D plot of training data:

clf
plot((X_train(:,2))', y_train', 'k*')
hold
plot([0 1], [w2(1) sum(w2)], 'r-') 
plot([0 1], [w1(1) sum(w1)], 'g-') 
plot([0 1], [woo(1) sum(woo)], 'b-') 
print -deps experiment.1.1.<m>.ps

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Training Errors:

	error_train = zeros(3,3);
	
	diff1 = X_train * w1 - y_train;
	error_train(1,1) = sum(abs(diff1));
	error_train(1,2) = sum(diff1.^2);
	error_train(1,3) = max(abs(diff1));
	
	diff2 = X_train * w2 - y_train;
	error_train(2,1) = sum(abs(diff2));
	error_train(2,2) = sum(diff2.^2);
	error_train(2,3) = max(abs(diff2));
	
	diff3 = X_train * woo - y_train;
	error_train(3,1) = sum(abs(diff3));
	error_train(3,2) = sum(diff3.^2);
	error_train(3,3) = max(abs(diff3));
	
printmat(error_train, 'Training Error', 'w1 w2 woo', 'L1_error L2_error Loo_error')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Testing Errors:
	
	error_test = zeros(3,3);
	
	diff4 = X_test * w1 - y_test;
	error_test(1,1) = sum(abs(diff4));
	error_test(1,2) = sum(diff4.^2);
	error_test(1,3) = max(abs(diff4));
	
	diff5 = X_test * w2 - y_test;
	error_test(2,1) = sum(abs(diff5));
	error_test(2,2) = sum(diff5.^2);
	error_test(2,3) = max(abs(diff5));
	
	diff6 = X_test * woo - y_test;
	error_test(3,1) = sum(abs(diff6));
	error_test(3,2) = sum(diff6.^2);
	error_test(3,3) = max(abs(diff6));
	
printmat(error_test, 'Testing Error', 'w1 w2 woo', 'L1_error L2_error Loo_error')