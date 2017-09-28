function samplePoints = sample(imgIn, blockSize, sampleNum)
  [h,w] = size(imgIn);
  imgBlock = reshape(imgIn, h*w/blockSize^2, blockSize, blockSize);
  %just for testing
  perm = randperm(blockSize^2);
  samplePoints = zeros(h*w/blockSize^2, sampleNum, 3);
  for i = 1 : sampleNum
    x = fix((perm(i)-1) / blockSize)+1; 
    y = mod(perm(i), blockSize) + 1;
    pixels = imgBlock(:,x,y);
    samplePoints(:,i,1) = pixels;
    samplePoints(:,i,2) = x;
    samplePoints(:,i,3) = y;
  end
end
