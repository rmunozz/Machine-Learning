import tensorflow as tf

###############################################################################
# Create the tensor x of the value 
#   [[[2, -2, 4], [0, 1, 2]], [[1, 2, 3], [7, 1, 9]]] 
# and y as a tensor of ones with the same shape as x.
# Return a Boolean tensor that yields Trues with the same shape as x and y if 
# x equals y element-wise.
# Hint: Look up tf.equal().
###############################################################################
def p1():
# Your solution

	# Input
	x = tf.constant([[[2, -2, 4], [0, 1, 2]], [[1, 2, 3], [7, 1, 9]]])
	y = tf.constant([[[1, 1, 1], [1, 1, 1]], [[1, 1, 1], [1, 1, 1]]])
	# Comparison function
	return tf.equal(x, y)
	# Result
	# sess = tf.Session()
	# print(sess.run(comparison))
################################################################################
# Creates one variable 'x' of the value [3., -4.] and a placeholder 'y' of the 
# same shape as 'x'. Given a scalar z returns a triple containing 
#   x
#   y 
#   and a TensorFlow object that returns x + y if z > 0, and x - y otherwise. 
# Hint: Look up tf.cond().
################################################################################
def p2(z):
# Your solution
	
	x = tf.Variable([3.,-4.])
	y = tf.placeholder(tf.float32)
	
	def f1(): return tf.subtract(x,y)
	def f2(): return tf.add(x,y)
	r = tf.cond(tf.less(z,0), f1, f2)
	return x, y, r 
	
	# sess = tf.Session()
	# print(sess.run(r))

###############################################################################
# Given 2d tensors x, y, and z, returns a tensor object for  x' * y^-1 + z 
# where x' is the transpose of x and y^-1 is the inverse of y. The dimensions 
# of tensors will be compatible.
# Hint: See "Matrix Math Functions" in TensorFlow documentation.
###############################################################################
def p3(x, y, z):
# Your solution
	x1 = tf.transpose(x)
	y1 = tf.matrix_inverse(y)
	
	xtimesy = tf.matmul(x1,y1)
	final_result = tf.add(xtimesy,z)
	
	return final_result
  

###############################################################################
# Given a TensorFlow object that describes a convex function and a TensorFlow 
# session, return the the minimum value of the function found by gradient 
# decent. Use 0.01 learning rate and 10000 steps. 
###############################################################################
def p4(objective_function, sess):
# Your solution
	# Define optimizer
	optimizer = tf.train.GradientDescentOptimizer(0.01)
	train = optimizer.minimize(objective_function)

	for i in range(10000):
		sess.run(train)
	return sess.run(objective_function)


