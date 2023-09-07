% This method should plot the polynomial and the iterates obtained
% using NewtonRaphsonStep (if any iterates were generated).

function PlotIterations(polynomialCoefficients, iterationValues)
    % Function edited by Nicholas Granlund
    % Date: 2023-09-07

    % Create figure window
    figure()
    hold on
    grid on
    
    % Set suitable x-range
    iterationValuesMean = mean(iterationValues);
    iterationValuesStd = std(iterationValues);

    % Create vector of x values in the suitable range
    xValues = linspace(iterationValuesMean - 3*iterationValuesStd, iterationValuesMean + 3*iterationValuesStd);
    
    % Initialize polynomeValues
    polynomeValues = [];
    
    % Obtain the polynome values in the range
    for i=1:length(xValues)
        polynomeValues(i) = GetPolynomialValue(xValues(i), polynomialCoefficients);
    end
    
    % Plot polynome
    plot(xValues, polynomeValues,'')

    % Initialize iterationPolynomeValues
    iterationPolynomeValues = [];
    
    % Plot Newton-Raphson steps
    for i=1:length(iterationValues)
        iterationPolynomeValues(i) = GetPolynomialValue(iterationValues(i),polynomialCoefficients);
        plot(iterationValues(i), iterationPolynomeValues(i),'k-o','MarkerSize',10);
        hold on
    end

end


