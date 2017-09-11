function [A, B] = linearEquationGen(p, mediumX, mediumY, leftBound, rightBound, topBound, bottomBound)
  A = LHS(p, mediumX, mediumY);
  B = RHS(p, leftBound, rightBound, topBound, bottomBound, mediumX, mediumY);
end

function [A] = LHS(p, mediumX, mediumY)
  [m, n] = size(p);
  A = zeros(m*n, m*n);
  for i = 1 : m
    for j = 1 : n
      k = (i - 1) * n + j;
      A(k, k) = 2*mediumX^2+2*mediumY^2;
      if j ~= 1
        A(k, (i - 1) * n + j - 1) = -mediumX^2;
      end
      if j ~= n
        A(k, (i-1)*n+j+1) = -mediumX^2;
      end
      if i ~= 1
        A(k, (i-2)*n+j) = -mediumY^2;
      end
      if i ~= m
        A(k, i*n+j) = -mediumY^2;
      end
    end
  end
end

function [B] = RHS(p, leftBound, rightBound, topBound, bottomBound, mediumX, mediumY)
  K = 157;
  p = flipud(p);
  [m, n] = size(p);
  B = zeros(m*n, 1);
  for i = 1 : m
    for j = 1 : n
      k = (i - 1) * n + j;
      B(k) = mediumX^2*mediumY*2*p(i, j) / K + boundValue(i, j, m, n, leftBound, rightBound, topBound, bottomBound, mediumX, mediumY);
    end
  end
end

function [Tc] = boundValue(x, y, m, n, leftBound, rightBound, topBound, bottomBound, mediumX, mediumY)
  Tc = 0;
  if x == 1
    Tc += leftBound(y)*mediumX^2;
  end
  if x == m
    Tc += rightBound(y)*mediumX^2;
  end
  if y == 1
    Tc += bottomBound(x)*mediumY^2;
  end
  if y == n
    Tc += topBound(x)*mediumY^2;
  end
end