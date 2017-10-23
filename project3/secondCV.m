function [lambda, valAcc] = secondCV(trainX, trainY, lambdas)
    [len, num] = size(trainX);
    num = num/5;
    valAcc = 0;
    for l = lambdas
        index = 0;
        tempAcc = zeros(1, 5);
        while index < 5
            subTrainX = [trainX(:,1:index*num),trainX(:,(index+1)*num+1:end)];
            subTrainY = [trainY(1:index*num),trainY((index+1)*num+1:end)];
            subTestX = trainX(:, index*num+1:(index+1)*num);
            subTestY = trainY(index*num+1:(index+1)*num);
            [W, C, acc] = svm(subTrainX, subTrainY, subTestX, subTestY, l);
            tempAcc(index+1) = acc;
            index = index + 1;
        end
        if mean(tempAcc) > valAcc
            lambda = l;
            valAcc = mean(tempAcc);
        end
    end
end