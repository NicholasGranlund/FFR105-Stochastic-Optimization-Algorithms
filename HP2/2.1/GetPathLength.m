function pathLength = GetPathLength(path,cityLocation)
    % GetPathLength - computes the length of the path
    %
    % By: Nicholas Granlund
    % Date: Oct 2023

    % Initialize pathLength to zero
    pathLength = 0;

    % Iterate over the edges
    for i=1:length(cityLocation)-1

        % Get start city location
        startCityLocation = cityLocation(path(i),:);

        % Get stop city location
        stopCityLocation = cityLocation(path(i+1),:);

        % Compute length and sum
        pathLength = pathLength + norm(startCityLocation-stopCityLocation);
    end

    % Add the final length from start node to finish node
    pathLength = pathLength + norm(stopCityLocation - cityLocation(1,:));

    % return

end

