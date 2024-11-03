function [stop] = stop_error(tolerance)
    % Stop when the image of the approximation is within a tolerance value of zero (close enough to be a root)
    stop = @(result, img, terms, diff) abs(img) <= tolerance;
end