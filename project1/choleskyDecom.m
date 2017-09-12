function [S] = choleskyDecom(A)
  [n,n] = size(A);
  S = zeros(n,n);
  for j = 1 : n
    S(j,j) = sqrt(A(j,j) - S(j,1:j-1)*S'(1:j-1,j));
    S(j+1:n,j)=(A(j+1:n,j) - S(j+1:n,1:j-1) * S'(1:j-1,j))/S(j,j);
  end
end