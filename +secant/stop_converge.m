function [stop] = stop_converge(tolerance)
    % Stop when the difference between the last two approximations is within a tolerance value
    stop = @(result, img, terms, diff) abs(diff) <= tolerance;
end