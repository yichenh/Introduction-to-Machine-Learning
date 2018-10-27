function [ test_error ] = find_test_error( w, X, y )
%FIND_TEST_ERROR Find the test error of a linear separator
%   This function takes as inputs the weight vector representing a linear
%   separator (w), the test examples in matrix form with each row
%   representing an example (X), and the labels for the test data as a
%   column vector (y). X does not have a column of 1s as input, so that 
%   should be added. The labels are assumed to be plus or minus one. 
%   The function returns the error on the test examples as a fraction. The
%   hypothesis is assumed to be of the form (sign ( [1 x(n,:)] * w )

%   w is a (d+1)*1 vector with (1,1) as 0
%   X is a N*(d+1) matrix with (:,1) as all ones
%   y is a N*1 vector with the correct classification

    size_X = size(X);
    X = [ones(size_X(1,1),1) X];
%   Get the learnt vector y_learnt
    y_learnt = sign(X*w);
%   Find the absolute difference between y_learnt and y
    y_diff = abs(y-y_learnt);
%   Divide the absolute difference by 2, we have 1s in all the samples
%   that are classfied wrong and 0s in all the samples classfied right
    y_diff = y_diff/2;
    test_error = mean(y_diff);
end

