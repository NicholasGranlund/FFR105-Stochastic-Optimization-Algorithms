function selectedIndividualIndex = TournamentSelect(fitnessList, tournamentProbability, tournamentSize)
    % Name: Nicholas Granlund
    % Date: 2023-09-05
    %

    % Randomly choose chromosomes
    fprintf('========== STARTING FUNCTION =========\n\n')
    selectedChromosomeIndexes = randi([1, length(fitnessList)], 1, tournamentSize);
    fprintf('CHOOSEN INDEXES:\n');
    fprintf('%d ', selectedChromosomeIndexes);  % Print the array as a list
    fprintf('\nCORRESPONDING FITNESSES:\n')
    fprintf('%d ', fitnessList(selectedChromosomeIndexes))

    % If tournamentSize is 1, simply return the selected chromosome
    if tournamentSize == 1
        selectedIndividualIndex = selectedChromosomeIndexes;
    
    % Otherwise, perform the tournament
    else
        for i = 1:tournamentSize
            r = rand();
        
            % Select highest fitness
            if (r < tournamentProbability)
                [~, index] = max(fitnessList(selectedChromosomeIndexes));
                selectedIndividualIndex = selectedChromosomeIndexes(index);
                fprintf('\nCHOOSING HIGHEST FITNESS, INDEX IS:\n');
                fprintf('%d\n', index);  % Print the selected index
                break;
        
            % Remove the highest fitness, repeat tournament
            else
                [~, index] = max(fitnessList(selectedChromosomeIndexes));
                selectedChromosomeIndexes(index) = [];
                fprintf('\nREMOVING HIGHEST FITNESS, INDEX IS:\n');
                fprintf('%d\n', index);  % Print the selected index
                fprintf('\nTHE INDEXES LEFT ARE:\n');
                fprintf('%d\n', selectedChromosomeIndexes);  % Print the selected index
                
            end
            
            % Check if there is only one chromosome left
            if length(selectedChromosomeIndexes) == 1
                selectedIndividualIndex = selectedChromosomeIndexes;
                fprintf('\nONLY ONE CHROMOSOME LEFT\n');
                break;
            end
        end
    end

    fprintf('OUTPUT:\n');
    fprintf('%d\n', selectedIndividualIndex);  % Print the final selected index

    fprintf('\n\n======================================\n\n')
end
