function [lambda] = crossVal(p, h, w, blockSize, lambdas)
  error = zeros(size(lambdas));
  for l = 1:size(lambdas)(2)
    for m = 1:20
      order = randperm(size(p)(2));
      testP = p(1,order,:)(1,1:floor(size(p)(2)/6),:);
      trainP = p(1,order,:)(1,(floor(size(p)(2)/6)+1):size(p)(2),:);
      c = OMPSolver(p, blockSize, lambdas(l));
      img = inverseDCT(c, h, w, blockSize);
      for i=1:floor(size(p)(2)/6)
        x = testP(1,i,2);
        y = testP(1,i,3);
        error(l) += (testP(:,i,1)-img(x,y))^2;
      end
    end
    error(l) = sqrt(error(l));
  end
  [value, index] = min(error)
  lambda = lambdas(index);
end