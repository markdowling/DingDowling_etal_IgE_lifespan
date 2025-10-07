function out = logsslogn_survival(x,t)

y0 = x(1);
%[m,s] = lognparams(x(2),x(3));
m = x(2);
s = x(3);

out = log10(y0*0.5*(1-exp(-(m+s^2/2))*t.*(1-erf((log(t)-m)/(sqrt(2)*s)))-erf((log(t)-m-s^2)/(sqrt(2)*s))));