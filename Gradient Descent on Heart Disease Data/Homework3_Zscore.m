%Read data from training file
data_traing = csvread("clevelandtrain.csv",1,0);
size_data_training = size(data_traing);
%Changing the training data y from 0/1 to -1/1
for row = 1:size_data_training(1,1)
    if data_traing(row,size_data_training(1,2)) == 0
        data_traing(row,size_data_training(1,2)) = -1;
    end
end
X_training = zscore(data_traing(:,1:size_data_training(1,2)-1));
y_training = data_traing(:,size_data_training(1,2));
%Setting learning rate for our logistic regression algorithm
eta = 10^(1);
%Ein and w from our logistic regression algorithm
[ num_iteration, w, e_in ] = logistic_reg_zscore( X_training, y_training, zeros(size_data_training(1,2),1), eta );
%Classification error from our logistic regression algorithm
[ classificationErr_GD_trainingsample ] = find_test_error( w, X_training, y_training );




%Read data from test file
data_test = csvread("clevelandtest.csv",1,0);
size_data_test = size(data_test);

%Changing the test data y from 0/1 to -1/1
for row = 1:size_data_test(1,1)
    if data_test(row,size_data_test(1,2)) == 0
        data_test(row,size_data_test(1,2)) = -1;
    end
end
X_test = zscore(data_test(:,1:size_data_test(1,2)-1));
y_test = data_test(:,size_data_test(1,2));
[ classificationErr_GD_testsample ] = find_test_error( w, X_test, y_test );