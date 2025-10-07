tic
%create directory and file for saving results
starttime = clock;
starttimestr = strcat(sprintf('%04d',starttime(1)),sprintf('%02d',starttime(2)),sprintf('%02d',starttime(3)),sprintf('%02d',starttime(4)),sprintf('%02d',starttime(5)));
mkdir(starttimestr)

%initialise variables

t0=0;
tf=120;
nogridpoints=121;
tgrid = linspace(t0,tf,nogridpoints);
nostartingpoints = 100;
options = optimoptions('lsqcurvefit','Algorithm','levenberg-marquardt');
ms = MultiStart;
%ms = MultiStart('PlotFcns',@gsplotbestf);
nobootstrap = 1000;

%%IgE and IgG1 split to BM and secondary lymphoid tissues (20240617) 

%tdata = [2,7,21,42,60,77,114];
tdata = [0,5,19,40,58,75,112];
nodatapoints = length(tdata);

%%% IgE BM
ydata_hCD4_IgE_BM = {[40.9,90.3,103,202,16.2],
    [45.2,49.2,46.3,32.5,16.8],
    [39.8,76.6,3.93,104,5.5],
    [19.6,25.3,19.1,29.4,9.08],
    [171,5.71,7.92,3.54,4.96],
    [20.9,218,2.94,11,4.5,82.2,3.98],
    [18.9,47,10.7,2.74,24.4,2.9,32]}

%%% IgG1 BM
ydata_hCD4_IgG1_BM = {[29600,28900,37700,44500,6140],
    [16300,20400,5530,8120,6870],
    [4300,1900,523,5300,940],
    [3040,9240,2560,6330,945],
    [18400,654,285,2910,605]
    [779,2440,458,422,40.5,519,19.9],
    [1400,5930,4200,3360,5280,327,2800]}

%%% IgE SL
ydata_hCD4_IgE_SL = {[567,655,769,2730,488],
    [203,868,819,1590,265],
    [138,71.3,76.4,1610,18.2],
    [23.1,267,32.3,88.7,11.3],
    [2210,170,9.85,81.8,10.2],
    [500,102,9.09,40.4,28.8,169,36.8],
    [13.3,45.2,3.26,12.5,101,8.97,122]}

%%% IgG1 SL
ydata_hCD4_IgG1_SL = {[42200,43400,46700,86700,27800],
    [10200,13400,5380,11100,10100],
    [1320,949,702,3640,323],
    [493,1280,163,592,104],
    [3320,883,288,1160,270],
    [293,682,166,631,24.5,232,113],
    [109,545,375,304,199,71.5,338]}


%Process data into a suitable form for fitting
ydata_mean_hCD4_IgE_BM = zeros(1,nodatapoints);
ydata_sem_hCD4_IgE_BM = zeros(1,nodatapoints);
logydata_hCD4_IgE_BM = cell(nodatapoints,1);
logydata_mean_hCD4_IgE_BM = zeros(1,nodatapoints);
logydata_sem_hCD4_IgE_BM = zeros(1,nodatapoints);

ydata_mean_hCD4_IgG1_BM = zeros(1,nodatapoints);
ydata_sem_hCD4_IgG1_BM = zeros(1,nodatapoints);
logydata_hCD4_IgG1_BM = cell(nodatapoints,1);
logydata_mean_hCD4_IgG1_BM = zeros(1,nodatapoints);
logydata_sem_hCD4_IgG1_BM = zeros(1,nodatapoints);

ydata_mean_hCD4_IgE_SL = zeros(1,nodatapoints);
ydata_sem_hCD4_IgE_SL = zeros(1,nodatapoints);
logydata_hCD4_IgE_SL = cell(nodatapoints,1);
logydata_mean_hCD4_IgE_SL = zeros(1,nodatapoints);
logydata_sem_hCD4_IgE_SL = zeros(1,nodatapoints);

ydata_mean_hCD4_IgG1_SL = zeros(1,nodatapoints);
ydata_sem_hCD4_IgG1_SL = zeros(1,nodatapoints);
logydata_hCD4_IgG1_SL = cell(nodatapoints,1);
logydata_mean_hCD4_IgG1_SL = zeros(1,nodatapoints);
logydata_sem_hCD4_IgG1_SL = zeros(1,nodatapoints);

for ii = 1:nodatapoints
    ydata_mean_hCD4_IgE_BM(ii) = sum(ydata_hCD4_IgE_BM{ii})/length(ydata_hCD4_IgE_BM{ii});
    ydata_sem_hCD4_IgE_BM(ii) = sqrt(sum((ydata_hCD4_IgE_BM{ii}-ydata_mean_hCD4_IgE_BM(ii)).^2)/(length(ydata_hCD4_IgE_BM{ii})-1))/sqrt(length(ydata_hCD4_IgE_BM{ii}));   
    logydata_hCD4_IgE_BM{ii} = log10(ydata_hCD4_IgE_BM{ii});
    logydata_mean_hCD4_IgE_BM(ii) = sum(logydata_hCD4_IgE_BM{ii})/length(logydata_hCD4_IgE_BM{ii});
    logydata_sem_hCD4_IgE_BM(ii) = sqrt(sum((logydata_hCD4_IgE_BM{ii}-logydata_mean_hCD4_IgE_BM(ii)).^2)/(length(logydata_hCD4_IgE_BM{ii})-1))/sqrt(length(logydata_hCD4_IgE_BM{ii}));

    ydata_mean_hCD4_IgG1_BM(ii) = sum(ydata_hCD4_IgG1_BM{ii})/length(ydata_hCD4_IgG1_BM{ii});
    ydata_sem_hCD4_IgG1_BM(ii) = sqrt(sum((ydata_hCD4_IgG1_BM{ii}-ydata_mean_hCD4_IgG1_BM(ii)).^2)/(length(ydata_hCD4_IgG1_BM{ii})-1))/sqrt(length(ydata_hCD4_IgG1_BM{ii}));   
    logydata_hCD4_IgG1_BM{ii} = log10(ydata_hCD4_IgG1_BM{ii});
    logydata_mean_hCD4_IgG1_BM(ii) = sum(logydata_hCD4_IgG1_BM{ii})/length(logydata_hCD4_IgG1_BM{ii});
    logydata_sem_hCD4_IgG1_BM(ii) = sqrt(sum((logydata_hCD4_IgG1_BM{ii}-logydata_mean_hCD4_IgG1_BM(ii)).^2)/(length(logydata_hCD4_IgG1_BM{ii})-1))/sqrt(length(logydata_hCD4_IgG1_BM{ii}));

    ydata_mean_hCD4_IgE_SL(ii) = sum(ydata_hCD4_IgE_SL{ii})/length(ydata_hCD4_IgE_SL{ii});
    ydata_sem_hCD4_IgE_SL(ii) = sqrt(sum((ydata_hCD4_IgE_SL{ii}-ydata_mean_hCD4_IgE_SL(ii)).^2)/(length(ydata_hCD4_IgE_SL{ii})-1))/sqrt(length(ydata_hCD4_IgE_SL{ii}));   
    logydata_hCD4_IgE_SL{ii} = log10(ydata_hCD4_IgE_SL{ii});
    logydata_mean_hCD4_IgE_SL(ii) = sum(logydata_hCD4_IgE_SL{ii})/length(logydata_hCD4_IgE_SL{ii});
    logydata_sem_hCD4_IgE_SL(ii) = sqrt(sum((logydata_hCD4_IgE_SL{ii}-logydata_mean_hCD4_IgE_SL(ii)).^2)/(length(logydata_hCD4_IgE_SL{ii})-1))/sqrt(length(logydata_hCD4_IgE_SL{ii}));

    ydata_mean_hCD4_IgG1_SL(ii) = sum(ydata_hCD4_IgG1_SL{ii})/length(ydata_hCD4_IgG1_SL{ii});
    ydata_sem_hCD4_IgG1_SL(ii) = sqrt(sum((ydata_hCD4_IgG1_SL{ii}-ydata_mean_hCD4_IgG1_SL(ii)).^2)/(length(ydata_hCD4_IgG1_SL{ii})-1))/sqrt(length(ydata_hCD4_IgG1_SL{ii}));   
    logydata_hCD4_IgG1_SL{ii} = log10(ydata_hCD4_IgG1_SL{ii});
    logydata_mean_hCD4_IgG1_SL(ii) = sum(logydata_hCD4_IgG1_SL{ii})/length(logydata_hCD4_IgG1_SL{ii});
    logydata_sem_hCD4_IgG1_SL(ii) = sqrt(sum((logydata_hCD4_IgG1_SL{ii}-logydata_mean_hCD4_IgG1_SL(ii)).^2)/(length(logydata_hCD4_IgG1_SL{ii})-1))/sqrt(length(logydata_hCD4_IgG1_SL{ii}));
