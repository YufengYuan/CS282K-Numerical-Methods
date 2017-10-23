function [W, testAcc, L] = main(class)
lambdas = [0.01, 1, 100, 10000];
x1 = cell2mat(class(1))
x2 = cell2mat(class(2))
[len, num] = size(x1);
x = zeros(len, 2*num);
for i=1:num
    x(:, 2*i-1) = x1(:,i);
    x(:, 2*i)   = x2(:,i);
end
y = ones(1, 2*num);
ind = 1:2:2*num;
y(ind) = -1;
[W, testAcc, L] = firstCV(x, y, lambdas);


end