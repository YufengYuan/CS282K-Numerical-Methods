function [ Temperature ] = thermalsimCholesky( p, mediumX, mediumY, leftBound, rightBound, topBound, bottomBound )
%THERMALSIMCHOLESKY solves the 2D steady state thermal problem using
%Cholesky factorization
%   INPUT:
%   p:  discretized power density
%   mediumX:    x-dimension of the medium
%   mediumY:    y-dimension of the medium
%	leftBound:	Temperature at the left boundary (x=0), leftBound(j) means
%	the temperature at T(0,j)
%	rightBound:	Temperature at the right boundary (x=N+1)
%	topBound:	Temperature at the top boundary (y=M+1)
%	bottomBound:	Temperature at the bottom boundary (y=0)
%
%   OUTPUT:
%   Temperature: solved thermal map

  [m, n] = size(p);
  [A, B] = linearEquationGen(p, mediumX, mediumY, leftBound, rightBound, topBound, bottomBound);
  A = choleskyDecom(A);
  %A = chol(A, 'lower');
  %C*C'*T = B => C*X = B, C'T = X
  T = choleskySolver(A,B);
  Temperature = reshape(T, n, m);
end
