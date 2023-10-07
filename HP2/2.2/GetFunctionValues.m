function particleValues = GetFunctionValues(x)
    % GetFunctionValues - return the function values at the given particle
    % positions
    %
    % By: Nicholas Granlund
    % Date: Oct 2023

    % Compute the function values at particle positions
    particleValues = (x(:,1).^2 + x(:,2) - 11).^2 + (x(:,1) + x(:,2).^2 - 7).^2;

    % return

end

