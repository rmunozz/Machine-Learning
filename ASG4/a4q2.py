from __future__ import absolute_import
from __future__ import division
from __future__ import print_function

import tensorflow as tf 
import numpy as np
import pandas as pd


# LOAD TRAINING DATASETS 
# read in data and split into x1, x2, y
COLUMNS = ["x1", "x2", "y"]
df_train = pd.read_csv('a4q2_train.txt', sep = ' ', names=COLUMNS)
x1 = df_train['x1']
x2 = df_train['x2']
y = df_train['y']
# LOAD TEST DATASETS
COLUMNS2 = ["x1_te", "x2_te", "y_te"] 
df_test = pd.read_csv('a4q2_test.txt', sep = ' ', names=COLUMNS2)
x1_te = df_test['x1_te']
x2_te = df_test['x2_te']
y_te = df_test['y_te']

w1 = tf.placeholder(tf.float32)
w2 = tf.placeholder(tf.float32)
b = tf.placeholder(tf.float32)

# Specify that all features have real-value data
feature = [tf.contrib.layers.real_valued_column("x1", dimension = 1),
  					 tf.contrib.layers.real_valued_column("x2", dimension = 1)]

# LinearRegressor
regressor = tf.contrib.learn.LinearRegressor(feature_columns=feature)
input_fn= tf.contrib.learn.io.numpy_input_fn({"x1":x1, "x2":x2}, y, batch_size=150,num_epochs=2000)
input_fn_eval= tf.contrib.learn.io.numpy_input_fn({"x1":x1_te, "x2":x2_te}, y_te, batch_size=150,num_epochs=2000)

# Fit model.
regressor.fit(input_fn=input_fn, steps=2000) 

# Evaluate model.
evaluation1 = regressor.evaluate(input_fn=input_fn)
evaluation2 = regressor.evaluate(input_fn=input_fn_eval) 
print("Training Loss: ", evaluation1)
print("Testing Loss: ", evaluation2)
w1 = regressor.get_variable_value('linear/x1/weight')
w2 = regressor.get_variable_value('linear/x2/weight')
b = regressor.get_variable_value('linear/bias_weight')
print('w1: ', w1)
print('w2: ', w2)
print('b: ', b)
  