function fitness = EvaluateIndividual(x)
    % Name: Nicholas Granlund
    % Date: 2023-09-05
    %
    % Description: This function should take the vector of variables (x) 
    % as input, and should return the fitness value computed as 1/(g(x1,x2) + 1)

    functionValue = (1.5 - x(1) + x(1)*x(2))^2 + (2.25 - x(1) + x(1)*x(2)*x(2))^2 + (2.625 - x(1) + x(1)*x(2)*x(2)*x(2))^2;

    fitness = (functionValue + 1)^(-1);
end