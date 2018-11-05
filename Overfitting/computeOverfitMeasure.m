function [ overfit_m ] = computeOverfitMeasure( true_Q_f, N_train, N_test, var, num_expts )
%COMPUTEOVERFITMEASURE Compute how much worse H_10 is compared with H_2 in
%terms of test error. Negative number means it's better.
%   Inputs
%       true_Q_f: order of the true hypothesis
%       N_train: number of training examples
%       N_test: number of test examples
%       var: variance of the stochastic noise
%       num_expts: number of times to run the experiment
%   Output
%       overfit_m: vector of length num_expts, reporting each of the
%                  differences in error between H_10 and H_2

    %Initialize overfit_m
    overfit_m = zeros(num_expts,1);
    for i = 1:num_expts
        %Generate the test_set and train_set
        [ train_set, test_set ] = generate_dataset( true_Q_f, N_train, N_test, sqrt(var) );

        %H_2 Hypothesis Learning Process:
        %Transform the train_set to Legendre Polynomials
        [ ztrain_H2 ] = computeLegPoly( transpose(train_set(:,1)), 2 );
        g_2 = glmfit(transpose(ztrain_H2),train_set(:,2),'normal','constant','off');

        %H_10 Hypothesis Learning Process:
        %Transform the train_set to Legendre Polynomials
        [ ztrain_H10 ] = computeLegPoly( transpose(train_set(:,1)), 10 );
        g_10 = glmfit(transpose(ztrain_H10),train_set(:,2),'normal','constant','off');

        %H_2 Hypothesis Test Error Calculation
        [ ztest_H2 ] = computeLegPoly( transpose(test_set(:,1)), 2 );
        ylearnt_test_H2 = transpose(ztest_H2)*g_2;
        test_error_h2 = mean((ylearnt_test_H2-test_set(:,2)).*(ylearnt_test_H2-test_set(:,2)));

        %H_10 Hypothesis Test Error Calculation
        [ ztest_H10 ] = computeLegPoly( transpose(test_set(:,1)), 10 );
        ylearnt_test_H10 = transpose(ztest_H10)*g_10;
        test_error_h10 = mean((ylearnt_test_H10-test_set(:,2)).*(ylearnt_test_H10-test_set(:,2)));
    
        %Update overfit_m
        overfit_m(i,1) = test_error_h10 - test_error_h2;
    end
    
    

end