function [stop] = stop_terms(max)
    % Stop after calculating a maximum number of iteration terms
    stop = @(result, img, terms, diff) terms >= max;
end