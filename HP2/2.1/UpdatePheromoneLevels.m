function pheromoneLevel = UpdatePheromoneLevels(pheromoneLevel,deltaPheromoneLevel,rho)
    % UpdatePheromoneLevels - updates the pheromone levels on the edges
    % 
    % By: Nicholas Granlund
    % Date: Oct 2023

    % Update the pheromone levels
    pheromoneLevel = (1-rho).*pheromoneLevel + deltaPheromoneLevel;

    % Include the lower bound
    lowerBound = 1e-15;
    pheromoneLevel(pheromoneLevel < lowerBound) = lowerBound;

    % return

end

