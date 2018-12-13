function [ train_err, test_err ] = AdaBoost( X_tr, y_tr, X_te, y_te, n_trees )
%AdaBoost: Implement AdaBoost using decision stumps learned
%   using information gain as the weak learners.
%   X_tr: Training set
%   y_tr: Training set labels
%   X_te: Testing set
%   y_te: Testing set labels
%   n_trees: The number of trees to use
n = size(X_tr,1);
weightVec = zeros(n,1);
for i = 1:1:n
    weightVec(i,1) = 1/n;
end
alphaVec = zeros(1,n_trees);
TreeCellArray = cell(1,n_trees);
for i = 1:1:n_trees
    tree = fitctree(X_tr,y_tr,'SplitCriterion','deviance','Weights',weightVec,'MaxNumSplits',1);
    TreeCellArray{1,i} = tree;
    label = predict(tree,X_tr); 
    classErr = zeros(1,n);
    for j = 1:1:n
        if label(j,1) ~= y_tr(j,1)
           classErr(1,j) = 1;
        end
    end
    epsilonT = classErr*weightVec;
    alphaT = (1/2)*log((1-epsilonT)/epsilonT);
    alphaVec(1,i) = alphaT;
    Zt = 2*sqrt(epsilonT*(1-epsilonT));
    for j = 1:1:n
        if label(j,1) ~= y_tr(j,1)
           weightVec(j,1) = (weightVec(j,1)*exp(alphaT))/Zt;
        else
           weightVec(j,1) = (weightVec(j,1)*exp(-alphaT))/Zt;
        end
    end    
end
train_err = 0;
test_err = 0;
for i = 1:1:n
    Htx = 0;
    for j = 1:1:n_trees
        Htx = Htx + predict(TreeCellArray{1,j},X_tr(i,:))*alphaVec(1,j);
    end
    if sign(Htx)~=sign(y_tr(i,1))
        train_err = train_err + 1;
    end
end
train_err = train_err/n;
m = size(X_te,1);
for i = 1:1:m
    Htxtest = 0;
    for j = 1:1:n_trees
        Htxtest = Htxtest + predict(TreeCellArray{1,j},X_te(i,:))*alphaVec(1,j);
    end
    if sign(Htxtest)~=sign(y_te(i,1))
        test_err = test_err + 1;
    end
end
test_err = test_err/n;
end

