% This method should perform a single step of the Newton-Raphson method.
% Note: In cases where the step cannot be completed, e.g. if f" = 0, a
% clear error message should be given.

function xNext = StepNewtonRaphson(x, fPrime, fDoublePrime)
    % Function edited by Nicholas Granlund
    % Date: 2023-09-07

    % Check if denominator is 0
    if fDoublePrime == 0
        xNext = NaN;
        error('f prime prime equals 0, terminating program')

    % Else compute Newton-Raphson step
    else
        xNext = x - (fPrime / fDoublePrime);
    end

end