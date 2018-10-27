function [ w, iterations ] = perceptron_learn( data_in )
%perceptron_learn Run PLA on the input data
%   Inputs: data_in: Assumed to be a matrix with each row representing an
%                    (x,y) pair, with the x vector augmented with an
%                    initial 1, and the label (y) in the last column
%   Outputs: w: A weight vector (should linearly separate the data if it is
%               linearly separable)
%            iterations: The number of iterations the algorithm ran for
    iterations = 0;
    w = zeros(11,1);
    while 1
        iterations = iterations+1;
        size_data = size(data_in);
        y = sign(data_in(:,1:size_data(1,2)-1)*w);
            if isequal(y,data_in(:,size_data(1,2)))
                break
            end
        diff = find(y~=data_in(:,size_data(1,2)));
        diff = diff(1,1);
        w = w + transpose(data_in(diff,size_data(1,2))*data_in(diff,1:size_data(1,2)-1));
    end
end