end

    logydata_mean_hCD4_IgE_BM_bootstrap = zeros(nobootstrap,nodatapoints);
    %logydata_mean_hCD4_IgE_BM_bootstrap(1,:) = log10(ydata_mean_hCD4_IgE_BM);
    logydata_mean_hCD4_IgE_BM_bootstrap(1,:) = logydata_mean_hCD4_IgE_BM;
    x_opt_logsexp_IgE_BM_bootstrap = zeros(nobootstrap,2);
    error_x_opt_logsexp_IgE_BM_bootstrap = zeros(nobootstrap,1);
    x_opt_logsexpoffset_IgE_BM_bootstrap = zeros(nobootstrap,3);
    error_x_opt_logsexpoffset_IgE_BM_bootstrap = zeros(nobootstrap,1);
    x_opt_logdexp_IgE_BM_bootstrap = zeros(nobootstrap,4);
    error_x_opt_logdexp_IgE_BM_bootstrap = zeros(nobootstrap,1);
    x_opt_logsslogn_IgE_BM_bootstrap = zeros(nobootstrap,3);
    error_x_opt_logsslogn_IgE_BM_bootstrap = zeros(nobootstrap,1);

    logydata_mean_hCD4_IgG1_BM_bootstrap = zeros(nobootstrap,nodatapoints);
    %logydata_mean_hCD4_IgG1_BM_bootstrap(1,:) = log10(ydata_mean_hCD4_IgG1_BM);
    logydata_mean_hCD4_IgG1_BM_bootstrap(1,:) = logydata_mean_hCD4_IgG1_BM;
    x_opt_logsexp_IgG1_BM_bootstrap = zeros(nobootstrap,2);
    error_x_opt_logsexp_IgG1_BM_bootstrap = zeros(nobootstrap,1);
    x_opt_logsexpoffset_IgG1_BM_bootstrap = zeros(nobootstrap,3);
    error_x_opt_logsexpoffset_IgG1_BM_bootstrap = zeros(nobootstrap,1);
    x_opt_logdexp_IgG1_BM_bootstrap = zeros(nobootstrap,4);
    error_x_opt_logdexp_IgG1_BM_bootstrap = zeros(nobootstrap,1);
    x_opt_logsslogn_IgG1_BM_bootstrap = zeros(nobootstrap,3);
    error_x_opt_logsslogn_IgG1_BM_bootstrap = zeros(nobootstrap,1);

    logydata_mean_hCD4_IgE_SL_bootstrap = zeros(nobootstrap,nodatapoints);
    %logydata_mean_hCD4_IgE_SL_bootstrap(1,:) = log10(ydata_mean_hCD4_IgE_SL);
    logydata_mean_hCD4_IgE_SL_bootstrap(1,:) = logydata_mean_hCD4_IgE_SL;
    x_opt_logsexp_IgE_SL_bootstrap = zeros(nobootstrap,2);
    error_x_opt_logsexp_IgE_SL_bootstrap = zeros(nobootstrap,1);
    x_opt_logsexpoffset_IgE_SL_bootstrap = zeros(nobootstrap,3);
    error_x_opt_logsexpoffset_IgE_SL_bootstrap = zeros(nobootstrap,1);
    x_opt_logdexp_IgE_SL_bootstrap = zeros(nobootstrap,4);
    error_x_opt_logdexp_IgE_SL_bootstrap = zeros(nobootstrap,1);
    x_opt_logsslogn_IgE_SL_bootstrap = zeros(nobootstrap,3);
    error_x_opt_logsslogn_IgE_SL_bootstrap = zeros(nobootstrap,1);

    logydata_mean_hCD4_IgG1_SL_bootstrap = zeros(nobootstrap,nodatapoints);
    %logydata_mean_hCD4_IgG1_SL_bootstrap(1,:) = log10(ydata_mean_hCD4_IgG1_SL);
    logydata_mean_hCD4_IgG1_SL_bootstrap(1,:) = logydata_mean_hCD4_IgG1_SL;
    x_opt_logsexp_IgG1_SL_bootstrap = zeros(nobootstrap,2);
    error_x_opt_logsexp_IgG1_SL_bootstrap = zeros(nobootstrap,1);
    x_opt_logsexpoffset_IgG1_SL_bootstrap = zeros(nobootstrap,3);
    error_x_opt_logsexpoffset_IgG1_SL_bootstrap = zeros(nobootstrap,1);
    x_opt_logdexp_IgG1_SL_bootstrap = zeros(nobootstrap,4);
    error_x_opt_logdexp_IgG1_SL_bootstrap = zeros(nobootstrap,1);
    x_opt_logsslogn_IgG1_SL_bootstrap = zeros(nobootstrap,3);
    error_x_opt_logsslogn_IgG1_SL_bootstrap = zeros(nobootstrap,1);

    x_opt_logsexp_IgEG1_BM_bootstrap = zeros(nobootstrap,3);
    error_x_opt_logsexp_IgEG1_BM_bootstrap = zeros(nobootstrap,1);
    x_opt_logsexpoffset_IgEG1_BM_bootstrap = zeros(nobootstrap,5);
    error_x_opt_logsexpoffset_IgEG1_BM_bootstrap = zeros(nobootstrap,1);
    x_opt_logdexp_IgEG1_BM_bootstrap = zeros(nobootstrap,6);
    error_x_opt_logdexp_IgEG1_BM_bootstrap = zeros(nobootstrap,1);
    x_opt_logsslogn_IgEG1_BM_bootstrap = zeros(nobootstrap,4);
    error_x_opt_logsslogn_IgEG1_BM_bootstrap = zeros(nobootstrap,1);

    x_opt_logsexp_IgEG1_SL_bootstrap = zeros(nobootstrap,3);
    error_x_opt_logsexp_IgEG1_SL_bootstrap = zeros(nobootstrap,1);
    x_opt_logsexpoffset_IgEG1_SL_bootstrap = zeros(nobootstrap,5);
    error_x_opt_logsexpoffset_IgEG1_SL_bootstrap = zeros(nobootstrap,1);
    x_opt_logdexp_IgEG1_SL_bootstrap = zeros(nobootstrap,6);
    error_x_opt_logdexp_IgEG1_SL_bootstrap = zeros(nobootstrap,1);
    x_opt_logsslogn_IgEG1_SL_bootstrap = zeros(nobootstrap,4);
    error_x_opt_logsslogn_IgEG1_SL_bootstrap = zeros(nobootstrap,1);

    x_opt_logsexp_IgE_BMSL_bootstrap = zeros(nobootstrap,3);
    error_x_opt_logsexp_IgE_BMSL_bootstrap = zeros(nobootstrap,1);
    x_opt_logsexpoffset_IgE_BMSL_bootstrap = zeros(nobootstrap,5);
    error_x_opt_logsexpoffset_IgE_BMSL_bootstrap = zeros(nobootstrap,1);
    x_opt_logdexp_IgE_BMSL_bootstrap = zeros(nobootstrap,6);
    error_x_opt_logdexp_IgE_BMSL_bootstrap = zeros(nobootstrap,1);
    x_opt_logsslogn_IgE_BMSL_bootstrap = zeros(nobootstrap,4);
    error_x_opt_logsslogn_IgE_BMSL_bootstrap = zeros(nobootstrap,1);  

    x_opt_logsexp_IgG1_BMSL_bootstrap = zeros(nobootstrap,3);
    error_x_opt_logsexp_IgG1_BMSL_bootstrap = zeros(nobootstrap,1);
    x_opt_logsexpoffset_IgG1_BMSL_bootstrap = zeros(nobootstrap,5);
    error_x_opt_logsexpoffset_IgG1_BMSL_bootstrap = zeros(nobootstrap,1);
    x_opt_logdexp_IgG1_BMSL_bootstrap = zeros(nobootstrap,6);
    error_x_opt_logdexp_IgG1_BMSL_bootstrap = zeros(nobootstrap,1);
    x_opt_logsslogn_IgG1_BMSL_bootstrap = zeros(nobootstrap,4);
    error_x_opt_logsslogn_IgG1_BMSL_bootstrap = zeros(nobootstrap,1); 

    x_opt_logsexp_IgEG1_BMSL_bootstrap = zeros(nobootstrap,5);
    error_x_opt_logsexp_IgEG1_BMSL_bootstrap = zeros(nobootstrap,1);
    x_opt_logsexpoffset_IgEG1_BMSL_bootstrap = zeros(nobootstrap,9);
    error_x_opt_logsexpoffset_IgEG1_BMSL_bootstrap = zeros(nobootstrap,1);
    x_opt_logdexp_IgEG1_BMSL_bootstrap = zeros(nobootstrap,10);
    error_x_opt_logdexp_IgEG1_BMSL_bootstrap = zeros(nobootstrap,1);
    x_opt_logsslogn_IgEG1_BMSL_bootstrap = zeros(nobootstrap,6);
    error_x_opt_logsslogn_IgEG1_BMSL_bootstrap = zeros(nobootstrap,1);  

    %Initialise parameters
    y0_0_IgE_BM = 100;
    y0_0_IgG1_BM = 30000;
    y0_0_IgE_SL = 1000;
    y0_0_IgG1_SL = 50000;
    f_0 = 0.5; %fraction of population in the first subpopulation
    thalf1_LLPC_0 = 87; %half-life of LLPCs first subpopulation
    k1_0 = log(2)/thalf1_LLPC_0; %decay rate of LLPCs first subpopulation
    thalf2_LLPC_0 = 20; %half-life of LLPCs second subpopulation
    k2_0 = log(2)/thalf2_LLPC_0; %decay rate of LLPCs second subpopulation
    %mu_0 = 87; %mean lifespan of LLPCs in linear space
    %sigma_0 = 20; %std dev lifespan of LLPCs in linear space
    m_0 = 1; %mean lifespan of LLPCs in linear space
    s_0 = 1; %std dev lifespan of LLPCs in linear space

