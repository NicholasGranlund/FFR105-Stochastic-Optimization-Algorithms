% This method should return the coefficients of the k-th derivative (defined by
% the derivativeOrder) of the polynomial given by the polynomialCoefficients (see also GetPolynomialValue)

function derivativeCoefficients = DifferentiatePolynomial(polynomialCoefficients, derivativeOrder)
    % Function edited by Nicholas Granlund
    % Date: 2023-09-07

    % Check if derivativeOrder is valid
    if derivativeOrder <= 0
        error('derivativeOrder must be integer')
    end

    % Check if n < 2
    n = length(polynomialCoefficients)-1;
    if n < 1
        error('The polynomial order must be 2 or larger')
    end

    % Initialize derivativeCoefficients
    derivativeCoefficients = [];
    
    % Differentiate using recursion
    if derivativeOrder == 1
        for i=1:length(polynomialCoefficients)-1
            derivativeCoefficients(i) = polynomialCoefficients(i+1)*i;
        end
    else
        % Differentiate derivativOrder-1 to obtain the new polynomial coefficients
        newPolynomialCoefficients = DifferentiatePolynomial(polynomialCoefficients, derivativeOrder-1);
        
        % Differentiate once to get the final derivativeCoefficients
        derivativeCoefficients = DifferentiatePolynomial(newPolynomialCoefficients, 1);
    end
        
end