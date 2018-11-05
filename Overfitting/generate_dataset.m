function [ train_set, test_set ] = generate_dataset( Q_f, N_train, N_test, sigma )
%GENERATE_DATASET Generate training and test sets for the Legendre
%polynomials example
%   Inputs:
%       Q_f: order of the hypothesis
%       N_train: number of training examples
%       N_test: number of test examples
%       sigma: standard deviation of the stochastic noise
%   Outputs:
%       train_set and test_set are both 2-column matrices in which each row
%       represents an (x,y) pair

    %Initialize train_set and test_set matrices
    train_set = zeros(N_train,2);
    test_set = zeros(N_test,2);
    
    %Generate uniform input X for both test_set and train_set
    train_set(:,1) = -1 + 2*rand(N_train,1);
    test_set(:,1) = -1 + 2*rand(N_test,1);
    
    %Generate rescaled coefficients a_q (1*Q_f)
    normalise_term = 0;
    for q = 0:Q_f
        normalise_term = normalise_term + 1/(2*q+1);
    end
    normalise_term = sqrt(normalise_term);
    a_qs = normrnd(0,1,1,Q_f+1)/normalise_term;    
    
    %Generate Legendre polynomials for train_set and test_set
    z_train = computeLegPoly(transpose(train_set(:,1)),Q_f);
    z_test = computeLegPoly(transpose(test_set(:,1)),Q_f);
    
    %Calculate y_train and y_test from z_train/z_test, a_qs and noise
    train_set(:,2) = transpose(a_qs*z_train+normrnd(0,sigma,1,N_train));
    test_set(:,2) = transpose(a_qs*z_test+normrnd(0,sigma,1,N_test));
end