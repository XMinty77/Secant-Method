function [stop] = stop_relative(tolerance)
    % Stop when the relative error between the last two approximations is within a tolerance value
    stop = @(result, img, terms, diff) abs(diff / result) <= tolerance;
end