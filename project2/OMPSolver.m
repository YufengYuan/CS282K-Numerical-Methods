function C = OMPSolver(points, blockSize, lambda)
  [b,n,m] = size(points);
  block = 1:1:blockSize;
  x = points(1,:,2)'; y = points(1,:,3)';
  matrix1 = cos(pi*(2*x-1)*(block-1)/(2*blockSize));
  matrix2 = cos(pi*(2*y-1)*(block-1)/(2*blockSize));
  matrix1 = repmat(matrix1, 1, blockSize);
  matrix2 = kron(matrix2, ones(1, blockSize));
  matrix = matrix1 .* matrix2;
  matrix /= blockSize; matrix *= 2;
  matrix(1,:) /= sqrt(2);
  matrix(:,1) /= sqrt(2);
  B = points(:,:,1)';
  %[b,n] = size(B);
  %matrix = reshape(matrix, 1, size(matrix)(1), size(matrix)(2));
  %A = repmat(matrix, b, 1);
  A = matrix;
  [m,n] = size(A);
  C = zeros(size(B)(2), n);
  for j = 1:size(B)(2)
    F = B(:,j);omega = [];
    for i = 1:lambda
      [value, index] = max(F' * A);
      omega = [omega, index];
      alpha = A(:, omega) \ B(:,j);
      F = B(:,j) - A(:, omega) * alpha;
    end
    theta = zeros(n,1)';
    theta(omega) = alpha;
    C(j,:) = theta;
  end
end