function selectedIndividualIndex = TournamentSelect(fitnessList, tournamentProbability, tournamentSize)
    % Name: Nicholas Granlund
    % Date: 2023-09-05
    %
    
    % Randomly choose chromosomes
    selectedChromosomeIndexes = randi([1, length(fitnessList)],1,tournamentSize);

    r = rand();
    
    % select highest fitness
    if (r < tournamentProbability)
        [~,i] = max(fitnessList(selectedChromosomeIndexes));
        selectedIndividualIndex = selectedChromosomeIndexes(i);

    % select lowest fitness
    else
        [~,i] = min(fitnessList(selectedChromosomeIndexes));
        selectedIndividualIndex = selectedChromosomeIndexes(i);
    end

end
