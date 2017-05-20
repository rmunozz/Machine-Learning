% Extends testing input matrix

function X = polyExtend(x, y, d)
	t_test=1000;
	x_extend = rand(t_test,d-1);
	x = [x, x_extend];
	x = [x, ones(t_test,1)];
	X = x;
