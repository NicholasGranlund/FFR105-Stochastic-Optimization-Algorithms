%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Parameter specifications
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
close all
clear all
clc

numberOfRuns = 100;                % Do NOT change
populationSize = 100;              % Do NOT change
maximumVariableValue = 5;          % Do NOT change (x_i in [-a,a], where a = maximumVariableValue)
numberOfGenes = 50;                % Do NOT change
numberOfVariables = 2;		       % Do NOT change
numberOfGenerations = 300;         % Do NOT change
tournamentSize = 2;                % Do NOT change
tournamentProbability = 0.75;      % Do NOT change
crossoverProbability = 0.8;        % Do NOT change


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Batch runs
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


mutationProbabilities = [0:0.005:0.1 0.11:0.01:0.4]
maximumFitnessMatrix = zeros(numberOfRuns,length(mutationProbabilities));

% Iterate through the mutation probabilities
for i = 1:length(mutationProbabilities)
    
    % Print what mutation rate is currently beeing evalutated
    fprintf('\nMutation rate = %0.2f%%\n', mutationProbabilities(i)*100)
    
    % Do 100 runs
    for j = 1:numberOfRuns 
        [maximumFitness, ~]  = RunFunctionOptimization(populationSize, numberOfGenes, numberOfVariables, maximumVariableValue, tournamentSize, ...
                                           tournamentProbability, crossoverProbability, mutationProbabilities(i), numberOfGenerations);
      fprintf('\nRun: %d, Score: %0.10f', j, maximumFitness);

      % Save value for the maximumFitness for that run
      maximumFitnessMatrix(j,i) = maximumFitness;
    end
    
    % Print information about the run
    fprintf('\n\nRun Done\n')
    fprintf('PMut = %0.2f%%\n', mutationProbabilities(i)*100)
    fprintf('Median fitness  = %0.8f\n', median(maximumFitnessMatrix(:,i)))
    fprintf('Average fitness = %0.8f\n', mean(maximumFitnessMatrix(:,i)))
    fprintf('STD fitness     = %0.8f\n', sqrt(var(maximumFitnessMatrix(:,i))))
    
end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Summary of results
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Plot the median fitness for a given mutation probability
figure()
hold on
grid on
semilogy(mutationProbabilities(2:end), median(maximumFitnessMatrix(:,2:end)), 'LineWidth',2, 'color', '#0072BD')
xlabel('Mutation probability')
ylabel('Fitness value')
legend('Median')

result = [mutationProbabilities' median(maximumFitnessMatrix)' sqrt(var(maximumFitnessMatrix))']
