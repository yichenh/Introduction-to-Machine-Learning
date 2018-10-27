%Read data from training file
data_traing = csvread("clevelandtrain.csv",1,0);
size_data_training = size(data_traing);

%Use the built-in glmfit function to get the weight
w_glmfit = glmfit(data_traing(:,1:size_data_training(1,2)-1),data_traing(:,size_data_training(1,2)),'binomial');

size_X = size(data_traing(:,1:size_data_training(1,2)-1));


%Changing the training data y from 0/1 to -1/1
for row = 1:size_data_training(1,1)
    if data_traing(row,size_data_training(1,2)) == 0
        data_traing(row,size_data_training(1,2)) = -1;
    end
end
X_training = data_traing(:,1:size_data_training(1,2)-1);
y_training = data_traing(:,size_data_training(1,2));
X_training = [ones(size_X(1,1),1) X_training];
size_X = size(X_training);
e_in = 0;
for row = 1:size_X(1,1)
            e_in = e_in + log(1+exp(-y_training(row,1)*X_training(row,:)*w_glmfit));
end
e_in = e_in/size_X(1,1);