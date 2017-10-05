function samplePoints = sample(imgIn, blockSize, sampleNum)
  [h,w] = size(imgIn);
  imgBlock = zeros(h*w/blockSize^2, blockSize, blockSize);
  for i = 1:h*w/blockSize^2
    x = floor((i-1)/(w/blockSize));
    y = mod(i-1,(w/blockSize));
    block = imgIn(x*blockSize+1:x*blockSize+blockSize, y*blockSize+1:y*blockSize+blockSize);
    imgBlock(i,:,:) = reshape(block, 1, blockSize, blockSize);
  end
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
