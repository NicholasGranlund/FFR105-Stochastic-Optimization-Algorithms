function population = InitializePopulation(populationSize,numberOfGenes);
    % Name: Nicholas Granlund
    % Date: 2023-09-05
    %
    % Description: This function should take the population size and the
    % number of genes as input, and should return the entire population
    % as a matrix of binary numbers (i.e. as in the Matlab introduction).

    population = randi([0 1], populationSize, numberOfGenes);

end
