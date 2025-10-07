function [m,s] = lognparams(mu,sigma)

m = log(mu.^2./sqrt(sigma.^2+mu.^2));
s = sqrt(log((sigma./mu).^2+1));