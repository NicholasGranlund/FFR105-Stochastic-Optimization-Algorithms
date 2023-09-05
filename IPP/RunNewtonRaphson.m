% This function should run the Newton-Raphson method, making use of the
% other relevant functions (StepNewtonRaphson, DifferentiatePolynomial, and
% GetPolynomialValue). Before returning iterationValues any non-plottable values 
% (e.g. NaN) that can occur if the method fails (e.g. if the input is a
% first-order polynomial) should be removed, so that only values that
% CAN be plotted are returned. Thus, in some cases (again, the case of
% a first-order polynomial is an example) there may be no points to plot.

function iterationValues = RunNewtonRaphson(polynomialCoefficients, startingPoint, tolerance)

% Initialize iterationValues
iterationValues = startingPoint;

% Iterate NewtonRaphson for a maximum of 100 iterations
for i = 1:100

    % Get derivative coefficients
    fPrimeDerivativeCoefficients = DifferentiatePolynomial(polynomialCoefficients, 1);
    fDoublePrimeDerivativeCoefficients = DifferentiatePolynomial(polynomialCoefficients, 2);

    % Get derivative values
    fPrime = GetPolynomialValue(iterationValues(i), fPrimeDerivativeCoefficients);
    fDoublePrime = GetPolynomialValue(iterationValues(i), fDoublePrimeDerivativeCoefficients);

    % Perform Newton-Raphson step
    iterationValues(i+1) = StepNewtonRaphson(iterationValues(i), fPrime, fDoublePrime);

    % if solutions has converged, break
    if abs(iterationValues(i+1)-iterationValues(i)) < tolerance
        break
    end

    % return

end




