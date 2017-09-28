function theta = OMPSolver(A, B, lambda)
  F = B; omega = []; p = 1; [m,n] = size(A);
  for i = 1:lambda
    %A should be normalized first
    [value, index] = max(F' * A ./ sqrt(sum(A.^2)));
    #A * F
    F'*A
    omega = [omega, index];
    % not sure if backslash is allowed here
    alpha = A(:, omega) \ B;
    F = B - A(:, omega) * alpha;
  end
  theta = zeros(n,1);
  theta(omega) = alpha;
end