function [W, testAcc, L] = firstCV(x, y, lambdas)
[len, num] = size(x);
num = num / 6;
testAcc = zeros(1,6);
L = zeros(1,6);
W = zeros(205,6); 
for i = 0:5
    trainX = [x(:,1:i*num), x(:,(i+1)*num+1:end)];
    trainY = [y(1:i*num), y((i+1)*num+1:end)];
    testX = x(:,i*num+1:(i+1)*num);
    testY = y(i*num+1:(i+1)*num);
    [lambda, valAcc] = secondCV(trainX, trainY, lambdas);
    [w, c, acc] = svm(trainX, trainY, testX, testY, lambda);
    testAcc(i+1) = acc;
    L(i+1) = lambda;
    W(1:204,i+1) = w;
    W(end, i+1) = c;
end
end