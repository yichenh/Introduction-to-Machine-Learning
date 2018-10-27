%Read data from training file
data_traing = csvread("clevelandtrain.csv",1,0);
size_data_training = size(data_traing);

%Use the built-in glmfit function to get the weight
w_glmfit = glmfit(data_traing(:,1:size_data_training(1,2)-1),data_traing(:,size_data_training(1,2)),'binomial');

%Changing the training data y from 0/1 to -1/1
for row = 1:size_data_training(1,1)
    if data_traing(row,size_data_training(1,2)) == 0
        data_traing(row,size_data_training(1,2)) = -1;
    end
end
X_training = data_traing(:,1:size_data_training(1,2)-1);
y_training = data_traing(:,size_data_training(1,2));
%Setting max_iteration for our logistic regression algorithm
max_iteration = 10000;

%Ein and w from our logistic regression algorithm
[ w, e_in ] = logistic_reg( X_training, y_training, zeros(size_data_training(1,2),1), max_iteration, 10^(-5) );
%Classification error from our logistic regression algorithm
[ classificationErr_GD_trainingsample ] = find_test_error( w, X_training, y_training );


%Ein for glmfit weight
% e_in_glmfit = 0;
%     for row = 1:size_X(1,1)
%             e_in_glmfit = e_in_glmfit + log(1+exp(-y(row,1)*X(row,:)*w_glmfit));
%     end
% e_in_glmfit = e_in_glmfit/size_X(1,1);


%Classification error for glmfit weight
[ classificationErr_glmfit_trainingsample ] = find_test_error( w_glmfit, X_training, y_training );

%Read data from test file
data_test = csvread("clevelandtest.csv",1,0);
size_data_test = size(data_test);

%Changing the test data y from 0/1 to -1/1
for row = 1:size_data_test(1,1)
    if data_test(row,size_data_test(1,2)) == 0
        data_test(row,size_data_test(1,2)) = -1;
    end
end
X_test = data_test(:,1:size_data_test(1,2)-1);
y_test = data_test(:,size_data_test(1,2));
[ classificationErr_GD_testsample ] = find_test_error( w, X_test, y_test );
[ classificationErr_glmfit_testsample ] = find_test_error( w_glmfit, X_test, y_test );
