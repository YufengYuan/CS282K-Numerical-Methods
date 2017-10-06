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
lambdas = [50, 30, 20, 15, 10, 5];
lambda = crossVal(p, h, w, blkSize, lambdas);
c = OMPSolver(c, h, w, lambda);
imgOut = inverseDCT(c, h, w, blkSize);
imgOut = medfilt2(imgOut);
e = mse(imgOut, img);
end