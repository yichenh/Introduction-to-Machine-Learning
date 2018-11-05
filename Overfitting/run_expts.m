%Script that runs the set of necessary experiments

Q_f = 5:5:20; % Degree of true function
N = 40:40:120; % Number of training examples
var = 0:0.5:2; % Variance of stochastic noise

expt_data_mat = zeros(length(Q_f), length(N), length(var));

for ii = 1:length(Q_f)
    for jj = 1:length(N)
        for kk = 1:length(var)
            expt_data_mat(ii,jj,kk) = median(computeOverfitMeasure(Q_f(ii),N(jj),1000,var(kk),500));
        end
    end
    fprintf('.');
end

plot(Q_f,expt_data_mat(:,1,1))
hold on
plot(Q_f,expt_data_mat(:,1,2))
plot(Q_f,expt_data_mat(:,1,3))
plot(Q_f,expt_data_mat(:,1,4))
plot(Q_f,expt_data_mat(:,1,5))
legend({'var = 0','var = 0.5','var = 1.0','var = 1.5','var = 2'})
xlabel('Q_f')
ylabel('Median of overfit measure')
title('N = 40')