function [e, lambda, imgOut] = imgRecover(imgIn, blkSize, numSample)
% Recover the input image from a small size samples
%
% INPUT:
%   imgIn: input image
%   blkSize: block size
%   numSample: how many samples in each block
%
% OUTPUT:
%   imgOut: recovered image
%
% @ 2011 Huapeng Zhou -- huapengz@andrew.cmu.edu
img = imgRead(imgIn);
[h,w] = size(img);

p = sample(img, blkSize, numSample);
%lambdas = [5, 10, 15, 20, 30];
lambdas = [50, 30, 20, 15, 10, 5];
%lambda = crossVal(p, h, w, blkSize, lambdas);

%fake
ce = 100000000;
for clambda = 50
  c = OMPSolver(p, blkSize, clambda);
  out = inverseDCT(c, h, w, blkSize);
  e = mse(out, img);
  if e < ce
    ce = e;
    lambda = clambda;
    imgOut = out;
  end
end
end