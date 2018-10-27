function [ w, e_in ] = logistic_reg( X, y, w_init, max_its, eta )
%LOGISTIC_REG Learn logistic regression model using gradient descent
%   Inputs:
%       X : data matrix (without an initial column of 1s)
%       y : data labels (plus or minus 1)
%       w_init: initial value of the w vector (d+1 dimensional)
%       max_its: maximum number of iterations to run for
%       eta: learning rate

%   Outputs?
%       w : weight vector
%       e_in : in-sample error (as defined in LFD)

%   Append the initial column of 1s to X
    size_X = size(X);
    X = [ones(size_X(1,1),1) X];
    size_X = size(X);
    for i = 1:max_its
        %Gradient is 1*(d+1)
        g_t = zeros(1,size_X(1,2));
        for row = 1:size_X(1,1)
            g_t = g_t + y(row,1)*X(row,:)/(1+exp(y(row,1)*X(row,:)*w_init));
        end
        g_t = -transpose(g_t/size_X(1,1));
        w_init = w_init - g_t*eta;
        if max(g_t) < 10^(-3)
            break
        end
    end
    w = w_init;
    e_in = 0;
    for row = 1:size_X(1,1)
            e_in = e_in + log(1+exp(-y(row,1)*X(row,:)*w_init));
    end
    e_in = e_in/size_X(1,1);
end