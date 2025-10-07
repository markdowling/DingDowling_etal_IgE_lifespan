function out = logsingleexp_survival(x,t)

y0 = x(1); %total size of the population
k = x(2); %decay rate of the population

out = log10(y0*exp(-k*t));