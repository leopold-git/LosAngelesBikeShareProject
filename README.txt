README




Leopold Ringmayr, Extension through Friday, Nov 1. 

The built in MATLAB implementation for regression is in the BuiltIn.mlx script. This script runs MATLAB's fitlm on the features chosen from feature selection. 


To run my gradient descent regression, open the GradientDescent.mlx script and run. This program includes feature selection procedures (correlation test, lasso regression) and runs gradient descent. Coefficients are saved in the workspace as the betas (e.g. beta0). Rmse holds the root mean squared error.  

Note: This script includes feature selection. Once the six features I want to use for gradient descent are found, I continue using those feautures in the gradient descent part of the script. My data does get random






Supporting functions are:

Correlation.m which finds and eliminates highly correlated features. 
testgrad also runs gradient descent, just like in GradientDescent.mlx, just without the feature selection above. Here, one needs to manually establish which features are to be kept (can run using findings from feature selection).

splitTestTraining.m splits data into test and training data. Takes in a proportion of desired test data (e.g 0.2). 