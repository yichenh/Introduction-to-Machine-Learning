fprintf('Working on the one-vs-three problem...\n\n');
load zip.train;
subsample = zip(find(zip(:,1)==1 | zip(:,1) == 3),:);
Y_learn = subsample(:,1);
X_learn = subsample(:,2:257);

load zip.test;
subsample = zip(find(zip(:,1)==1 | zip(:,1) == 3),:);
Y_test = subsample(:,1);
X_test = subsample(:,2:257);
[ single_error, aggregated_error ] = SingleAndAggregatedError(X_learn, Y_learn, X_test, Y_test);
fprintf('The test error of a single decision tree is %.4f\n', single_error);
fprintf('The test error of aggregated decision trees is %.4f\n', aggregated_error);

fprintf('\nNow working on the three-vs-five problem...\n\n');
load zip.train;
subsample = zip(find(zip(:,1)==3 | zip(:,1) == 5),:);
Y_learn = subsample(:,1);
X_learn = subsample(:,2:257);

load zip.test;
subsample = zip(find(zip(:,1)==3 | zip(:,1) == 5),:);
Y_test = subsample(:,1);
X_test = subsample(:,2:257);
[ single_error, aggregated_error ] = SingleAndAggregatedError(X_learn, Y_learn, X_test, Y_test);
fprintf('The test error of a single decision tree is %.4f\n', single_error);
fprintf('The test error of aggregated decision trees is %.4f\n', aggregated_error);

