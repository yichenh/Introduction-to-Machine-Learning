function [ num_iters, bounds] = perceptron_experiment ( N, d, num_samples )
%perceptron_experiment Code for running the perceptron experiment in HW1
%   Inputs: N is the number of training examples
%           d is the dimensionality of each example (before adding the 1)
%           num_samples is the number of times to repeat the experiment
%   Outputs: num_iters is the # of iterations PLA takes for each sample
%            bound_minus_ni is the difference between the theoretical bound
%               and the actual number of iterations
%      (both the outputs should be num_samples long)
    num_iters = zeros(num_samples,1);
    bounds = zeros(num_samples,1);
    for i = 1:num_samples
        data_in = [ones(N,1),-1+2*rand(N,d),ones(N,1)];
        Woptinal = [0;-1+2*rand(d,1)];
        y = sign(data_in(:,1:d+1)*Woptinal);
        data_in(:,d+2) = y;
        [Wlearnt,iterations] = perceptron_learn(data_in);
        num_iters(i,1) = iterations;
        rho = min((data_in(:,1:d+1)*Wlearnt).*data_in(:,d+2));
        R = max(vecnorm(transpose(data_in(:,1:d+1))));
        bounds(i,1) = (R^2)*(vecnorm(Wlearnt))^2/(rho^2);
    end
    
    
end

