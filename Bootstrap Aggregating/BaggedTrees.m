function [ oobErr ] = BaggedTrees( X, Y, numBags )
%BAGGEDTREES Returns out-of-bag classification error of an ensemble of
%numBags CART decision trees on the input dataset, and also plots the error
%as a function of the number of bags from 1 to numBags
%   Inputs:
%       X : Matrix of training data
%       Y : Vector of classes of the training examples
%       numBags : Number of trees to learn in the ensemble
%
%   You may use "fitctree" but do not use "TreeBagger" or any other inbuilt
%   bagging function

    %Size of X is num_sample*num_feature
    size_X = size(X);
    
    %Generate an index matrix that contains all the indices of X within
    %each bag. The size of the index matrix is num_sample*numBags. Note:
    %everg entry in the index matrix is a random number from 1 to n.
    indices = ceil(size_X(1)*rand(size_X(1),numBags));
    
    %Generate a num_sample*(2*numBags) cell that contains tuples of 
    %(num of trees that don't use the data point, num of trees 
    %that classified wrong)
    results = ones(size_X(1),2*numBags);
    
    for bag = 1:numBags
        if bag == 1
            firstTree = fitctree(X(indices(:,1),:),Y(indices(:,1),1));
            for sample = 1:size_X(1)
                if ismember(sample,indices(:,1))
                    results(sample,1:2) = [0,0];
                else
                    results(sample,1:2) = [1,predict(firstTree,X(sample,:))~=Y(sample,1)];
                end
            end
        else
            tree = fitctree(X(indices(:,bag),:),Y(indices(:,bag),1));
            for sample = 1:size_X(1)
                if ismember(sample,indices(:,bag))
                    results(sample,bag*2-1:bag*2) = results(sample,(bag-1)*2-1:(bag-1)*2);
                else
                    results(sample,bag*2-1:bag*2) = [results(sample,(bag-1)*2-1)+1,results(sample,(bag-1)*2)+predict(tree,X(sample,:))~=Y(sample,1)];
                end
            end
        end
    end

    %num_sample*numBags Error Matrix
    error = ones(size_X(1),numBags);
    for bagIndex = 1:numBags
        error(:,bagIndex) = results(:,2*bagIndex)./results(:,2*bagIndex-1);
    end
    
    error = mean(error);
    plot(1:numBags,error);
    xlabel('Number of Bags')
    ylabel('Out of Bag Error')
%     title('Three Versus Five')
    oobErr = error(numBags);
end
