% This method should return the coefficients of the k-th derivative (defined by
% the derivativeOrder) of the polynomial given by the polynomialCoefficients (see also GetPolynomialValue)

function derivativeCoefficients = DifferentiatePolynomial(polynomialCoefficients, derivativeOrder)

    % Check if derivativeOrder is valid
    if derivativeOrder <= 0
        error('derivativeOrder must be integer')
    end

    % Check if n < 2
    n = length(polynomialCoefficients)-1;
    if n < 1
        error('The polynomial must be 2 or larger')
    end

    % Initialize derivativeCoefficients
    derivativeCoefficients = [];
    
    % Differentiate using recursion
    if derivativeOrder == 1
        for i=1:length(polynomialCoefficients)-1
            derivativeCoefficients(i) = polynomialCoefficients(i+1)*i;
        end
    else
        polynomialCoefficients = DifferentiatePolynomial(polynomialCoefficients, derivativeOrder-1);
        derivativeCoefficients = DifferentiatePolynomial(polynomialCoefficients, 1);
    end

    % return
        
end