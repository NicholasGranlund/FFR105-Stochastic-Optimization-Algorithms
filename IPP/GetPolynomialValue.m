% This function should return the value of the polynomial f(x) = a0x^0 + a1x^1 + a2x^2 ...
% where a0, a1, ... are obtained from polynomialCoefficients.

function value = GetPolynomialValue(x, polynomialCoefficients)

    % Initialize the variable value
    value = 0;

    % Iterate through the polynomialCoefficients and sum
    for i=1:length(polynomialCoefficients)
        value = value + (polynomialCoefficients(i)*x^(i-1));
    end

    % return

end