function main()

[ num_iters, bounds] = perceptron_experiment ( 100, 10, 1000 );


histogram(log(abs(bounds-num_iters)));
xlabel('Log Difference between Theoretical Bounds and #Iterations');
ylabel('Frequency');
title('Histogram of Log Difference');



% x=1:1000;
% y=log(abs(bounds(x,1)-num_iters(x,1)));
% plot(y,x);
% xlabel('Experiment');
% ylabel('#Iterations');
% title('Histogram of #Iterations');
end