function newIndividuals = Cross(individual1, individual2)
    % Name: Nicholas Granlund
    % Date: 2023-09-05
    %
    % Description: This function returns a pair of new chromosomes by cross-breeding
    % two initial chromosomes. the crossoverpoint is randomly determined.

    crossoverPoint = randi(length(individual1));

    newIndividuals = [individual1(1:crossoverPoint) individual2(crossoverPoint+1:end);
                         individual2(1:crossoverPoint) individual1(crossoverPoint+1:end)];

end
