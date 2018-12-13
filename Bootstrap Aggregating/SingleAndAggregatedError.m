%Function that returns the test errors of the single decision tree model and
% of the aggregated tree model
function [ single_error, aggregated_error ] = SingleAndAggregatedError(X_learn, Y_learn, X_test, Y_test)
    
    %Size of X_learn is num_learning_sample*num_feature
    size_X_learn = size(X_learn);
    %Size of X_test is num_testing_sample*num_feature
    size_X_test = size(X_test);
    
    
    %Single Decision Tree Model
    singleTree = fitctree(X_learn,Y_learn);
    single_error = mean(predict(singleTree, X_test)~=Y_test);
    
    
    %Aggregated Decision Tree Model
    
    %Generate an index matrix that contains all the indices of X within
    %each bag. The size of the index matrix is num_sample*numBags. Note:
    %everg entry in the index matrix is a random number from 1 to n.
    indices = ceil(size_X_learn(1)*rand(size_X_learn(1),200));
    
    %Generate a cell that contains 200 learned trees
    trees = cell(200,1);
    %Learn 200 different trees based on different resampled samples
    for i = 1:200
        tree = fitctree(X_learn(indices(:,i),:),Y_learn(indices(:,i),1));
        trees{i,1} = tree;
    end
    %Generate 200*num_testing_sample to hole all the decisions
    decisions = ones(200,size_X_test(1));
    for i = 1:200
        tree = trees{i,1};
        decisions(i,:)= transpose(predict(tree,X_test)~=Y_test);
    end
    %If the mean(decisions) is more than 0.5 then it's classified wrong by
    %majority vote. Therefore, it is rounded up to 1 otherwise it's 0.
    aggregated_error = mean(round(mean(decisions)));
    
end