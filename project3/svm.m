function [W,C, acc] = svm(trainX, trainY, testX, testY, lambda)
clear prob;
[num, len] = size(trainX');
% epsilon vector
prob.c = [zeros(1,204), ones(1,num), 0]';
% Q vector in sparse matrix form
prob.qosubi = [1:204+num+1]';
prob.qosubj = [1:204+num+1]';
prob.qoval  = [ones(1,204), zeros(1,num+1)]' * 2 * lambda;
% a the constraint
a1 = repmat(trainY', 1, 204).* trainX';
a2 = eye(num);
%a = blkdiag(a1, a2);
a = [a1 a2 trainY'];
prob.a = a;

% bounds of constraints
prob.blc = [ones(1,num)]';
prob.buc = [inf * ones(1,num)]';

% bounds of variables
prob.blx = [ones(1,204)*(-inf) zeros(1,num), -inf];
prob.bux = [];

[r, res] = mosekopt('minimize', prob)

W = res.sol.itr.xx(1:204);
C = res.sol.itr.xx(end);
v = W'*testX + C;
v(v>=0) = 1;v(v<0) = -1;
acc = mean(v == testY);

end