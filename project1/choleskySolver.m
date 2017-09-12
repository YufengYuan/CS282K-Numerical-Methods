function [X] = choleskySolver(A, B)
  %solve the outer loop of the linear equations
  [n, n] = size(A);
  V = zeros(n,1);
  for i = 1 : n
    V(i) = (B(i) - A(i,1:i-1) * V(1:i-1)) / A(i,i);
  end
  %solve the inner loop of the linear equations
  A = A';
  X = zeros(n,1);
  for i = n : -1 : 1
    X(i) = (V(i) - A(i,i+1:n) * X(i+1:n)) / A(i,i);
  end
end