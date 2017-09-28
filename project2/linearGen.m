function [A, B] = linearGen(points, blockSize)
  [b,n,m] = size(points);
  block = 1:1:blockSize;
  x = points(1,:,2)'; y = points(1,:,3)';
  matrix1 = cos(pi*(2*x-1)*(block-1)/(2*blockSize));
  matrix2 = cos(pi*(2*y-1)*(block-1)/(2*blockSize));
  matrix1 = kron(matrix1, ones(1,2));
  matrix2 = [matrix2, matrix2];
  matrix = matrix1 .* matrix2;
  matrix /= blockSize; matrix *= 2;
  matrix(1,:) /= sqrt(2);
  matrix(:,1) /= sqrt(2);
  B = points(:,:,1);
  %[b,n] = size(B);
  %matrix = reshape(matrix, 1, size(matrix)(1), size(matrix)(2));
  %A = repmat(matrix, b, 1);
  A = matrix;
end