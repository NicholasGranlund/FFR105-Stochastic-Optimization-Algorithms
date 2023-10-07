function [newParticlePositions, newParticleVelocities] = UpdateParticles(particlePositions, ...
                                                                       particleVelocities, ...
                                                                       bestParticlePositions, ...
                                                                       bestSwarmPosition, ...
                                                                       c1, ...
                                                                       c2, ...
                                                                       deltaT, ...
                                                                       inertiaWeight, ...
                                                                       vMax)
    % UpdateParticles - Update particle velocities and positions in PSO.
    % 
    % By: Nicholas Granlund
    % Date: Oct 2023

    % Random numbers for update equations
    q = rand(size(particlePositions));
    r = rand(size(particlePositions));

    % 4.1 Update velocities
    cognitiveComponent = c1 .* q .* (bestParticlePositions - particlePositions);
    socialComponent = c2 .* r .* (bestSwarmPosition - particlePositions);
    inertiaComponent = inertiaWeight .* particleVelocities;
    newParticleVelocities = inertiaComponent + cognitiveComponent + socialComponent;

    % 4.2 Restrict velocities
    newParticleVelocities(newParticleVelocities > vMax) = vMax;
    newParticleVelocities(newParticleVelocities < -vMax) = -vMax;

    % 4.3 Update positions
    newParticlePositions = particlePositions + newParticleVelocities * deltaT;

    % return

end
