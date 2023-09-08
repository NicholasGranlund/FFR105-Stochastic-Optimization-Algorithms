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

muValues = [0.1 1 10 100 1000 10000];
eta = 0.0001;
xStart = [1; 2];
gradientTolerance = 1E-8;

xValues = zeros(length(muValues), 2);
for i = 1:length(muValues)
 mu = muValues(i);
 x = RunGradientDescent(xStart,mu,eta,gradientTolerance);
 sprintf('x(1) = %3.4f, x(2) = %3.4f mu = %d',x(1),x(2),mu)
end