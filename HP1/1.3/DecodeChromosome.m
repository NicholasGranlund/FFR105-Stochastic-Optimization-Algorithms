function x = DecodeChromosome(chromosome,numberOfVariables,maximumVariableValue)
    % Name: Nicholas Granlund
    % Date: 2023-09-05
    %
    % Description: This function should take as input:
    %
    % (i)       a (binary) chromosome
    % (ii)      the number of variables that are to be extracted
    % (iii)     the maximum variable value.
    % 
    % Let m denote the chromosome length and n the number of variables, 
    % and let k = m/n. The first k bits should be used when forming x1,
    % the next k bits should be used for generating x2 etc. Each variable
    % should be decoded from the k bits according to Eq. (3.9) in the
    % course book. You may assume that m and n have been chosen such
    % that k is an integer.
    %
    % Note: Each component of x should take values in [-a,a], where a = maximumVariableValue.

    m = length(chromosome);
    n = numberOfVariables;
    k = m/n;
    a = maximumVariableValue;

    x = zeros(n,1);
    
    for i=1:n
        for j=1:k
            x(i) = x(i) + chromosome(j+(i*k - k))*2^(-j);
        end
        x(i) = -maximumVariableValue + 2*maximumVariableValue * x(i)/(1 - 2^(-k));
    end

end

