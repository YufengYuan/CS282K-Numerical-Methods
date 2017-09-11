function [S] = choleskyDecom(A)
  [n,n] = size(A);
  S = zeros(n,n);
  for j = 1 : n
    for i = j : n
      tempSum = 0
      for k = 1 : j-1
        tempSum += S(i,k)*S'(k,j);
      end
      if i == j
        S(i,j) = sqrt(A(i,j) - tempSum);
      else
        S(i,j) = (A(i,j) - tempSum) / S(j,j);
      end
    end
  end
end