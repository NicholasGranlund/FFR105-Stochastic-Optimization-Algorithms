%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Penalty method for minimizing
%
% (x1-1)^2 + 2(x2-2)^2, s.t.
%
% x1^2 + x2^2 - 1 <= 0.
%
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% The values below are suggestions - you may experiment with
% other values of eta and other (increasing) sequences of the
% µ parameter (muValues).
close all
clear all
clc

muValues = [0.1 1 10 100 1000];
eta = 0.0001;
xStart = [1; 2];
gradientTolerance = 1E-6;

for i = 1:length(muValues)
    mu = muValues(i);
    x(:,i) = RunGradientDescent(xStart,mu,eta,gradientTolerance);
    sprintf('x(1) = %3f, x(2) = %3f mu = %d',x(1,i),x(2,i),mu)
end


% Plot the results
figure()
semilogx(muValues, x, 'LineWidth', 2);
legend('x_1', 'x_2');
xlabel('value of \mu')
ylabel('value of x_1 and x_2');
title('Optimal solution found as function of \mu')
grid on

