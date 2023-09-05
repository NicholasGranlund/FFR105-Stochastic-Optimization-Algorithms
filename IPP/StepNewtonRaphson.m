% This method should perform a single step of the Newton-Raphson method.
% Note: In cases where the step cannot be completed, e.g. if f" = 0, a
% clear error message should be given.

function xNext = StepNewtonRaphson(x, fPrime, fDoublePrime)

    % Check if denominator is 0
    if fDoublePrime == 0
        xNext = NaN;
        error('f prime prime equals 0')
    else
        % Compute Newton-Raphson step
        xNext = x - (fPrime / fDoublePrime);
    end

    % return

end