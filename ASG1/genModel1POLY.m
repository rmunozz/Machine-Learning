% Running 'genModel1POLY' will answer question 2 parts B,C,D for the generative model 1.
% Returns value of c1,c3,c5,c9 | Plots 2D graph | Reports mean errors for train/test data.
% Check 'Workspace' on MATLAB for all other variables.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Data generation:

t = 10;                                  				% training size
t_test = 1000;											% testing size
sigma = 0.1;                            				% noise level
x = rand(t,1);											% training pattern
y = double(x>0.5);										% step function

x_test = rand(t_test, 1);								% testing pattern
y_test = double(x_test>0.5);							


[c1, X1] = minL2poly(x,y,1);
[c3, X3] = minL2poly(x,y,3);
[c5, X5] = minL2poly(x,y,5);
[c9, X9] = minL2poly(x,y,9);

X1_test = polyExtend(x_test,y_test,1);
X3_test = polyExtend(x_test,y_test,3);
X5_test = polyExtend(x_test,y_test,5);
X9_test = polyExtend(x_test,y_test,9);

disp('c1: ');
disp(c1);

disp('c3: ');
disp(c3);

disp('c5: ');
disp(c5);

disp('c9: ');
disp(c9);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% 2D plot of training data:

clf
axis([0 1 -0.5 1.5])
hold
plot(x', y', 'k*')
xx = (0:1000)/1000;
yy= 0.5 - 10.4*xx.*(xx-0.5).*(xx-1); 
plot(xx, yy, 'k:')

plot(xx, polyval(c1, xx), 'r-') 
plot(xx, polyval(c3, xx), 'g-') 
plot(xx, polyval(c5, xx), 'b-') 
plot(xx, polyval(c9, xx), 'm-') 
print -deps experiment.1.2.<m>.ps

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Training Errors:

error_train = zeros(4,1);
	
diff1 = X1 * c1 - y;
error_train(1,1) = sum(diff1.^2)/t;

diff2 = X3 * c3 - y;
error_train(2,1) = sum(diff2.^2)/t;

diff3 = X5 * c5 - y;
error_train(3,1) = sum(diff3.^2)/t;

diff4 = X9 * c9 - y;
error_train(4,1) = sum(diff4.^2)/t;
	
printmat(error_train, 'Mean Sum of Squares Training Error', 'c1 c3 c5 c9', 'L2_error')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Mean Sum of Squares Testing Errors: 

error_test = zeros(4,1);

diff5 = X1_test * c1 - y_test;
error_test(1,1) = sum(diff5.^2)/t_test;

diff6 = X3_test * c3 - y_test;
error_test(2,1) = sum(diff6.^2)/t_test;

diff7 = X5_test * c5 - y_test;
error_test(3,1) = sum(diff7.^2)/t_test;

diff8 = X9_test * c9 - y_test;
error_test(4,1) = sum(diff8.^2)/t_test;
	
printmat(error_test, 'Mean Sum of Squares Testing Error', 'c1 c3 c5 c9', 'L2_error')