function AIC = aic(noparams,nodatapoints,sse)

%%%from: http://en.wikipedia.org/wiki/Akaike_information_criterion

AIC = 2*(noparams+1) + nodatapoints*log(sse); %?+1 to noparams to account for the variance of the residuals as a parameter