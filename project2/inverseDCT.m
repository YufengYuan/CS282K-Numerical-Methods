function [img] = inverseDCT(c, h, w, blockSize)
  block = 1:1:blockSize;
  x = 1:1:blockSize; y = 1:1:blockSize;
  matrix1 = cos(pi*(block'-1)*(2*x-1)/(2*blockSize));
  matrix2 = cos(pi*(block'-1)*(2*y-1)/(2*blockSize));
  
  matrix1 = repmat(matrix1, blockSize, blockSize);
  matrix2 = kron(matrix2, ones(blockSize,blockSize));
  
  matrix = matrix1 .* matrix2;
  matrix /= blockSize; matrix *= 2;
  matrix(1,:) /= sqrt(2);
  matrix(:,1) /= sqrt(2);
  A = matrix;
  %img = zeros(size(c)(1), blockSize, blockSize);
  img = zeros(h, w);
  for j = 1:size(c)(1)
    tmp = A \ c(j,:)';
    tmp(1) /= 2;
    %img(j,:,:) = reshape(tmp, 1, blockSize, blockSize);
    x = floor((j-1)/(w/blockSize));
    y = mod(j-1,w/blockSize);
    img(x*blockSize+1:x*blockSize+blockSize, y*blockSize+1:y*blockSize+blockSize) = reshape(tmp', blockSize, blockSize);
  end
end