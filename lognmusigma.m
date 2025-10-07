function [mu,sigma] = lognmusigma(m,s)

mu = exp(m+s.^2/2);
sigma = sqrt(exp(2*(m+s.^2))-exp(2*m+s.^2));