function [bestParticlePositions, bestSwarmPosition] = UpdateParticleAndSwarmBest(particleValues, ...
                                                                                 bestParticleValues, ...
                                                                                 bestSwarmValue, ...
                                                                                 particlePositions, ...
                                                                                 bestParticlePositions, ...
                                                                                 bestSwarmPosition)
    % UpdateParticleAndSwarmBest - updates the best position of each
    % particle and the global best position.
    %
    % By: Nicholas Granlund
    % Date: Oct 2023

    % 3.1 Update particle best positions
    for i = 1:length(particleValues)
        if particleValues(i) < bestParticleValues(i)
            bestParticlePositions(i, :) = particlePositions(i, :);
        end
    end

    % 3.2 Update swarm best position
    for i = 1:length(particlePositions)
        if particleValues(i) < bestSwarmValue
            bestSwarmPosition = particlePositions(i, :);
        end
    end
end
