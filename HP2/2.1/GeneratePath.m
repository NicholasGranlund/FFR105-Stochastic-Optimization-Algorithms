function path = GeneratePath(pheromoneLevel, visibility, alpha, beta)
    % GeneratePath - generates a path for ant
    %
    % By: Nicholas Granlund
    % Date: Oct 2023
    
    % Initialize tabu list
    tabuList = [];

    % Generate random starting point
    randomStartingNode = randi(length(visibility));
    
    % Add starting point to tabu list
    tabuList = [tabuList randomStartingNode];

    % Build the tour S
    while length(tabuList) < size(pheromoneLevel, 2)
        nextNode = GetNode(tabuList, pheromoneLevel, visibility, alpha, beta);
        tabuList = [tabuList nextNode];
    end

    % set path as the complete tabuList
    path = tabuList;

    % return

end

function nextNode = GetNode(tabuList, pheromoneLevel, visibility, alpha, beta)
    % GetNode - returns the next note in path
    %
    % By: Nicholas Granlund
    % Date: Oct 2023

    % Initialize probability list
    probabilityList = zeros(1, length(visibility))';

    % Start node is the last node in tabuList
    j = tabuList(end);

    % If node in tabuLust, skip
    for i = 1:length(visibility)
        if any(tabuList == i)
            continue;
        else

            % Compute numerator
            numerator = pheromoneLevel(i, j)^(alpha) * visibility(i, j)^(beta);

            % Compute denominator
            denominator = 0;
            for l = 1:length(probabilityList)
                if any(tabuList == l)
                    continue;
                else
                    denominator = denominator + (pheromoneLevel(l, j)^(alpha) * visibility(l, j)^(beta));
                end
            end
            
            % Add p(e_ij | S) to probabilityList
            probabilityList(i) = numerator / denominator;

        end
    end

    % Select nextNode
    probabilityList = cumsum(probabilityList);
    nextNode = find(rand() < probabilityList, 1);

    % return

end
