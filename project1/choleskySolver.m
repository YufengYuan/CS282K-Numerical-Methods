function [X] = choleskySolver(A, B)
  %output_max_field_width
  [n, n] = size(A);
  V = zeros(n,1);
  for i = 1 : n
    tempSum = 0;
    for j = 1 : i-1
      tempSum += A(i,j)*V(j);
    end
    V(i) = (B(i) - tempSum) / A(i,i);
  end
  %X = V;
  %solve the inner loop the linear equations
  A = A';
  X = zeros(n,1);
  for i = n : -1 : 1
    tempSum = 0;
    for j = i+1 : n
      tempSum += A(i,j)*X(j);
    end
    X(i) = (V(i) - tempSum) / A(i,i);
  end
end