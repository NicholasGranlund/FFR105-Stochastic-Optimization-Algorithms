function deltaPheromoneLevel = ComputeDeltaPheromoneLevels(pathCollection,pathLengthCollection)
    % ComputeDeltaPheromoneLevels - computes the change in pheromone levels
    % for each edge
    %
    % By: Nicholas Granlund
    % Date: Oct 2023

    % Initialize deltaPheromoneLevels as a matrix of zeros
    deltaPheromoneLevel = zeros(size(pathCollection,2));

    % Iterate over the ants
    for i = 1:size(pathCollection, 2)
    
        % Get ant path and path length
        currentPath = pathCollection(i,:);
        currentPathLength = pathLengthCollection(i,:);

        % Iterate over the edges
        for j=1:length(currentPath)-1
            currentEdge = [currentPath(j), currentPath(j+1)];

            % Compute and add delta pheromone levels
            deltaPheromoneLevel(currentEdge) = deltaPheromoneLevel(currentEdge) + inv(currentPathLength);

        end

    end

    % return

end

