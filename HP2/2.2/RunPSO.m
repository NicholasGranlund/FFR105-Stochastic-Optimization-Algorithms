%% Particle swarm optimization (PSO)
%
% By Nicholas Granlund
% Date: Oct 2023

close all;
clear cll;
clc

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% PARAMETERS
xMax = 5;
xMin = -5;
alpha = 1;
beta = 0.99;
deltaT = 1;
N = 30;
n = 2;
c1 = 2;
c2 = 2;
inertiaWeight = 1.4;
vMax = 3;
tol = 1e-15;
maxIterations = 10000;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% 1. Initialize positions and velocities of the particles p_i
[particlePositions, particleVelocities] = InitializeParticles(N, ...
                                                              n, ...
                                                              alpha, ...
                                                              deltaT, ...
                                                              xMin, ...
                                                              xMax);

% Set the best position / values as the inital ones to use in the first
% iteration of the loop
bestParticlePositions = particlePositions;
bestParticleValues = GetFunctionValues(bestParticlePositions);
[~, ind] = min(bestParticleValues);
bestSwarmPosition = bestParticlePositions(ind,:);
bestSwarmValue = GetFunctionValues(bestSwarmPosition);

% Start counter
counter = 0;

% Run Particle Swarm Optimization until function value is below tol
while bestSwarmValue > tol

    % Increment counter
    counter = counter + 1;

    % 2. Get function values at particle position
    particleValues = GetFunctionValues(particlePositions);

    % 3. Update the best particle positions.
    [bestParticlePositions, bestSwarmPosition] = UpdateParticleAndSwarmBest(particleValues, ...
                                                                            bestParticleValues, ...
                                                                            bestSwarmValue, ...
                                                                            particlePositions, ...
                                                                            bestParticlePositions, ...
                                                                            bestSwarmPosition);

    % 4. Update particle velocities and positions
    [particlePositions, particleVelocities] = UpdateParticles(particlePositions, ...
                                                              particleVelocities, ...
                                                              bestParticlePositions, ...
                                                              bestSwarmPosition, ...
                                                              c1, ...
                                                              c2, ...
                                                              deltaT, ...
                                                              inertiaWeight, ...
                                                              vMax);

    % 5. Update the termination critera
    bestSwarmValue = GetFunctionValues(bestSwarmPosition);

    % 6. Reduce the inertia weight
    inertiaWeight = max([inertiaWeight*beta, 0.4]);

    % 7. Check if PSO has run for an unusual long time
    if counter == maxIterations
        fprintf('Terminating PSO, max iteration reached.')
        break
    end
end


% Scatter the particles on the function contour
[X,Y] = meshgrid(linspace(xMin, xMax), linspace(xMin, xMax));
Z = reshape(log(0.05 + GetFunctionValues([reshape(X,[],1),reshape(Y,[],1)])),100,100);
contour(X,Y,Z,25);
grid on; hold on
scatter(bestParticlePositions(:,1), bestParticlePositions(:,2), 100, 'filled')
scatter(bestSwarmPosition(:,1), bestSwarmPosition(:,2), 100, 'filled')
xlabel('x_1', 'fontsize', 18); ylabel('x_2', 'fontsize', 18)
legend('contour of f(x_1, x_2)', 'Particle Swarm', 'Best Particle')

% Print result
fprintf('PSO minimum:\n\nx1:%16.6f\nx2:%16.6f\nf(x1,x2):%10.6f\n\n', bestSwarmPosition(:,1), ...
                                                                     bestSwarmPosition(:,2), ...
                                                                     bestSwarmValue)


