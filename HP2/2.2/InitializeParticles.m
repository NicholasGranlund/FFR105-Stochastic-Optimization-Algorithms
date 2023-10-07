function [particlePositions, particleVelocities] = InitializeParticles(N, ...
                                                                       n, ...
                                                                       alpha, ...
                                                                       deltaT, ...
                                                                       xMin, ...
                                                                       xMax)
    % InitializeParticles - Initialize the particle position and velocity
    % for the PSO.
    %
    % By: Nicholas Granlund
    % Date: Oct 2023

    % 1.1 set initial particle position
    particlePositions = xMin + rand(N,n)*(xMax - xMin);

    % 1.2 set initial particle velocity
    particleVelocities = (alpha/deltaT) * (-(xMax-xMin)/2 + rand(N,n)*(xMax - xMin));

    % return
    
end

