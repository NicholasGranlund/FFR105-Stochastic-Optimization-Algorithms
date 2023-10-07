function visibility = GetVisibility(cityLocation)
    % GetVisibility - creates matric eta_ij
    %
    % By: Nicholas Granlund
    % Date: Oct 2023

    % Initialize the matrix
    visibility = zeros(length(cityLocation));

    % Iterate through the cities
    for i = 1:length(cityLocation)

        % Get start city
        currentStartCityLocation = cityLocation(i,:);

        % Iterate thorugh the cities
        for j = 1:length(cityLocation)

            if i ~= j
                % Get stop city
                currentStopCityLocation = cityLocation(j,:);
    
                % Get distance
                dij = norm(currentStartCityLocation - currentStopCityLocation);
    
                % Gather value in matrix
                visibility(i,j) = dij^(-1);

            end
        end
    end

    % return

end

