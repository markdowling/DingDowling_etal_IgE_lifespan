function out = logdoubleexp_survival(x,t)

y0 = x(1); %total size of the population
f = x(2); %fraction f in first subpopulation, (1-f) in second subpopulation
k1 = x(3); %decay rate of first subpopulation
k2 = x(4); %decay rate of second subpopulation

out = log10(y0*(f*exp(-k1*t)+(1-f)*exp(-k2*t)));