for ii=1:nobootstrap
    ii

    if ii~=1
        r = randn(1,nodatapoints);
        logydata_mean_hCD4_IgE_BM_bootstrap(ii,:) = logydata_mean_hCD4_IgE_BM+r.*logydata_sem_hCD4_IgE_BM;

        r = randn(1,nodatapoints);
        logydata_mean_hCD4_IgG1_BM_bootstrap(ii,:) = logydata_mean_hCD4_IgG1_BM+r.*logydata_sem_hCD4_IgG1_BM;

        r = randn(1,nodatapoints);
        logydata_mean_hCD4_IgE_SL_bootstrap(ii,:) = logydata_mean_hCD4_IgE_SL+r.*logydata_sem_hCD4_IgE_SL;

        r = randn(1,nodatapoints);
        logydata_mean_hCD4_IgG1_SL_bootstrap(ii,:) = logydata_mean_hCD4_IgG1_SL+r.*logydata_sem_hCD4_IgG1_SL;
    end
    
    %%%SINGLE EXPONENTIAL FIT

     %%Individual fits to each IgE/G1 and BM/SL data set
     problem_logsexp_IgE_BM = createOptimProblem('lsqcurvefit','x0',[y0_0_IgE_BM,k1_0],'objective',@logsingleexp_survival,'lb',[y0_0_IgE_BM/100,0],'ub',[y0_0_IgE_BM*100,1],'xdata',tdata,'ydata',logydata_mean_hCD4_IgE_BM_bootstrap(ii,:));   
     [x_opt_logsexp_IgE_BM_ii,error_x_opt_logsexp_IgE_BM_ii] = run(ms,problem_logsexp_IgE_BM,nostartingpoints);
     x_opt_logsexp_IgE_BM_bootstrap(ii,:) = x_opt_logsexp_IgE_BM_ii; 
     error_x_opt_logsexp_IgE_BM_bootstrap(ii) = error_x_opt_logsexp_IgE_BM_ii; 

     problem_logsexp_IgG1_BM = createOptimProblem('lsqcurvefit','x0',[y0_0_IgG1_BM,k1_0],'objective',@logsingleexp_survival,'lb',[y0_0_IgG1_BM/100,0],'ub',[y0_0_IgG1_BM*100,1],'xdata',tdata,'ydata',logydata_mean_hCD4_IgG1_BM_bootstrap(ii,:));   
     [x_opt_logsexp_IgG1_BM_ii,error_x_opt_logsexp_IgG1_BM_ii] = run(ms,problem_logsexp_IgG1_BM,nostartingpoints);
     x_opt_logsexp_IgG1_BM_bootstrap(ii,:) = x_opt_logsexp_IgG1_BM_ii; 
     error_x_opt_logsexp_IgG1_BM_bootstrap(ii) = error_x_opt_logsexp_IgG1_BM_ii;

     problem_logsexp_IgE_SL = createOptimProblem('lsqcurvefit','x0',[y0_0_IgE_SL,k1_0],'objective',@logsingleexp_survival,'lb',[y0_0_IgE_SL/100,0],'ub',[y0_0_IgE_SL*100,1],'xdata',tdata,'ydata',logydata_mean_hCD4_IgE_SL_bootstrap(ii,:));   
     [x_opt_logsexp_IgE_SL_ii,error_x_opt_logsexp_IgE_SL_ii] = run(ms,problem_logsexp_IgE_SL,nostartingpoints);
     x_opt_logsexp_IgE_SL_bootstrap(ii,:) = x_opt_logsexp_IgE_SL_ii; 
     error_x_opt_logsexp_IgE_SL_bootstrap(ii) = error_x_opt_logsexp_IgE_SL_ii; 

     problem_logsexp_IgG1_SL = createOptimProblem('lsqcurvefit','x0',[y0_0_IgG1_SL,k1_0],'objective',@logsingleexp_survival,'lb',[y0_0_IgG1_SL/100,0],'ub',[y0_0_IgG1_SL*100,1],'xdata',tdata,'ydata',logydata_mean_hCD4_IgG1_SL_bootstrap(ii,:));   
     [x_opt_logsexp_IgG1_SL_ii,error_x_opt_logsexp_IgG1_SL_ii] = run(ms,problem_logsexp_IgG1_SL,nostartingpoints);
     x_opt_logsexp_IgG1_SL_bootstrap(ii,:) = x_opt_logsexp_IgG1_SL_ii; 
     error_x_opt_logsexp_IgG1_SL_bootstrap(ii) = error_x_opt_logsexp_IgG1_SL_ii;

     %%Fits to IgE combined BM/SL and IgG1 combined BM/SL
     problem_logsexp_IgE_BMSL = createOptimProblem('lsqcurvefit','x0',[y0_0_IgE_BM,y0_0_IgE_SL,k1_0],'objective',@logsingleexp_survival_twodatasets,'lb',[y0_0_IgE_BM/100,y0_0_IgE_SL/100,0],'ub',[y0_0_IgE_BM*100,y0_0_IgE_SL*100,1],'xdata',tdata,'ydata',[logydata_mean_hCD4_IgE_BM_bootstrap(ii,:),logydata_mean_hCD4_IgE_SL_bootstrap(ii,:)]);   
     [x_opt_logsexp_IgE_BMSL_ii,error_x_opt_logsexp_IgE_BMSL_ii] = run(ms,problem_logsexp_IgE_BMSL,nostartingpoints);
     x_opt_logsexp_IgE_BMSL_bootstrap(ii,:) = x_opt_logsexp_IgE_BMSL_ii; 
     error_x_opt_logsexp_IgE_BMSL_bootstrap(ii) = error_x_opt_logsexp_IgE_BMSL_ii; 

     problem_logsexp_IgG1_BMSL = createOptimProblem('lsqcurvefit','x0',[y0_0_IgG1_BM,y0_0_IgG1_SL,k1_0],'objective',@logsingleexp_survival_twodatasets,'lb',[y0_0_IgG1_BM/100,y0_0_IgG1_SL/100,0],'ub',[y0_0_IgG1_BM*100,y0_0_IgG1_SL*100,1],'xdata',tdata,'ydata',[logydata_mean_hCD4_IgG1_BM_bootstrap(ii,:),logydata_mean_hCD4_IgG1_SL_bootstrap(ii,:)]);   
     [x_opt_logsexp_IgG1_BMSL_ii,error_x_opt_logsexp_IgG1_BMSL_ii] = run(ms,problem_logsexp_IgG1_BMSL,nostartingpoints);
     x_opt_logsexp_IgG1_BMSL_bootstrap(ii,:) = x_opt_logsexp_IgG1_BMSL_ii; 
     error_x_opt_logsexp_IgG1_BMSL_bootstrap(ii) = error_x_opt_logsexp_IgG1_BMSL_ii;

     %%Fits to BM combined IgE/G1 and SL combined IgE/G1
     problem_logsexp_IgEG1_BM = createOptimProblem('lsqcurvefit','x0',[y0_0_IgE_BM,y0_0_IgG1_BM,k1_0],'objective',@logsingleexp_survival_twodatasets,'lb',[y0_0_IgE_BM/100,y0_0_IgG1_BM/100,0],'ub',[y0_0_IgE_BM*100,y0_0_IgG1_BM*100,1],'xdata',tdata,'ydata',[logydata_mean_hCD4_IgE_BM_bootstrap(ii,:),logydata_mean_hCD4_IgG1_BM_bootstrap(ii,:)]);   
     [x_opt_logsexp_IgEG1_BM_ii,error_x_opt_logsexp_IgEG1_BM_ii] = run(ms,problem_logsexp_IgEG1_BM,nostartingpoints);
     x_opt_logsexp_IgEG1_BM_bootstrap(ii,:) = x_opt_logsexp_IgEG1_BM_ii; 
     error_x_opt_logsexp_IgEG1_BM_bootstrap(ii) = error_x_opt_logsexp_IgEG1_BM_ii; 

     problem_logsexp_IgEG1_SL = createOptimProblem('lsqcurvefit','x0',[y0_0_IgE_SL,y0_0_IgG1_SL,k1_0],'objective',@logsingleexp_survival_twodatasets,'lb',[y0_0_IgE_SL/100,y0_0_IgG1_SL/100,0],'ub',[y0_0_IgE_SL*100,y0_0_IgG1_SL*100,1],'xdata',tdata,'ydata',[logydata_mean_hCD4_IgE_SL_bootstrap(ii,:),logydata_mean_hCD4_IgG1_SL_bootstrap(ii,:)]);   
     [x_opt_logsexp_IgEG1_SL_ii,error_x_opt_logsexp_IgEG1_SL_ii] = run(ms,problem_logsexp_IgEG1_SL,nostartingpoints);
     x_opt_logsexp_IgEG1_SL_bootstrap(ii,:) = x_opt_logsexp_IgEG1_SL_ii; 
     error_x_opt_logsexp_IgEG1_SL_bootstrap(ii) = error_x_opt_logsexp_IgEG1_SL_ii; 

     %%Fits to all four data sets simultaneously (only initial number varies) BM/SL and IgE/G1
     problem_logsexp_IgEG1_BMSL = createOptimProblem('lsqcurvefit','x0',[y0_0_IgE_BM,y0_0_IgG1_BM,y0_0_IgE_SL,y0_0_IgG1_SL,k1_0],'objective',@logsingleexp_survival_fourdatasets,'lb',[y0_0_IgE_BM/100,y0_0_IgG1_BM/100,y0_0_IgE_SL/100,y0_0_IgG1_SL/100,0],'ub',[y0_0_IgE_BM*100,y0_0_IgG1_BM*100,y0_0_IgE_SL*100,y0_0_IgG1_SL*100,1],'xdata',tdata,'ydata',[logydata_mean_hCD4_IgE_BM_bootstrap(ii,:),logydata_mean_hCD4_IgG1_BM_bootstrap(ii,:),logydata_mean_hCD4_IgE_SL_bootstrap(ii,:),logydata_mean_hCD4_IgG1_SL_bootstrap(ii,:)]);   
     [x_opt_logsexp_IgEG1_BMSL_ii,error_x_opt_logsexp_IgEG1_BMSL_ii] = run(ms,problem_logsexp_IgEG1_BMSL,nostartingpoints);
     x_opt_logsexp_IgEG1_BMSL_bootstrap(ii,:) = x_opt_logsexp_IgEG1_BMSL_ii; 
     error_x_opt_logsexp_IgEG1_BMSL_bootstrap(ii) = error_x_opt_logsexp_IgEG1_BMSL_ii; 


    %%%SINGLE EXPONENTIAL OFFSET FIT

     %%Individual fits to each IgE/G1 and BM/SL data set
     problem_logsexpoffset_IgE_BM = createOptimProblem('lsqcurvefit','x0',[y0_0_IgE_BM,f_0,k1_0],'objective',@logsingleexpoffset_survival,'lb',[y0_0_IgE_BM/100,0,0],'ub',[y0_0_IgE_BM*100,1,1],'xdata',tdata,'ydata',logydata_mean_hCD4_IgE_BM_bootstrap(ii,:));   
     [x_opt_logsexpoffset_IgE_BM_ii,error_x_opt_logsexpoffset_IgE_BM_ii] = run(ms,problem_logsexpoffset_IgE_BM,nostartingpoints);
     x_opt_logsexpoffset_IgE_BM_bootstrap(ii,:) = x_opt_logsexpoffset_IgE_BM_ii; 
     error_x_opt_logsexpoffset_IgE_BM_bootstrap(ii) = error_x_opt_logsexpoffset_IgE_BM_ii; 

     problem_logsexpoffset_IgG1_BM = createOptimProblem('lsqcurvefit','x0',[y0_0_IgG1_BM,f_0,k1_0],'objective',@logsingleexpoffset_survival,'lb',[y0_0_IgG1_BM/100,0,0],'ub',[y0_0_IgG1_BM*100,1,1],'xdata',tdata,'ydata',logydata_mean_hCD4_IgG1_BM_bootstrap(ii,:));   
     [x_opt_logsexpoffset_IgG1_BM_ii,error_x_opt_logsexpoffset_IgG1_BM_ii] = run(ms,problem_logsexpoffset_IgG1_BM,nostartingpoints);
     x_opt_logsexpoffset_IgG1_BM_bootstrap(ii,:) = x_opt_logsexpoffset_IgG1_BM_ii; 
     error_x_opt_logsexpoffset_IgG1_BM_bootstrap(ii) = error_x_opt_logsexpoffset_IgG1_BM_ii;

     problem_logsexpoffset_IgE_SL = createOptimProblem('lsqcurvefit','x0',[y0_0_IgE_SL,f_0,k1_0],'objective',@logsingleexpoffset_survival,'lb',[y0_0_IgE_SL/100,0,0],'ub',[y0_0_IgE_SL*100,1,1],'xdata',tdata,'ydata',logydata_mean_hCD4_IgE_SL_bootstrap(ii,:));   
     [x_opt_logsexpoffset_IgE_SL_ii,error_x_opt_logsexpoffset_IgE_SL_ii] = run(ms,problem_logsexpoffset_IgE_SL,nostartingpoints);
     x_opt_logsexpoffset_IgE_SL_bootstrap(ii,:) = x_opt_logsexpoffset_IgE_SL_ii; 
     error_x_opt_logsexpoffset_IgE_SL_bootstrap(ii) = error_x_opt_logsexpoffset_IgE_SL_ii; 

     problem_logsexpoffset_IgG1_SL = createOptimProblem('lsqcurvefit','x0',[y0_0_IgG1_SL,f_0,k1_0],'objective',@logsingleexpoffset_survival,'lb',[y0_0_IgG1_SL/100,0,0],'ub',[y0_0_IgG1_SL*100,1,1],'xdata',tdata,'ydata',logydata_mean_hCD4_IgG1_SL_bootstrap(ii,:));   
     [x_opt_logsexpoffset_IgG1_SL_ii,error_x_opt_logsexpoffset_IgG1_SL_ii] = run(ms,problem_logsexpoffset_IgG1_SL,nostartingpoints);
     x_opt_logsexpoffset_IgG1_SL_bootstrap(ii,:) = x_opt_logsexpoffset_IgG1_SL_ii; 
     error_x_opt_logsexpoffset_IgG1_SL_bootstrap(ii) = error_x_opt_logsexpoffset_IgG1_SL_ii;

     %%Fits to IgE combined BM/SL and IgG1 combined BM/SL
     problem_logsexpoffset_IgE_BMSL = createOptimProblem('lsqcurvefit','x0',[y0_0_IgE_BM,y0_0_IgE_SL,f_0,f_0,k1_0],'objective',@logsingleexpoffset_survival_twodatasets,'lb',[y0_0_IgE_BM/100,y0_0_IgE_SL/100,0,0,0],'ub',[y0_0_IgE_BM*100,y0_0_IgE_SL*100,1,1,1],'xdata',tdata,'ydata',[logydata_mean_hCD4_IgE_BM_bootstrap(ii,:),logydata_mean_hCD4_IgE_SL_bootstrap(ii,:)]);   
     [x_opt_logsexpoffset_IgE_BMSL_ii,error_x_opt_logsexpoffset_IgE_BMSL_ii] = run(ms,problem_logsexpoffset_IgE_BMSL,nostartingpoints);
     x_opt_logsexpoffset_IgE_BMSL_bootstrap(ii,:) = x_opt_logsexpoffset_IgE_BMSL_ii; 
     error_x_opt_logsexpoffset_IgE_BMSL_bootstrap(ii) = error_x_opt_logsexpoffset_IgE_BMSL_ii; 

     problem_logsexpoffset_IgG1_BMSL = createOptimProblem('lsqcurvefit','x0',[y0_0_IgG1_BM,y0_0_IgG1_SL,f_0,f_0,k1_0],'objective',@logsingleexpoffset_survival_twodatasets,'lb',[y0_0_IgG1_BM/100,y0_0_IgG1_SL/100,0,0,0],'ub',[y0_0_IgG1_BM*100,y0_0_IgG1_SL*100,1,1,1],'xdata',tdata,'ydata',[logydata_mean_hCD4_IgG1_BM_bootstrap(ii,:),logydata_mean_hCD4_IgG1_SL_bootstrap(ii,:)]);   
     [x_opt_logsexpoffset_IgG1_BMSL_ii,error_x_opt_logsexpoffset_IgG1_BMSL_ii] = run(ms,problem_logsexpoffset_IgG1_BMSL,nostartingpoints);
     x_opt_logsexpoffset_IgG1_BMSL_bootstrap(ii,:) = x_opt_logsexpoffset_IgG1_BMSL_ii; 
     error_x_opt_logsexpoffset_IgG1_BMSL_bootstrap(ii) = error_x_opt_logsexpoffset_IgG1_BMSL_ii;

     %%Fits to BM combined IgE/G1 and SL combined IgE/G1
     problem_logsexpoffset_IgEG1_BM = createOptimProblem('lsqcurvefit','x0',[y0_0_IgE_BM,y0_0_IgG1_BM,f_0,f_0,k1_0],'objective',@logsingleexpoffset_survival_twodatasets,'lb',[y0_0_IgE_BM/100,y0_0_IgG1_BM/100,0,0,0],'ub',[y0_0_IgE_BM*100,y0_0_IgG1_BM*100,1,1,1],'xdata',tdata,'ydata',[logydata_mean_hCD4_IgE_BM_bootstrap(ii,:),logydata_mean_hCD4_IgG1_BM_bootstrap(ii,:)]);   
     [x_opt_logsexpoffset_IgEG1_BM_ii,error_x_opt_logsexpoffset_IgEG1_BM_ii] = run(ms,problem_logsexpoffset_IgEG1_BM,nostartingpoints);
     x_opt_logsexpoffset_IgEG1_BM_bootstrap(ii,:) = x_opt_logsexpoffset_IgEG1_BM_ii; 
     error_x_opt_logsexpoffset_IgEG1_BM_bootstrap(ii) = error_x_opt_logsexpoffset_IgEG1_BM_ii; 

     problem_logsexpoffset_IgEG1_SL = createOptimProblem('lsqcurvefit','x0',[y0_0_IgE_SL,y0_0_IgG1_SL,f_0,f_0,k1_0],'objective',@logsingleexpoffset_survival_twodatasets,'lb',[y0_0_IgE_SL/100,y0_0_IgG1_SL/100,0,0,0],'ub',[y0_0_IgE_SL*100,y0_0_IgG1_SL*100,1,1,1],'xdata',tdata,'ydata',[logydata_mean_hCD4_IgE_SL_bootstrap(ii,:),logydata_mean_hCD4_IgG1_SL_bootstrap(ii,:)]);   
     [x_opt_logsexpoffset_IgEG1_SL_ii,error_x_opt_logsexpoffset_IgEG1_SL_ii] = run(ms,problem_logsexpoffset_IgEG1_SL,nostartingpoints);
     x_opt_logsexpoffset_IgEG1_SL_bootstrap(ii,:) = x_opt_logsexpoffset_IgEG1_SL_ii; 
     error_x_opt_logsexpoffset_IgEG1_SL_bootstrap(ii) = error_x_opt_logsexpoffset_IgEG1_SL_ii; 

     %%Fits to all four data sets simultaneously (only initial number varies) BM/SL and IgE/G1
     problem_logsexpoffset_IgEG1_BMSL = createOptimProblem('lsqcurvefit','x0',[y0_0_IgE_BM,y0_0_IgG1_BM,y0_0_IgE_SL,y0_0_IgG1_SL,f_0,f_0,f_0,f_0,k1_0],'objective',@logsingleexpoffset_survival_fourdatasets,'lb',[y0_0_IgE_BM/100,y0_0_IgG1_BM/100,y0_0_IgE_SL/100,y0_0_IgG1_SL/100,0,0,0,0,0],'ub',[y0_0_IgE_BM*100,y0_0_IgG1_BM*100,y0_0_IgE_SL*100,y0_0_IgG1_SL*100,1,1,1,1,1],'xdata',tdata,'ydata',[logydata_mean_hCD4_IgE_BM_bootstrap(ii,:),logydata_mean_hCD4_IgG1_BM_bootstrap(ii,:),logydata_mean_hCD4_IgE_SL_bootstrap(ii,:),logydata_mean_hCD4_IgG1_SL_bootstrap(ii,:)]);   
     [x_opt_logsexpoffset_IgEG1_BMSL_ii,error_x_opt_logsexpoffset_IgEG1_BMSL_ii] = run(ms,problem_logsexpoffset_IgEG1_BMSL,nostartingpoints);
     x_opt_logsexpoffset_IgEG1_BMSL_bootstrap(ii,:) = x_opt_logsexpoffset_IgEG1_BMSL_ii; 
     error_x_opt_logsexpoffset_IgEG1_BMSL_bootstrap(ii) = error_x_opt_logsexpoffset_IgEG1_BMSL_ii; 

    %%%DOUBLE EXPONENTIAL FIT

     %%% Individual fits to each IgE/G1 and BM/SL data set
     problem_logdexp_IgE_BM = createOptimProblem('lsqcurvefit','x0',[y0_0_IgE_BM,f_0,k1_0,k2_0],'objective',@logdoubleexp_survival,'lb',[y0_0_IgE_BM/100,0.5,0,0],'ub',[y0_0_IgE_BM*100,1,1,1],'xdata',tdata,'ydata',logydata_mean_hCD4_IgE_BM_bootstrap(ii,:));   
     [x_opt_logdexp_IgE_BM_ii,error_x_opt_logdexp_IgE_BM_ii] = run(ms,problem_logdexp_IgE_BM,nostartingpoints);
     x_opt_logdexp_IgE_BM_bootstrap(ii,:) = x_opt_logdexp_IgE_BM_ii; 
     error_x_opt_logdexp_IgE_BM_bootstrap(ii) = error_x_opt_logdexp_IgE_BM_ii;    

     problem_logdexp_IgG1_BM = createOptimProblem('lsqcurvefit','x0',[y0_0_IgG1_BM,f_0,k1_0,k2_0],'objective',@logdoubleexp_survival,'lb',[y0_0_IgG1_BM/100,0.5,0,0],'ub',[y0_0_IgG1_BM*100,1,1,1],'xdata',tdata,'ydata',logydata_mean_hCD4_IgG1_BM_bootstrap(ii,:));   
     [x_opt_logdexp_IgG1_BM_ii,error_x_opt_logdexp_IgG1_BM_ii] = run(ms,problem_logdexp_IgG1_BM,nostartingpoints);
     x_opt_logdexp_IgG1_BM_bootstrap(ii,:) = x_opt_logdexp_IgG1_BM_ii; 
     error_x_opt_logdexp_IgG1_BM_bootstrap(ii) = error_x_opt_logdexp_IgG1_BM_ii;   

     problem_logdexp_IgE_SL = createOptimProblem('lsqcurvefit','x0',[y0_0_IgE_SL,f_0,k1_0,k2_0],'objective',@logdoubleexp_survival,'lb',[y0_0_IgE_SL/100,0.5,0,0],'ub',[y0_0_IgE_SL*100,1,1,1],'xdata',tdata,'ydata',logydata_mean_hCD4_IgE_SL_bootstrap(ii,:));   
     [x_opt_logdexp_IgE_SL_ii,error_x_opt_logdexp_IgE_SL_ii] = run(ms,problem_logdexp_IgE_SL,nostartingpoints);
     x_opt_logdexp_IgE_SL_bootstrap(ii,:) = x_opt_logdexp_IgE_SL_ii; 
     error_x_opt_logdexp_IgE_SL_bootstrap(ii) = error_x_opt_logdexp_IgE_SL_ii;   

     problem_logdexp_IgG1_SL = createOptimProblem('lsqcurvefit','x0',[y0_0_IgG1_SL,f_0,k1_0,k2_0],'objective',@logdoubleexp_survival,'lb',[y0_0_IgG1_SL/100,0.5,0,0],'ub',[y0_0_IgG1_SL*100,1,1,1],'xdata',tdata,'ydata',logydata_mean_hCD4_IgG1_SL_bootstrap(ii,:));   
     [x_opt_logdexp_IgG1_SL_ii,error_x_opt_logdexp_IgG1_SL_ii] = run(ms,problem_logdexp_IgG1_SL,nostartingpoints);
     x_opt_logdexp_IgG1_SL_bootstrap(ii,:) = x_opt_logdexp_IgG1_SL_ii; 
     error_x_opt_logdexp_IgG1_SL_bootstrap(ii) = error_x_opt_logdexp_IgG1_SL_ii;  

     %%% Fits to IgE combined BM/SL and IgG1 combined BM/SL
     problem_logdexp_IgE_BMSL = createOptimProblem('lsqcurvefit','x0',[y0_0_IgE_BM,y0_0_IgE_SL,f_0,f_0,k1_0,k2_0],'objective',@logdoubleexp_survival_twodatasets,'lb',[y0_0_IgE_BM/100,y0_0_IgE_SL/100,0.5,0.5,0,0],'ub',[y0_0_IgE_BM*100,y0_0_IgE_SL*100,1,1,1,1],'xdata',tdata,'ydata',[logydata_mean_hCD4_IgE_BM_bootstrap(ii,:),logydata_mean_hCD4_IgE_SL_bootstrap(ii,:)]);   
     [x_opt_logdexp_IgE_BMSL_ii,error_x_opt_logdexp_IgE_BMSL_ii] = run(ms,problem_logdexp_IgE_BMSL,nostartingpoints);
     x_opt_logdexp_IgE_BMSL_bootstrap(ii,:) = x_opt_logdexp_IgE_BMSL_ii; 
     error_x_opt_logdexp_IgE_BMSL_bootstrap(ii) = error_x_opt_logdexp_IgE_BMSL_ii; 

     problem_logdexp_IgG1_BMSL = createOptimProblem('lsqcurvefit','x0',[y0_0_IgG1_BM,y0_0_IgG1_SL,f_0,f_0,k1_0,k2_0],'objective',@logdoubleexp_survival_twodatasets,'lb',[y0_0_IgG1_BM/100,y0_0_IgG1_SL/100,0.5,0.5,0,0],'ub',[y0_0_IgG1_BM*100,y0_0_IgG1_SL*100,1,1,1,1],'xdata',tdata,'ydata',[logydata_mean_hCD4_IgG1_BM_bootstrap(ii,:),logydata_mean_hCD4_IgG1_SL_bootstrap(ii,:)]);   
     [x_opt_logdexp_IgG1_BMSL_ii,error_x_opt_logdexp_IgG1_BMSL_ii] = run(ms,problem_logdexp_IgG1_BMSL,nostartingpoints);
     x_opt_logdexp_IgG1_BMSL_bootstrap(ii,:) = x_opt_logdexp_IgG1_BMSL_ii; 
     error_x_opt_logdexp_IgG1_BMSL_bootstrap(ii) = error_x_opt_logdexp_IgG1_BMSL_ii;

     %%% Fits to BM combined IgE/G1 and SL combined IgE/G1
     problem_logdexp_IgEG1_BM = createOptimProblem('lsqcurvefit','x0',[y0_0_IgE_BM,y0_0_IgG1_BM,f_0,f_0,k1_0,k2_0],'objective',@logdoubleexp_survival_twodatasets,'lb',[y0_0_IgE_BM/100,y0_0_IgG1_BM/100,0.5,0.5,0,0],'ub',[y0_0_IgE_BM*100,y0_0_IgG1_BM*100,1,1,1,1],'xdata',tdata,'ydata',[logydata_mean_hCD4_IgE_BM_bootstrap(ii,:),logydata_mean_hCD4_IgG1_BM_bootstrap(ii,:)]);   
     [x_opt_logdexp_IgEG1_BM_ii,error_x_opt_logdexp_IgEG1_BM_ii] = run(ms,problem_logdexp_IgEG1_BM,nostartingpoints);
     x_opt_logdexp_IgEG1_BM_bootstrap(ii,:) = x_opt_logdexp_IgEG1_BM_ii; 
     error_x_opt_logdexp_IgEG1_BM_bootstrap(ii) = error_x_opt_logdexp_IgEG1_BM_ii; 

     problem_logdexp_IgEG1_SL = createOptimProblem('lsqcurvefit','x0',[y0_0_IgE_SL,y0_0_IgG1_SL,f_0,f_0,k1_0,k2_0],'objective',@logdoubleexp_survival_twodatasets,'lb',[y0_0_IgE_SL/100,y0_0_IgG1_SL/100,0.5,0.5,0,0],'ub',[y0_0_IgE_SL*100,y0_0_IgG1_SL*100,1,1,1,1],'xdata',tdata,'ydata',[logydata_mean_hCD4_IgE_SL_bootstrap(ii,:),logydata_mean_hCD4_IgG1_SL_bootstrap(ii,:)]);   
     [x_opt_logdexp_IgEG1_SL_ii,error_x_opt_logdexp_IgEG1_SL_ii] = run(ms,problem_logdexp_IgEG1_SL,nostartingpoints);
     x_opt_logdexp_IgEG1_SL_bootstrap(ii,:) = x_opt_logdexp_IgEG1_SL_ii; 
     error_x_opt_logdexp_IgEG1_SL_bootstrap(ii) = error_x_opt_logdexp_IgEG1_SL_ii; 

     %%Fits to all four data sets simultaneously BM/SL and IgE/G1
     problem_logdexp_IgEG1_BMSL = createOptimProblem('lsqcurvefit','x0',[y0_0_IgE_BM,y0_0_IgG1_BM,y0_0_IgE_SL,y0_0_IgG1_SL,f_0,f_0,f_0,f_0,k1_0,k2_0],'objective',@logdoubleexp_survival_fourdatasets,'lb',[y0_0_IgE_BM/100,y0_0_IgG1_BM/100,y0_0_IgE_SL/100,y0_0_IgG1_SL/100,0.5,0.5,0.5,0.5,0,0],'ub',[y0_0_IgE_BM*100,y0_0_IgG1_BM*100,y0_0_IgE_SL*100,y0_0_IgG1_SL*100,1,1,1,1,1,1],'xdata',tdata,'ydata',[logydata_mean_hCD4_IgE_BM_bootstrap(ii,:),logydata_mean_hCD4_IgG1_BM_bootstrap(ii,:),logydata_mean_hCD4_IgE_SL_bootstrap(ii,:),logydata_mean_hCD4_IgG1_SL_bootstrap(ii,:)]);   
     [x_opt_logdexp_IgEG1_BMSL_ii,error_x_opt_logdexp_IgEG1_BMSL_ii] = run(ms,problem_logdexp_IgEG1_BMSL,nostartingpoints);
     x_opt_logdexp_IgEG1_BMSL_bootstrap(ii,:) = x_opt_logdexp_IgEG1_BMSL_ii; 
     error_x_opt_logdexp_IgEG1_BMSL_bootstrap(ii) = error_x_opt_logdexp_IgEG1_BMSL_ii; 
 
    %%%STEADY STATE LOGNORMAL FIT

   %%Individual fits to each IgE/G1 and BM/SL data set
     %problem_logsslogn_IgE_BM = createOptimProblem('lsqcurvefit','x0',[y0_0_IgE_BM,mu_0,sigma_0],'objective',@logsslogn_survival,'lb',[y0_0_IgE_BM/100,0.1,0.1],'ub',[y0_0_IgE_BM*100,100,100],'xdata',tdata,'ydata',logydata_mean_hCD4_IgE_BM_bootstrap(ii,:));   
     problem_logsslogn_IgE_BM = createOptimProblem('lsqcurvefit','x0',[y0_0_IgE_BM,m_0,s_0],'objective',@logsslogn_survival,'lb',[y0_0_IgE_BM/100,-10,0],'ub',[y0_0_IgE_BM*100,10,10],'xdata',tdata,'ydata',logydata_mean_hCD4_IgE_BM_bootstrap(ii,:));   
     [x_opt_logsslogn_IgE_BM_ii,error_x_opt_logsslogn_IgE_BM_ii] = run(ms,problem_logsslogn_IgE_BM,nostartingpoints);
     x_opt_logsslogn_IgE_BM_bootstrap(ii,:) = x_opt_logsslogn_IgE_BM_ii; 
     error_x_opt_logsslogn_IgE_BM_bootstrap(ii) = error_x_opt_logsslogn_IgE_BM_ii; 

     %problem_logsslogn_IgG1_BM = createOptimProblem('lsqcurvefit','x0',[y0_0_IgG1_BM,mu_0,sigma_0],'objective',@logsslogn_survival,'lb',[y0_0_IgG1_BM/100,0.1,0.1],'ub',[y0_0_IgG1_BM*100,100,100],'xdata',tdata,'ydata',logydata_mean_hCD4_IgG1_BM_bootstrap(ii,:));   
     problem_logsslogn_IgG1_BM = createOptimProblem('lsqcurvefit','x0',[y0_0_IgG1_BM,m_0,s_0],'objective',@logsslogn_survival,'lb',[y0_0_IgG1_BM/100,-10,0],'ub',[y0_0_IgG1_BM*100,10,10],'xdata',tdata,'ydata',logydata_mean_hCD4_IgG1_BM_bootstrap(ii,:));   
     [x_opt_logsslogn_IgG1_BM_ii,error_x_opt_logsslogn_IgG1_BM_ii] = run(ms,problem_logsslogn_IgG1_BM,nostartingpoints);
     x_opt_logsslogn_IgG1_BM_bootstrap(ii,:) = x_opt_logsslogn_IgG1_BM_ii; 
     error_x_opt_logsslogn_IgG1_BM_bootstrap(ii) = error_x_opt_logsslogn_IgG1_BM_ii;

     %problem_logsslogn_IgE_SL = createOptimProblem('lsqcurvefit','x0',[y0_0_IgE_SL,mu_0,sigma_0],'objective',@logsslogn_survival,'lb',[y0_0_IgE_SL/100,0.1,0.1],'ub',[y0_0_IgE_SL*100,100,100],'xdata',tdata,'ydata',logydata_mean_hCD4_IgE_SL_bootstrap(ii,:));   
     problem_logsslogn_IgE_SL = createOptimProblem('lsqcurvefit','x0',[y0_0_IgE_SL,m_0,s_0],'objective',@logsslogn_survival,'lb',[y0_0_IgE_SL/100,-10,0],'ub',[y0_0_IgE_SL*100,10,10],'xdata',tdata,'ydata',logydata_mean_hCD4_IgE_SL_bootstrap(ii,:));   
     [x_opt_logsslogn_IgE_SL_ii,error_x_opt_logsslogn_IgE_SL_ii] = run(ms,problem_logsslogn_IgE_SL,nostartingpoints);
     x_opt_logsslogn_IgE_SL_bootstrap(ii,:) = x_opt_logsslogn_IgE_SL_ii; 
     error_x_opt_logsslogn_IgE_SL_bootstrap(ii) = error_x_opt_logsslogn_IgE_SL_ii; 

     %problem_logsslogn_IgG1_SL = createOptimProblem('lsqcurvefit','x0',[y0_0_IgG1_SL,mu_0,sigma_0],'objective',@logsslogn_survival,'lb',[y0_0_IgG1_SL/100,0.1,0.1],'ub',[y0_0_IgG1_SL*100,100,100],'xdata',tdata,'ydata',logydata_mean_hCD4_IgG1_SL_bootstrap(ii,:));   
     problem_logsslogn_IgG1_SL = createOptimProblem('lsqcurvefit','x0',[y0_0_IgG1_SL,m_0,s_0],'objective',@logsslogn_survival,'lb',[y0_0_IgG1_SL/100,-10,0],'ub',[y0_0_IgG1_SL*100,10,10],'xdata',tdata,'ydata',logydata_mean_hCD4_IgG1_SL_bootstrap(ii,:));
     [x_opt_logsslogn_IgG1_SL_ii,error_x_opt_logsslogn_IgG1_SL_ii] = run(ms,problem_logsslogn_IgG1_SL,nostartingpoints);
     x_opt_logsslogn_IgG1_SL_bootstrap(ii,:) = x_opt_logsslogn_IgG1_SL_ii; 
     error_x_opt_logsslogn_IgG1_SL_bootstrap(ii) = error_x_opt_logsslogn_IgG1_SL_ii;

     %%Fits to IgE combined BM/SL and IgG1 combined BM/SL
     %problem_logsslogn_IgE_BMSL = createOptimProblem('lsqcurvefit','x0',[y0_0_IgE_BM,y0_0_IgE_SL,mu_0,sigma_0],'objective',@logsslogn_survival_twodatasets,'lb',[y0_0_IgE_BM/100,y0_0_IgE_SL/100,0.1,0.1],'ub',[y0_0_IgE_BM*100,y0_0_IgE_SL*100,100,100],'xdata',tdata,'ydata',[logydata_mean_hCD4_IgE_BM_bootstrap(ii,:),logydata_mean_hCD4_IgE_SL_bootstrap(ii,:)]);   
     problem_logsslogn_IgE_BMSL = createOptimProblem('lsqcurvefit','x0',[y0_0_IgE_BM,y0_0_IgE_SL,m_0,s_0],'objective',@logsslogn_survival_twodatasets,'lb',[y0_0_IgE_BM/100,y0_0_IgE_SL/100,-10,0],'ub',[y0_0_IgE_BM*100,y0_0_IgE_SL*100,10,10],'xdata',tdata,'ydata',[logydata_mean_hCD4_IgE_BM_bootstrap(ii,:),logydata_mean_hCD4_IgE_SL_bootstrap(ii,:)]);
     [x_opt_logsslogn_IgE_BMSL_ii,error_x_opt_logsslogn_IgE_BMSL_ii] = run(ms,problem_logsslogn_IgE_BMSL,nostartingpoints);
     x_opt_logsslogn_IgE_BMSL_bootstrap(ii,:) = x_opt_logsslogn_IgE_BMSL_ii; 
     error_x_opt_logsslogn_IgE_BMSL_bootstrap(ii) = error_x_opt_logsslogn_IgE_BMSL_ii; 

     %problem_logsslogn_IgG1_BMSL = createOptimProblem('lsqcurvefit','x0',[y0_0_IgG1_BM,y0_0_IgG1_SL,mu_0,sigma_0],'objective',@logsslogn_survival_twodatasets,'lb',[y0_0_IgG1_BM/100,y0_0_IgG1_SL/100,0.1,0.1],'ub',[y0_0_IgG1_BM*100,y0_0_IgG1_SL*100,100,100],'xdata',tdata,'ydata',[logydata_mean_hCD4_IgG1_BM_bootstrap(ii,:),logydata_mean_hCD4_IgG1_SL_bootstrap(ii,:)]);   
     problem_logsslogn_IgG1_BMSL = createOptimProblem('lsqcurvefit','x0',[y0_0_IgG1_BM,y0_0_IgG1_SL,m_0,s_0],'objective',@logsslogn_survival_twodatasets,'lb',[y0_0_IgG1_BM/100,y0_0_IgG1_SL/100,-10,0],'ub',[y0_0_IgG1_BM*100,y0_0_IgG1_SL*100,10,10],'xdata',tdata,'ydata',[logydata_mean_hCD4_IgG1_BM_bootstrap(ii,:),logydata_mean_hCD4_IgG1_SL_bootstrap(ii,:)]);  
     [x_opt_logsslogn_IgG1_BMSL_ii,error_x_opt_logsslogn_IgG1_BMSL_ii] = run(ms,problem_logsslogn_IgG1_BMSL,nostartingpoints);
     x_opt_logsslogn_IgG1_BMSL_bootstrap(ii,:) = x_opt_logsslogn_IgG1_BMSL_ii; 
     error_x_opt_logsslogn_IgG1_BMSL_bootstrap(ii) = error_x_opt_logsslogn_IgG1_BMSL_ii;

     %%Fits to BM combined IgE/G1 and SL combined IgE/G1
     %problem_logsslogn_IgEG1_BM = createOptimProblem('lsqcurvefit','x0',[y0_0_IgE_BM,y0_0_IgG1_BM,mu_0,sigma_0],'objective',@logsslogn_survival_twodatasets,'lb',[y0_0_IgE_BM/100,y0_0_IgG1_BM/100,0.1,0.1],'ub',[y0_0_IgE_BM*100,y0_0_IgG1_BM*100,100,100],'xdata',tdata,'ydata',[logydata_mean_hCD4_IgE_BM_bootstrap(ii,:),logydata_mean_hCD4_IgG1_BM_bootstrap(ii,:)]);   
     problem_logsslogn_IgEG1_BM = createOptimProblem('lsqcurvefit','x0',[y0_0_IgE_BM,y0_0_IgG1_BM,m_0,s_0],'objective',@logsslogn_survival_twodatasets,'lb',[y0_0_IgE_BM/100,y0_0_IgG1_BM/100,-10,0],'ub',[y0_0_IgE_BM*100,y0_0_IgG1_BM*100,10,10],'xdata',tdata,'ydata',[logydata_mean_hCD4_IgE_BM_bootstrap(ii,:),logydata_mean_hCD4_IgG1_BM_bootstrap(ii,:)]);
     [x_opt_logsslogn_IgEG1_BM_ii,error_x_opt_logsslogn_IgEG1_BM_ii] = run(ms,problem_logsslogn_IgEG1_BM,nostartingpoints);
     x_opt_logsslogn_IgEG1_BM_bootstrap(ii,:) = x_opt_logsslogn_IgEG1_BM_ii; 
     error_x_opt_logsslogn_IgEG1_BM_bootstrap(ii) = error_x_opt_logsslogn_IgEG1_BM_ii; 

     %problem_logsslogn_IgEG1_SL = createOptimProblem('lsqcurvefit','x0',[y0_0_IgE_SL,y0_0_IgG1_SL,mu_0,sigma_0],'objective',@logsslogn_survival_twodatasets,'lb',[y0_0_IgE_SL/100,y0_0_IgG1_SL/100,0.1,0.1],'ub',[y0_0_IgE_SL*100,y0_0_IgG1_SL*100,100,100],'xdata',tdata,'ydata',[logydata_mean_hCD4_IgE_SL_bootstrap(ii,:),logydata_mean_hCD4_IgG1_SL_bootstrap(ii,:)]);   
     problem_logsslogn_IgEG1_SL = createOptimProblem('lsqcurvefit','x0',[y0_0_IgE_SL,y0_0_IgG1_SL,m_0,s_0],'objective',@logsslogn_survival_twodatasets,'lb',[y0_0_IgE_SL/100,y0_0_IgG1_SL/100,-10,0],'ub',[y0_0_IgE_SL*100,y0_0_IgG1_SL*100,10,10],'xdata',tdata,'ydata',[logydata_mean_hCD4_IgE_SL_bootstrap(ii,:),logydata_mean_hCD4_IgG1_SL_bootstrap(ii,:)]);   
     [x_opt_logsslogn_IgEG1_SL_ii,error_x_opt_logsslogn_IgEG1_SL_ii] = run(ms,problem_logsslogn_IgEG1_SL,nostartingpoints);
     x_opt_logsslogn_IgEG1_SL_bootstrap(ii,:) = x_opt_logsslogn_IgEG1_SL_ii; 
     error_x_opt_logsslogn_IgEG1_SL_bootstrap(ii) = error_x_opt_logsslogn_IgEG1_SL_ii; 

     %%Fits to all four data sets simultaneously (only initial number varies) BM/SL and IgE/G1
     %problem_logsslogn_IgEG1_BMSL = createOptimProblem('lsqcurvefit','x0',[y0_0_IgE_BM,y0_0_IgG1_BM,y0_0_IgE_SL,y0_0_IgG1_SL,mu_0,sigma_0],'objective',@logsslogn_survival_fourdatasets,'lb',[y0_0_IgE_BM/100,y0_0_IgG1_BM/100,y0_0_IgE_SL/100,y0_0_IgG1_SL/100,0.1,0.1],'ub',[y0_0_IgE_BM*100,y0_0_IgG1_BM*100,y0_0_IgE_SL*100,y0_0_IgG1_SL*100,100,100],'xdata',tdata,'ydata',[logydata_mean_hCD4_IgE_BM_bootstrap(ii,:),logydata_mean_hCD4_IgG1_BM_bootstrap(ii,:),logydata_mean_hCD4_IgE_SL_bootstrap(ii,:),logydata_mean_hCD4_IgG1_SL_bootstrap(ii,:)]);   
     problem_logsslogn_IgEG1_BMSL = createOptimProblem('lsqcurvefit','x0',[y0_0_IgE_BM,y0_0_IgG1_BM,y0_0_IgE_SL,y0_0_IgG1_SL,m_0,s_0],'objective',@logsslogn_survival_fourdatasets,'lb',[y0_0_IgE_BM/100,y0_0_IgG1_BM/100,y0_0_IgE_SL/100,y0_0_IgG1_SL/100,-10,0],'ub',[y0_0_IgE_BM*100,y0_0_IgG1_BM*100,y0_0_IgE_SL*100,y0_0_IgG1_SL*100,10,10],'xdata',tdata,'ydata',[logydata_mean_hCD4_IgE_BM_bootstrap(ii,:),logydata_mean_hCD4_IgG1_BM_bootstrap(ii,:),logydata_mean_hCD4_IgE_SL_bootstrap(ii,:),logydata_mean_hCD4_IgG1_SL_bootstrap(ii,:)]);  
     [x_opt_logsslogn_IgEG1_BMSL_ii,error_x_opt_logsslogn_IgEG1_BMSL_ii] = run(ms,problem_logsslogn_IgEG1_BMSL,nostartingpoints);
     x_opt_logsslogn_IgEG1_BMSL_bootstrap(ii,:) = x_opt_logsslogn_IgEG1_BMSL_ii; 
     error_x_opt_logsslogn_IgEG1_BMSL_bootstrap(ii) = error_x_opt_logsslogn_IgEG1_BMSL_ii; 

 %Save results
 cd(starttimestr)
 save(strcat('hCD4_homeo_IgEG1_BMSL_logfits_',starttimestr,'.mat'))
 cd ..

 end

%dexp_correct_t1_t2_bootstrap
plotresults_IgEG1_BMSL_t_offset_logfits
writeresults_IgEG1_BMSL_logfits

toc