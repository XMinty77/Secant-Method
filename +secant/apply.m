function [result1, result2, terms] = apply(f, x0, x1, stop, domain)
    % Initialize the variables
    result1 = x1
    result2 = x0
    terms = 0

    % Check if the domain has been provided
    if nargin < 5.
        % No domain was provided, default to all of the real numbers being allowed
        domain = [-Inf, Inf]

        % Check if a stopping criterion was provided
        if nargin < 4,
            % No stopping criterion was provided, default to never stopping until a complete convergence is achieved
            stop = @(w, x, y, z) false;
        end
    end

    % If either of the two guesses provided is already a root, then just return that as the result
    if f(x0) == 0, result1 = x0; result2 = x0; return; end
    if f(x1) == 0, result1 = x1; result2 = x1; return; end

    % Keep looping while the stopping criterion has not been yet reached
    while (~stop(result1, f(result1), terms, x1 - x0))
        % Clamp the values down to the provided domain
        if x0 < domain(1), x0 = domain(1); end
        if x0 > domain(2), x0 = domain(2); end
        if x1 < domain(1), x1 = domain(1); end
        if x1 > domain(2), x1 = domain(2); end
        if result1 < domain(1), result1 = domain(1); end
        if result1 > domain(2), result1 = domain(2); end
        if result2 < domain(1), result2 = domain(1); end
        if result2 > domain(2), result2 = domain(2); end

        % If we hit a floating point equilibrium then the denominator becomes 0 and causes an error
        % We stop iterating since all further iterates will be identical anyways and we will never get a better approximation
        if x1 == x0, return; end

        % If the last guess produces a zero, it is a root
        if f(x1) == 0, result1 = x1; result2 = x1; return; end

        % Even if the guesses are not equal, we may hit a floating point contraction in the function outputs
        % In that case, we add a small regularization term to avoid problems in the denominator
        % We may also have two guesses that achieve a flat secant, in most cases the algorithm is just not suitable for these cases,
        % but it may be accounted for by this method
        epsilon = 0
        if f(x1) == f(x0), epsilon = 1e-6 * f(x1); end

        % Find the next iteration of the approximation using the secant formula
        result1 = x1 - f(x1) * (x1 - x0) / (f(x1) - f(x0) + epsilon);
        x0 = x1;
        x1 = result1;
        result2 = x0;
        terms = terms + 1;
    end
end