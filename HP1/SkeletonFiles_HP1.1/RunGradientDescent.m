function x = RunGradientDescent(xStart, mu, eta, gradientTolerance)
    % Function edited by Nicholas Granlund
    % Date: 2023-09-08

    % Initialize variables
    x = xStart;
    euclideanNorm = norm(ComputeGradient(x, mu));

    while euclideanNorm >= gradientTolerance

        % Compute gradient
        gradF = ComputeGradient(x(:,end), mu);

        % Compute L2 norm
        euclideanNorm = norm(gradF);

        % Compute the next x
        x = [x, x(:,end) - eta*gradF];

    end


    % -------------------- PLOT --------------------
    % Create a plot to show the solution trajectory
    figure()
    fplot(@(t) sin(t), @(t) cos(t), '--k');
    grid on;
    hold on
    axis equal;
    plot(x(1,:), x(2,:), 'linewidth', 2)

    % Define the function
    [X, Y] = meshgrid(-2:0.1:4, -2:0.1:4);
    f = (X - 1).^2 + 2*(Y - 2).^2;
    %f = (X - 1).^2 + 2*(Y - 2).^2 + mu*(X^2 + Y^2 - 1)^2;
    
    % Create a contour plot
    contour(X, Y, f);
    
    % Add labels and title
    xlabel('x_1');
    ylabel('x_2');
    title(['Penalty Method with Gradient descent. \mu = ', num2str(mu)]);
    legend('Constraint x_1^2 + x_2^2 -1 < 0',...
        'Gradient Descent solution trajectory',...
        'Contour of f = (x_1 - 1)^2 + 2(x_2 - 2)^2')
    % ----------------------------------------------


    % Return only the final step as solution
    x = x(:,end);

end
