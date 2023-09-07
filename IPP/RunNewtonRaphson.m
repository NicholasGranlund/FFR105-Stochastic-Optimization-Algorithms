% This function should run the Newton-Raphson method, making use of the
% other relevant functions (StepNewtonRaphson, DifferentiatePolynomial, and
% GetPolynomialValue). Before returning iterationValues any non-plottable values 
% (e.g. NaN) that can occur if the method fails (e.g. if the input is a
% first-order polynomial) should be removed, so that only values that
% CAN be plotted are returned. Thus, in some cases (again, the case of
% a first-order polynomial is an example) there may be no points to plot.

function iterationValues = RunNewtonRaphson(polynomialCoefficients, startingPoint, tolerance)
    % Function edited by Nicholas Granlund
    % Date: 2023-09-07

    % Initialize iterationValues
    iterationValues = startingPoint;

    % Set maxIterations
    maxIterations = 100;
    
    % Iterate NewtonRaphson for a maximum of 100 iterations
    for i = 1:maxIterations
    
        % Get derivative coefficients
        fPrimeDerivativeCoefficients = DifferentiatePolynomial(polynomialCoefficients, 1);
        fDoublePrimeDerivativeCoefficients = DifferentiatePolynomial(polynomialCoefficients, 2);
    
        % Get derivative values
        fPrime = GetPolynomialValue(iterationValues(i), fPrimeDerivativeCoefficients);
        fDoublePrime = GetPolynomialValue(iterationValues(i), fDoublePrimeDerivativeCoefficients);
    
        % Perform Newton-Raphson step
        iterationValues(i+1) = StepNewtonRaphson(iterationValues(i), fPrime, fDoublePrime);
    
        % if solution has converged, break
        if abs(iterationValues(i+1)-iterationValues(i)) < tolerance
            break
        end
        
    end

    % Print out information
    if i == maxIterations
        fprintf(['OBS. Maximum iterations reached...\nSolution has either diverged ' ...
            'or \nstartingPoint was choosen far from local optima\n'])
    else
        fprintf('Solution found!\nIt took i=%d iterations to find solution\n', i);
        fprintf('Local minimum at x=%.4f\n', iterationValues(end))
        fprintf('Local minimum value yMin=%.4f\n', GetPolynomialValue(iterationValues(end),polynomialCoefficients))
    end

end




