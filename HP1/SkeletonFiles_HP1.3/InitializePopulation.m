function population = InitializePopulation(populationSize,numberOfGenes);
    % Name: Nicholas Granlund
    % Date: 2022-04-14
    % Description: This function instantiates a population given the population size and
    % the number of parameters. The function returns a matrix with 
    % rows=individuals and columns=genes. 
    
    population = rand(populationSize, numberOfGenes);

end
