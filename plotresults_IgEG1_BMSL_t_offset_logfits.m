% 16 plots
% 4 for each model
% 1. individual fits
% 2. 2 joint fits by SLT/BM
% 3. 2 joint fits by IgG1/E
% 4. 4 joint fits by IgG1/E and SLT/BM

tdata = [2,7,21,42,60,77,114];

%%%% SINGLE EXPONENTIAL MODEL

%%% Individual fits to each IgG1/E and SLT/BM data set
    error_x_opt_logsexp_IgE_BM = error_x_opt_logsexp_IgE_BM_bootstrap(1);
    x_opt_logsexp_IgE_BM = x_opt_logsexp_IgE_BM_bootstrap(1,:);
    x_opt_logsexp_IgE_BM_bootstrap_thalf = x_opt_logsexp_IgE_BM_bootstrap;
    x_opt_logsexp_IgE_BM_bootstrap_thalf(:,2) = log(2)./x_opt_logsexp_IgE_BM_bootstrap_thalf(:,2);
    logyfit_logsexp_IgE_BM = logsingleexp_survival(x_opt_logsexp_IgE_BM,tgrid(1:(nogridpoints-2)));
    y0_opt_logsexp_IgE_BM = x_opt_logsexp_IgE_BM(1);
    thalf_opt_logsexp_IgE_BM = log(2)/x_opt_logsexp_IgE_BM(2);
    AIC_opt_logsexp_IgE_BM = aic(length(x_opt_logsexp_IgE_BM),nodatapoints,error_x_opt_logsexp_IgE_BM);
    titlestr_logsexp_IgE_BM = sprintf('IgE BM: y_{0} = %.1e, t_1 = %.1f',[y0_opt_logsexp_IgE_BM,thalf_opt_logsexp_IgE_BM]);

    error_x_opt_logsexp_IgG1_BM = error_x_opt_logsexp_IgG1_BM_bootstrap(1);
    x_opt_logsexp_IgG1_BM = x_opt_logsexp_IgG1_BM_bootstrap(1,:);
    x_opt_logsexp_IgG1_BM_bootstrap_thalf = x_opt_logsexp_IgG1_BM_bootstrap;
    x_opt_logsexp_IgG1_BM_bootstrap_thalf(:,2) = log(2)./x_opt_logsexp_IgG1_BM_bootstrap_thalf(:,2);
    logyfit_logsexp_IgG1_BM = logsingleexp_survival(x_opt_logsexp_IgG1_BM,tgrid(1:(nogridpoints-2)));
    y0_opt_logsexp_IgG1_BM = x_opt_logsexp_IgG1_BM(1);
    thalf_opt_logsexp_IgG1_BM = log(2)/x_opt_logsexp_IgG1_BM(2);
    AIC_opt_logsexp_IgG1_BM = aic(length(x_opt_logsexp_IgG1_BM),nodatapoints,error_x_opt_logsexp_IgG1_BM);
    titlestr_logsexp_IgG1_BM = sprintf('IgG1 BM: y_{0} = %.1e, t_1 = %.1f',[y0_opt_logsexp_IgG1_BM,thalf_opt_logsexp_IgG1_BM]);

    error_x_opt_logsexp_IgE_SL = error_x_opt_logsexp_IgE_SL_bootstrap(1);
    x_opt_logsexp_IgE_SL = x_opt_logsexp_IgE_SL_bootstrap(1,:);
    x_opt_logsexp_IgE_SL_bootstrap_thalf = x_opt_logsexp_IgE_SL_bootstrap;
    x_opt_logsexp_IgE_SL_bootstrap_thalf(:,2) = log(2)./x_opt_logsexp_IgE_SL_bootstrap_thalf(:,2);
    logyfit_logsexp_IgE_SL = logsingleexp_survival(x_opt_logsexp_IgE_SL,tgrid(1:(nogridpoints-2)));
    y0_opt_logsexp_IgE_SL = x_opt_logsexp_IgE_SL(1);
    thalf_opt_logsexp_IgE_SL = log(2)/x_opt_logsexp_IgE_SL(2);
    AIC_opt_logsexp_IgE_SL = aic(length(x_opt_logsexp_IgE_SL),nodatapoints,error_x_opt_logsexp_IgE_SL);
    titlestr_logsexp_IgE_SL = sprintf('IgE SLT: y_{0} = %.1e, t_1 = %.1f',[y0_opt_logsexp_IgE_SL,thalf_opt_logsexp_IgE_SL]);

    error_x_opt_logsexp_IgG1_SL = error_x_opt_logsexp_IgG1_SL_bootstrap(1);
    x_opt_logsexp_IgG1_SL = x_opt_logsexp_IgG1_SL_bootstrap(1,:);
    x_opt_logsexp_IgG1_SL_bootstrap_thalf = x_opt_logsexp_IgG1_SL_bootstrap;
    x_opt_logsexp_IgG1_SL_bootstrap_thalf(:,2) = log(2)./x_opt_logsexp_IgG1_SL_bootstrap_thalf(:,2);
    logyfit_logsexp_IgG1_SL = logsingleexp_survival(x_opt_logsexp_IgG1_SL,tgrid(1:(nogridpoints-2)));
    y0_opt_logsexp_IgG1_SL = x_opt_logsexp_IgG1_SL(1);
    thalf_opt_logsexp_IgG1_SL = log(2)/x_opt_logsexp_IgG1_SL(2);
    AIC_opt_logsexp_IgG1_SL = aic(length(x_opt_logsexp_IgG1_SL),nodatapoints,error_x_opt_logsexp_IgG1_SL);
    titlestr_logsexp_IgG1_SL = sprintf('IgG1 SLT: y_{0} = %.1e, t_1 = %.1f',[y0_opt_logsexp_IgG1_SL,thalf_opt_logsexp_IgG1_SL]);
    
    error_x_opt_logsexp = error_x_opt_logsexp_IgE_BM + error_x_opt_logsexp_IgG1_BM + error_x_opt_logsexp_IgE_SL + error_x_opt_logsexp_IgG1_SL;
    AIC_opt_logsexp = aic(length(x_opt_logsexp_IgE_BM)+length(x_opt_logsexp_IgE_SL)+length(x_opt_logsexp_IgG1_BM)+length(x_opt_logsexp_IgG1_SL),4*nodatapoints,error_x_opt_logsexp);
    titlestr_logsexp = sprintf('Single exponential fits: s.s.e. = %.2f, AIC = %.3g',[error_x_opt_logsexp,AIC_opt_logsexp]);

%%% Plot Results
    f1 = figure;
    f1.Units = 'inches';
    f1.OuterPosition = [0 0 15 10];
    sgtitle(titlestr_logsexp,'FontWeight','Bold','FontSize',18)
    f1d = subplot(224);
    errorbar(tdata,logydata_mean_hCD4_IgE_BM,logydata_sem_hCD4_IgE_BM,'bo','LineWidth',2,'MarkerSize',10)
    hold on 
    plot(tgrid(1:(nogridpoints-2))+2,logyfit_logsexp_IgE_BM,'k--','LineWidth',2,'MarkerSize',10)
    hold off
    title(titlestr_logsexp_IgE_BM, 'FontWeight','Normal','FontSize',16)
    f1d.TitleHorizontalAlignment = 'left';
    axis([t0 tf 0.5 5.5])
    yticks(gca,[1 2 3 4 5])
    legend('data', 'model fit')
    text(50,5,sprintf('s.s.e. = %.2f\nAIC = %.3g',[error_x_opt_logsexp_IgE_BM,AIC_opt_logsexp_IgE_BM]),'FontSize', 16)
    xlabel('time (days)')
    ylabel('log_{10}(hCD4+)')
    set(gca,'FontSize',16)
    
    f1c = subplot(223);
    errorbar(tdata,logydata_mean_hCD4_IgE_SL,logydata_sem_hCD4_IgE_SL,'bo','LineWidth',2,'MarkerSize',10)
    hold on 
    plot(tgrid(1:(nogridpoints-2))+2,logyfit_logsexp_IgE_SL,'k--','LineWidth',2,'MarkerSize',10)
    hold off
    title(titlestr_logsexp_IgE_SL, 'FontWeight','Normal','FontSize',16)
    f1c.TitleHorizontalAlignment = 'left';
    axis([t0 tf 0.5 5.5])
    yticks(gca,[1 2 3 4 5])
    legend('data', 'model fit')
    text(50,5,sprintf('s.s.e. = %.2f\nAIC = %.3g',[error_x_opt_logsexp_IgE_SL,AIC_opt_logsexp_IgE_SL]),'FontSize', 16)
    xlabel('time (days)')
    ylabel('log_{10}(hCD4+)')
    set(gca,'FontSize',16)
    
    f1b = subplot(222);
    errorbar(tdata,logydata_mean_hCD4_IgG1_BM,logydata_sem_hCD4_IgG1_BM,'bo','LineWidth',2,'MarkerSize',10)
    hold on 
    plot(tgrid(1:(nogridpoints-2))+2,logyfit_logsexp_IgG1_BM,'k--','LineWidth',2,'MarkerSize',10)
    hold off
    title(titlestr_logsexp_IgG1_BM, 'FontWeight','Normal','FontSize',16)
    f1b.TitleHorizontalAlignment = 'left';
    axis([t0 tf 0.5 5.5])
    yticks(gca,[1 2 3 4 5])
    legend('data', 'model fit')
    text(50,5,sprintf('s.s.e. = %.2f\nAIC = %.3g',[error_x_opt_logsexp_IgG1_BM,AIC_opt_logsexp_IgG1_BM]),'FontSize', 16)
    xlabel('time (days)')
    ylabel('log_{10}(hCD4+)')
    set(gca,'FontSize',16)
    
    f1a = subplot(221);
    errorbar(tdata,logydata_mean_hCD4_IgG1_SL,logydata_sem_hCD4_IgG1_SL,'bo','LineWidth',2,'MarkerSize',10)
    hold on 
    plot(tgrid(1:(nogridpoints-2))+2,logyfit_logsexp_IgG1_SL,'k--','LineWidth',2,'MarkerSize',10)
    hold off
    title(titlestr_logsexp_IgG1_SL, 'FontWeight','Normal','FontSize',16)
    f1a.TitleHorizontalAlignment = 'left';
    axis([t0 tf 0.5 5.5])
    yticks(gca,[1 2 3 4 5])
    legend('data', 'model fit')
    text(50,5,sprintf('s.s.e. = %.2f\nAIC = %.3g',[error_x_opt_logsexp_IgG1_SL,AIC_opt_logsexp_IgG1_SL]),'FontSize', 16)
    xlabel('time (days)')
    ylabel('log_{10}(hCD4+)')
    set(gca,'FontSize',16)

%%% Fits to IgE combined SLT/BM and IgG1 combined SLT/BM
    error_x_opt_logsexp_IgE_BMSL = error_x_opt_logsexp_IgE_BMSL_bootstrap(1);
    x_opt_logsexp_IgE_BMSL = x_opt_logsexp_IgE_BMSL_bootstrap(1,:);
    x_opt_logsexp_IgE_BMSL_bootstrap_thalf = x_opt_logsexp_IgE_BMSL_bootstrap;
    x_opt_logsexp_IgE_BMSL_bootstrap_thalf(:,3) = log(2)./x_opt_logsexp_IgE_BMSL_bootstrap_thalf(:,3);
    logyfit_logsexp_IgE_BMSL = logsingleexp_survival_twodatasets(x_opt_logsexp_IgE_BMSL,tgrid(1:(nogridpoints-2)));
    logyfit_logsexp_IgE_BM = logyfit_logsexp_IgE_BMSL(1:(nogridpoints-2));
    logyfit_logsexp_IgE_SL = logyfit_logsexp_IgE_BMSL((nogridpoints-2)+1:2*(nogridpoints-2));
    y0_opt_logsexp_IgE_BM = x_opt_logsexp_IgE_BMSL(1);
    y0_opt_logsexp_IgE_SL = x_opt_logsexp_IgE_BMSL(2);
    thalf_opt_logsexp_IgE_BMSL = log(2)/x_opt_logsexp_IgE_BMSL(3);
    AIC_opt_logsexp_IgE_BMSL = aic(length(x_opt_logsexp_IgE_BMSL),2*nodatapoints,error_x_opt_logsexp_IgE_BMSL);
    titlestr_logsexp_IgE_BM = sprintf('IgE BM: y_{0} = %.1e, t_1 = %.1f',[y0_opt_logsexp_IgE_BM,thalf_opt_logsexp_IgE_BMSL]);
    titlestr_logsexp_IgE_SL = sprintf('IgE SLT: y_{0} = %.1e, t_1 = %.1f',[y0_opt_logsexp_IgE_SL,thalf_opt_logsexp_IgE_BMSL]);

    error_x_opt_logsexp_IgG1_BMSL = error_x_opt_logsexp_IgG1_BMSL_bootstrap(1);
    x_opt_logsexp_IgG1_BMSL = x_opt_logsexp_IgG1_BMSL_bootstrap(1,:);
    x_opt_logsexp_IgG1_BMSL_bootstrap_thalf = x_opt_logsexp_IgG1_BMSL_bootstrap;
    x_opt_logsexp_IgG1_BMSL_bootstrap_thalf(:,3) = log(2)./x_opt_logsexp_IgG1_BMSL_bootstrap_thalf(:,3);
    logyfit_logsexp_IgG1_BMSL = logsingleexp_survival_twodatasets(x_opt_logsexp_IgG1_BMSL,tgrid(1:(nogridpoints-2)));
    logyfit_logsexp_IgG1_BM = logyfit_logsexp_IgG1_BMSL(1:(nogridpoints-2));
    logyfit_logsexp_IgG1_SL = logyfit_logsexp_IgG1_BMSL((nogridpoints-2)+1:2*(nogridpoints-2));
    y0_opt_logsexp_IgG1_BM = x_opt_logsexp_IgG1_BMSL(1);
    y0_opt_logsexp_IgG1_SL = x_opt_logsexp_IgG1_BMSL(2);
    thalf_opt_logsexp_IgG1_BMSL = log(2)/x_opt_logsexp_IgG1_BMSL(3);
    AIC_opt_logsexp_IgG1_BMSL = aic(length(x_opt_logsexp_IgG1_BMSL),2*nodatapoints,error_x_opt_logsexp_IgG1_BMSL);
    titlestr_logsexp_IgG1_BM = sprintf('IgG1 BM: y_{0} = %.1e, t_1 = %.1f',[y0_opt_logsexp_IgG1_BM,thalf_opt_logsexp_IgG1_BMSL]);
    titlestr_logsexp_IgG1_SL = sprintf('IgG1 SLT: y_{0} = %.1e, t_1 = %.1f',[y0_opt_logsexp_IgG1_SL,thalf_opt_logsexp_IgG1_BMSL]);

    error_x_opt_logsexp_BMSL = error_x_opt_logsexp_IgE_BMSL + error_x_opt_logsexp_IgG1_BMSL;
    AIC_opt_logsexp_BMSL = aic(length(x_opt_logsexp_IgE_BMSL)+length(x_opt_logsexp_IgG1_BMSL),4*nodatapoints,error_x_opt_logsexp_BMSL);
    titlestr_logsexp_BMSL = sprintf('Single exponential fits (SLT/BM combined): s.s.e. = %.2f, AIC = %.3g',[error_x_opt_logsexp_BMSL,AIC_opt_logsexp_BMSL]);

%%% Plot Results
    f2 = figure;
    f2.Units = 'inches';
    f2.OuterPosition = [0 0 15 10];
    sgtitle(titlestr_logsexp_BMSL,'FontWeight','Bold','FontSize',18)
    f2d = subplot(224);
    errorbar(tdata,logydata_mean_hCD4_IgE_BM,logydata_sem_hCD4_IgE_BM,'bo','LineWidth',2,'MarkerSize',10)
    hold on 
    plot(tgrid(1:(nogridpoints-2))+2,logyfit_logsexp_IgE_BM,'k--','LineWidth',2,'MarkerSize',10)
    hold off
    title(titlestr_logsexp_IgE_BM, 'FontWeight','Normal','FontSize',16)
    f2d.TitleHorizontalAlignment = 'left';
    axis([t0 tf 0.5 5.5])
    yticks(gca,[1 2 3 4 5])
    legend('data', 'model fit')
    text(50,5,sprintf('s.s.e. = %.2f\nAIC = %.3g',[error_x_opt_logsexp_IgE_BMSL,AIC_opt_logsexp_IgE_BMSL]),'FontSize', 16)
    xlabel('time (days)')
    ylabel('log_{10}(hCD4+)')
    set(gca,'FontSize',16)
    
    f2c = subplot(223);
    errorbar(tdata,logydata_mean_hCD4_IgE_SL,logydata_sem_hCD4_IgE_SL,'bo','LineWidth',2,'MarkerSize',10)
    hold on 
    plot(tgrid(1:(nogridpoints-2))+2,logyfit_logsexp_IgE_SL,'k--','LineWidth',2,'MarkerSize',10)
    hold off
    title(titlestr_logsexp_IgE_SL, 'FontWeight','Normal','FontSize',16)
    f2c.TitleHorizontalAlignment = 'left';
    axis([t0 tf 0.5 5.5])
    yticks(gca,[1 2 3 4 5])
    legend('data', 'model fit')
    text(50,5,sprintf('s.s.e. = %.2f\nAIC = %.3g',[error_x_opt_logsexp_IgE_BMSL,AIC_opt_logsexp_IgE_BMSL]),'FontSize', 16)
    xlabel('time (days)')
    ylabel('log_{10}(hCD4+)')
    set(gca,'FontSize',16)
    
    f2b = subplot(222);
    errorbar(tdata,logydata_mean_hCD4_IgG1_BM,logydata_sem_hCD4_IgG1_BM,'bo','LineWidth',2,'MarkerSize',10)
    hold on 
    plot(tgrid(1:(nogridpoints-2))+2,logyfit_logsexp_IgG1_BM,'k--','LineWidth',2,'MarkerSize',10)
    hold off
    title(titlestr_logsexp_IgG1_BM, 'FontWeight','Normal','FontSize',16)
    f2b.TitleHorizontalAlignment = 'left';
    axis([t0 tf 0.5 5.5])
    yticks(gca,[1 2 3 4 5])
    legend('data', 'model fit')
    text(50,5,sprintf('s.s.e. = %.2f\nAIC = %.3g',[error_x_opt_logsexp_IgG1_BMSL,AIC_opt_logsexp_IgG1_BMSL]),'FontSize', 16)
    xlabel('time (days)')
    ylabel('log_{10}(hCD4+)')
    set(gca,'FontSize',16)
    
    f2a = subplot(221);
    errorbar(tdata,logydata_mean_hCD4_IgG1_SL,logydata_sem_hCD4_IgG1_SL,'bo','LineWidth',2,'MarkerSize',10)
    hold on 
    plot(tgrid(1:(nogridpoints-2))+2,logyfit_logsexp_IgG1_SL,'k--','LineWidth',2,'MarkerSize',10)
    hold off
    title(titlestr_logsexp_IgG1_SL, 'FontWeight','Normal','FontSize',16)
    f2a.TitleHorizontalAlignment = 'left';
    axis([t0 tf 0.5 5.5])
    yticks(gca,[1 2 3 4 5])
    legend('data', 'model fit')
    text(50,5,sprintf('s.s.e. = %.2f\nAIC = %.3g',[error_x_opt_logsexp_IgG1_BMSL,AIC_opt_logsexp_IgG1_BMSL]),'FontSize', 16)
    xlabel('time (days)')
    ylabel('log_{10}(hCD4+)')
    set(gca,'FontSize',16)

    %%Fits to BM combined IgG1/E and SL combined IgG1/E
    error_x_opt_logsexp_IgEG1_BM = error_x_opt_logsexp_IgEG1_BM_bootstrap(1);
    x_opt_logsexp_IgEG1_BM = x_opt_logsexp_IgEG1_BM_bootstrap(1,:);
    x_opt_logsexp_IgEG1_BM_bootstrap_thalf = x_opt_logsexp_IgEG1_BM_bootstrap;
    x_opt_logsexp_IgEG1_BM_bootstrap_thalf(:,3) = log(2)./x_opt_logsexp_IgEG1_BM_bootstrap_thalf(:,3);
    logyfit_logsexp_IgEG1_BM = logsingleexp_survival_twodatasets(x_opt_logsexp_IgEG1_BM,tgrid(1:(nogridpoints-2)));
    logyfit_logsexp_IgE_BM = logyfit_logsexp_IgEG1_BM(1:(nogridpoints-2));
    logyfit_logsexp_IgG1_BM = logyfit_logsexp_IgEG1_BM((nogridpoints-2)+1:2*(nogridpoints-2));
    y0_opt_logsexp_IgE_BM = x_opt_logsexp_IgEG1_BM(1);
    y0_opt_logsexp_IgG1_BM = x_opt_logsexp_IgEG1_BM(2);
    thalf_opt_logsexp_IgEG1_BM = log(2)/x_opt_logsexp_IgEG1_BM(3);
    AIC_opt_logsexp_IgEG1_BM = aic(length(x_opt_logsexp_IgEG1_BM),2*nodatapoints,error_x_opt_logsexp_IgEG1_BM);
    titlestr_logsexp_IgE_BM = sprintf('IgE BM: y_{0} = %.1e, t_1 = %.1f',[y0_opt_logsexp_IgE_BM,thalf_opt_logsexp_IgEG1_BM]);
    titlestr_logsexp_IgG1_BM = sprintf('IgG1 BM: y_{0} = %.1e, t_1 = %.1f',[y0_opt_logsexp_IgG1_BM,thalf_opt_logsexp_IgEG1_BM]);

    error_x_opt_logsexp_IgEG1_SL = error_x_opt_logsexp_IgEG1_SL_bootstrap(1);
    x_opt_logsexp_IgEG1_SL = x_opt_logsexp_IgEG1_SL_bootstrap(1,:);
    x_opt_logsexp_IgEG1_SL_bootstrap_thalf = x_opt_logsexp_IgEG1_SL_bootstrap;
    x_opt_logsexp_IgEG1_SL_bootstrap_thalf(:,3) = log(2)./x_opt_logsexp_IgEG1_SL_bootstrap_thalf(:,3);
    logyfit_logsexp_IgEG1_SL = logsingleexp_survival_twodatasets(x_opt_logsexp_IgEG1_SL,tgrid(1:(nogridpoints-2)));
    logyfit_logsexp_IgE_SL = logyfit_logsexp_IgEG1_SL(1:(nogridpoints-2));
    logyfit_logsexp_IgG1_SL = logyfit_logsexp_IgEG1_SL((nogridpoints-2)+1:2*(nogridpoints-2));
    y0_opt_logsexp_IgE_SL = x_opt_logsexp_IgEG1_SL(1);
    y0_opt_logsexp_IgG1_SL = x_opt_logsexp_IgEG1_SL(2);
    thalf_opt_logsexp_IgEG1_SL = log(2)/x_opt_logsexp_IgEG1_SL(3);
    AIC_opt_logsexp_IgEG1_SL = aic(length(x_opt_logsexp_IgEG1_SL),2*nodatapoints,error_x_opt_logsexp_IgEG1_SL);
    titlestr_logsexp_IgE_SL = sprintf('IgE SLT: y_{0} = %.1e, t_1 = %.1f',[y0_opt_logsexp_IgE_SL,thalf_opt_logsexp_IgEG1_SL]);
    titlestr_logsexp_IgG1_SL = sprintf('IgG1 SLT: y_{0} = %.1e, t_1 = %.1f',[y0_opt_logsexp_IgG1_SL,thalf_opt_logsexp_IgEG1_SL]);

    error_x_opt_logsexp_IgEG1 = error_x_opt_logsexp_IgEG1_BM + error_x_opt_logsexp_IgEG1_SL;
    AIC_opt_logsexp_IgEG1 = aic(length(x_opt_logsexp_IgEG1_BM)+length(x_opt_logsexp_IgEG1_SL),4*nodatapoints,error_x_opt_logsexp_IgEG1);
    titlestr_logsexp_IgEG1 = sprintf('Single exponential fits (IgG1/E combined): s.s.e. = %.2f, AIC = %.3g',[error_x_opt_logsexp_IgEG1,AIC_opt_logsexp_IgEG1]);

%%% Plot Results
    f3 = figure;
    f3.Units = 'inches';
    f3.OuterPosition = [0 0 15 10];
    sgtitle(titlestr_logsexp_IgEG1,'FontWeight','Bold','FontSize',18)
    f3d = subplot(224);
    errorbar(tdata,logydata_mean_hCD4_IgE_BM,logydata_sem_hCD4_IgE_BM,'bo','LineWidth',2,'MarkerSize',10)
    hold on 
    plot(tgrid(1:(nogridpoints-2))+2,logyfit_logsexp_IgE_BM,'k--','LineWidth',2,'MarkerSize',10)
    hold off
    title(titlestr_logsexp_IgE_BM, 'FontWeight','Normal','FontSize',16)
    f3d.TitleHorizontalAlignment = 'left';
    axis([t0 tf 0.5 5.5])
    yticks(gca,[1 2 3 4 5])
    legend('data', 'model fit')
    text(50,5,sprintf('s.s.e. = %.2f\nAIC = %.3g',[error_x_opt_logsexp_IgEG1_BM,AIC_opt_logsexp_IgEG1_BM]),'FontSize', 16)
    xlabel('time (days)')
    ylabel('log_{10}(hCD4+)')
    set(gca,'FontSize',16)
    
    f3c = subplot(223);
    errorbar(tdata,logydata_mean_hCD4_IgE_SL,logydata_sem_hCD4_IgE_SL,'bo','LineWidth',2,'MarkerSize',10)
    hold on 
    plot(tgrid(1:(nogridpoints-2))+2,logyfit_logsexp_IgE_SL,'k--','LineWidth',2,'MarkerSize',10)
    hold off
    title(titlestr_logsexp_IgE_SL, 'FontWeight','Normal','FontSize',16)
    f3c.TitleHorizontalAlignment = 'left';
    axis([t0 tf 0.5 5.5])
    yticks(gca,[1 2 3 4 5])
    legend('data', 'model fit')
    text(50,5,sprintf('s.s.e. = %.2f\nAIC = %.3g',[error_x_opt_logsexp_IgEG1_SL,AIC_opt_logsexp_IgEG1_SL]),'FontSize', 16)
    xlabel('time (days)')
    ylabel('log_{10}(hCD4+)')
    set(gca,'FontSize',16)
    
    f3b = subplot(222);
    errorbar(tdata,logydata_mean_hCD4_IgG1_BM,logydata_sem_hCD4_IgG1_BM,'bo','LineWidth',2,'MarkerSize',10)
    hold on 
    plot(tgrid(1:(nogridpoints-2))+2,logyfit_logsexp_IgG1_BM,'k--','LineWidth',2,'MarkerSize',10)
    hold off
    title(titlestr_logsexp_IgG1_BM, 'FontWeight','Normal','FontSize',16)
    f3b.TitleHorizontalAlignment = 'left';
    axis([t0 tf 0.5 5.5])
    yticks(gca,[1 2 3 4 5])
    legend('data', 'model fit')
    text(50,5,sprintf('s.s.e. = %.2f\nAIC = %.3g',[error_x_opt_logsexp_IgEG1_BM,AIC_opt_logsexp_IgEG1_BM]),'FontSize', 16)
    xlabel('time (days)')
    ylabel('log_{10}(hCD4+)')
    set(gca,'FontSize',16)
    
    f3a = subplot(221);
    errorbar(tdata,logydata_mean_hCD4_IgG1_SL,logydata_sem_hCD4_IgG1_SL,'bo','LineWidth',2,'MarkerSize',10)
    hold on 
    plot(tgrid(1:(nogridpoints-2))+2,logyfit_logsexp_IgG1_SL,'k--','LineWidth',2,'MarkerSize',10)
    hold off
    title(titlestr_logsexp_IgG1_SL, 'FontWeight','Normal','FontSize',16)
    f3a.TitleHorizontalAlignment = 'left';
    axis([t0 tf 0.5 5.5])
    yticks(gca,[1 2 3 4 5])
    legend('data', 'model fit')
    text(50,5,sprintf('s.s.e. = %.2f\nAIC = %.3g',[error_x_opt_logsexp_IgEG1_SL,AIC_opt_logsexp_IgEG1_SL]),'FontSize', 16)
    xlabel('time (days)')
    ylabel('log_{10}(hCD4+)')
    set(gca,'FontSize',16)

    %%Fits to all four data sets simultaneously SLT/BM and IgG1/E
    error_x_opt_logsexp_IgEG1_BMSL = error_x_opt_logsexp_IgEG1_BMSL_bootstrap(1);
    x_opt_logsexp_IgEG1_BMSL = x_opt_logsexp_IgEG1_BMSL_bootstrap(1,:);
    x_opt_logsexp_IgEG1_BMSL_bootstrap_thalf = x_opt_logsexp_IgEG1_BMSL_bootstrap;
    x_opt_logsexp_IgEG1_BMSL_bootstrap_thalf(:,5) = log(2)./x_opt_logsexp_IgEG1_BMSL_bootstrap_thalf(:,5);
    logyfit_logsexp_IgEG1_BMSL = logsingleexp_survival_fourdatasets(x_opt_logsexp_IgEG1_BMSL,tgrid(1:(nogridpoints-2)));
    logyfit_logsexp_IgE_BM = logyfit_logsexp_IgEG1_BMSL(1:(nogridpoints-2));
    logyfit_logsexp_IgG1_BM = logyfit_logsexp_IgEG1_BMSL((nogridpoints-2)+1:2*(nogridpoints-2));
    logyfit_logsexp_IgE_SL = logyfit_logsexp_IgEG1_BMSL(2*(nogridpoints-2)+1:3*(nogridpoints-2));
    logyfit_logsexp_IgG1_SL = logyfit_logsexp_IgEG1_BMSL(3*(nogridpoints-2)+1:4*(nogridpoints-2));
    y0_opt_logsexp_IgE_BM = x_opt_logsexp_IgEG1_BMSL(1);
    y0_opt_logsexp_IgG1_BM = x_opt_logsexp_IgEG1_BMSL(2);
    y0_opt_logsexp_IgE_SL = x_opt_logsexp_IgEG1_BMSL(3);
    y0_opt_logsexp_IgG1_SL = x_opt_logsexp_IgEG1_BMSL(4);
    thalf_opt_logsexp_IgEG1_BMSL = log(2)/x_opt_logsexp_IgEG1_BMSL(5);
    titlestr_logsexp_IgE_BM = sprintf('IgE BM: y_{0} = %.1e, t_1 = %.1f',[y0_opt_logsexp_IgE_BM,thalf_opt_logsexp_IgEG1_BMSL]);
    titlestr_logsexp_IgG1_BM = sprintf('IgG1 BM: y_{0} = %.1e, t_1 = %.1f',[y0_opt_logsexp_IgG1_BM,thalf_opt_logsexp_IgEG1_BMSL]);
    titlestr_logsexp_IgE_SL = sprintf('IgE SLT: y_{0} = %.1e, t_1 = %.1f',[y0_opt_logsexp_IgE_SL,thalf_opt_logsexp_IgEG1_BMSL]);
    titlestr_logsexp_IgG1_SL = sprintf('IgG1 SLT: y_{0} = %.1e, t_1 = %.1f',[y0_opt_logsexp_IgG1_SL,thalf_opt_logsexp_IgEG1_BMSL]);

    AIC_opt_logsexp_IgEG1_BMSL = aic(length(x_opt_logsexp_IgEG1_BMSL),4*nodatapoints,error_x_opt_logsexp_IgEG1_BMSL);
    titlestr_logsexp_IgEG1_BMSL = sprintf('Single exponential fits (SLT/BM and IgG1/E combined): s.s.e. = %.2f, AIC = %.3g',[error_x_opt_logsexp_IgEG1_BMSL,AIC_opt_logsexp_IgEG1_BMSL]);

%%% Plot Results
    f4 = figure;
    f4.Units = 'inches';
    f4.OuterPosition = [0 0 15 10];
    sgtitle(titlestr_logsexp_IgEG1_BMSL,'FontWeight','Bold','FontSize',18)
    f4d = subplot(224);
    errorbar(tdata,logydata_mean_hCD4_IgE_BM,logydata_sem_hCD4_IgE_BM,'bo','LineWidth',2,'MarkerSize',10)
    hold on 
    plot(tgrid(1:(nogridpoints-2))+2,logyfit_logsexp_IgE_BM,'k--','LineWidth',2,'MarkerSize',10)
    hold off
    title(titlestr_logsexp_IgE_BM, 'FontWeight','Normal','FontSize',16)
    f4d.TitleHorizontalAlignment = 'left';
    axis([t0 tf 0.5 5.5])
    yticks(gca,[1 2 3 4 5])
    legend('data', 'model fit')
    text(50,5,sprintf('s.s.e. = %.2f\nAIC = %.3g',[error_x_opt_logsexp_IgEG1_BMSL,AIC_opt_logsexp_IgEG1_BMSL]),'FontSize', 16)
    xlabel('time (days)')
    ylabel('log_{10}(hCD4+)')
    set(gca,'FontSize',16)
    
    f4c = subplot(223);
    errorbar(tdata,logydata_mean_hCD4_IgE_SL,logydata_sem_hCD4_IgE_SL,'bo','LineWidth',2,'MarkerSize',10)
    hold on 
    plot(tgrid(1:(nogridpoints-2))+2,logyfit_logsexp_IgE_SL,'k--','LineWidth',2,'MarkerSize',10)
    hold off
    title(titlestr_logsexp_IgE_SL, 'FontWeight','Normal','FontSize',16)
    f4c.TitleHorizontalAlignment = 'left';
    axis([t0 tf 0.5 5.5])
    yticks(gca,[1 2 3 4 5])
    legend('data', 'model fit')
    text(50,5,sprintf('s.s.e. = %.2f\nAIC = %.3g',[error_x_opt_logsexp_IgEG1_BMSL,AIC_opt_logsexp_IgEG1_BMSL]),'FontSize', 16)
    xlabel('time (days)')
    ylabel('log_{10}(hCD4+)')
    set(gca,'FontSize',16)
    
    f4b = subplot(222);
    errorbar(tdata,logydata_mean_hCD4_IgG1_BM,logydata_sem_hCD4_IgG1_BM,'bo','LineWidth',2,'MarkerSize',10)
    hold on 
    plot(tgrid(1:(nogridpoints-2))+2,logyfit_logsexp_IgG1_BM,'k--','LineWidth',2,'MarkerSize',10)
    hold off
    title(titlestr_logsexp_IgG1_BM, 'FontWeight','Normal','FontSize',16)
    f4b.TitleHorizontalAlignment = 'left';
    axis([t0 tf 0.5 5.5])
    yticks(gca,[1 2 3 4 5])
    legend('data', 'model fit')
    text(50,5,sprintf('s.s.e. = %.2f\nAIC = %.3g',[error_x_opt_logsexp_IgEG1_BMSL,AIC_opt_logsexp_IgEG1_BMSL]),'FontSize', 16)
    xlabel('time (days)')
    ylabel('log_{10}(hCD4+)')
    set(gca,'FontSize',16)
    
    f4a = subplot(221);
    errorbar(tdata,logydata_mean_hCD4_IgG1_SL,logydata_sem_hCD4_IgG1_SL,'bo','LineWidth',2,'MarkerSize',10)
    hold on 
    plot(tgrid(1:(nogridpoints-2))+2,logyfit_logsexp_IgG1_SL,'k--','LineWidth',2,'MarkerSize',10)
    hold off
    title(titlestr_logsexp_IgG1_SL, 'FontWeight','Normal','FontSize',16)
    f4a.TitleHorizontalAlignment = 'left';
    axis([t0 tf 0.5 5.5])
    yticks(gca,[1 2 3 4 5])
    legend('data', 'model fit')
    text(50,5,sprintf('s.s.e. = %.2f\nAIC = %.3g',[error_x_opt_logsexp_IgEG1_BMSL,AIC_opt_logsexp_IgEG1_BMSL]),'FontSize', 16)
    xlabel('time (days)')
    ylabel('log_{10}(hCD4+)')
    set(gca,'FontSize',16)

%%%% SINGLE EXPONENTIAL WITH OFFSET MODEL

%%% Individual fits to each IgG1/E and SLT/BM data set
    error_x_opt_logsexpoffset_IgE_BM = error_x_opt_logsexpoffset_IgE_BM_bootstrap(1);
    x_opt_logsexpoffset_IgE_BM = x_opt_logsexpoffset_IgE_BM_bootstrap(1,:);
    x_opt_logsexpoffset_IgE_BM_bootstrap_thalf = x_opt_logsexpoffset_IgE_BM_bootstrap;
    x_opt_logsexpoffset_IgE_BM_bootstrap_thalf(:,3) = log(2)./x_opt_logsexpoffset_IgE_BM_bootstrap_thalf(:,3);
    logyfit_logsexpoffset_IgE_BM = logsingleexpoffset_survival(x_opt_logsexpoffset_IgE_BM,tgrid(1:(nogridpoints-2)));
    y0_opt_logsexpoffset_IgE_BM = x_opt_logsexpoffset_IgE_BM(1);
    f_opt_logsexpoffset_IgE_BM = x_opt_logsexpoffset_IgE_BM(2);
    thalf_opt_logsexpoffset_IgE_BM = log(2)/x_opt_logsexpoffset_IgE_BM(3);
    AIC_opt_logsexpoffset_IgE_BM = aic(length(x_opt_logsexpoffset_IgE_BM),nodatapoints,error_x_opt_logsexpoffset_IgE_BM);
    titlestr_logsexpoffset_IgE_BM = sprintf('IgE BM: y_{0} = %.1e, f _{LL} = %.2f, t_1 = %.1f',[y0_opt_logsexpoffset_IgE_BM,1-f_opt_logsexpoffset_IgE_BM,thalf_opt_logsexpoffset_IgE_BM]);

    error_x_opt_logsexpoffset_IgG1_BM = error_x_opt_logsexpoffset_IgG1_BM_bootstrap(1);
    x_opt_logsexpoffset_IgG1_BM = x_opt_logsexpoffset_IgG1_BM_bootstrap(1,:);
    x_opt_logsexpoffset_IgG1_BM_bootstrap_thalf = x_opt_logsexpoffset_IgG1_BM_bootstrap;
    x_opt_logsexpoffset_IgG1_BM_bootstrap_thalf(:,3) = log(2)./x_opt_logsexpoffset_IgG1_BM_bootstrap_thalf(:,3);
    logyfit_logsexpoffset_IgG1_BM = logsingleexpoffset_survival(x_opt_logsexpoffset_IgG1_BM,tgrid(1:(nogridpoints-2)));
    y0_opt_logsexpoffset_IgG1_BM = x_opt_logsexpoffset_IgG1_BM(1);
    f_opt_logsexpoffset_IgG1_BM = x_opt_logsexpoffset_IgG1_BM(2);
    thalf_opt_logsexpoffset_IgG1_BM = log(2)/x_opt_logsexpoffset_IgG1_BM(3);
    AIC_opt_logsexpoffset_IgG1_BM = aic(length(x_opt_logsexpoffset_IgG1_BM),nodatapoints,error_x_opt_logsexpoffset_IgG1_BM);
    titlestr_logsexpoffset_IgG1_BM = sprintf('IgG1 BM: y_{0} = %.1e, f _{LL} = %.2f, t_1 = %.1f',[y0_opt_logsexpoffset_IgG1_BM,1-f_opt_logsexpoffset_IgG1_BM,thalf_opt_logsexpoffset_IgG1_BM]);

    error_x_opt_logsexpoffset_IgE_SL = error_x_opt_logsexpoffset_IgE_SL_bootstrap(1);
    x_opt_logsexpoffset_IgE_SL = x_opt_logsexpoffset_IgE_SL_bootstrap(1,:);
    x_opt_logsexpoffset_IgE_SL_bootstrap_thalf = x_opt_logsexpoffset_IgE_SL_bootstrap;
    x_opt_logsexpoffset_IgE_SL_bootstrap_thalf(:,3) = log(2)./x_opt_logsexpoffset_IgE_SL_bootstrap_thalf(:,3);
    logyfit_logsexpoffset_IgE_SL = logsingleexpoffset_survival(x_opt_logsexpoffset_IgE_SL,tgrid(1:(nogridpoints-2)));
    y0_opt_logsexpoffset_IgE_SL = x_opt_logsexpoffset_IgE_SL(1);
    f_opt_logsexpoffset_IgE_SL = x_opt_logsexpoffset_IgE_SL(2);
    thalf_opt_logsexpoffset_IgE_SL = log(2)/x_opt_logsexpoffset_IgE_SL(3);
    AIC_opt_logsexpoffset_IgE_SL = aic(length(x_opt_logsexpoffset_IgE_SL),nodatapoints,error_x_opt_logsexpoffset_IgE_SL);
    titlestr_logsexpoffset_IgE_SL = sprintf('IgE SLT: y_{0} = %.1e, f _{LL} = %.2f, t_1 = %.1f',[y0_opt_logsexpoffset_IgE_SL,1-f_opt_logsexpoffset_IgE_SL,thalf_opt_logsexpoffset_IgE_SL]);

    error_x_opt_logsexpoffset_IgG1_SL = error_x_opt_logsexpoffset_IgG1_SL_bootstrap(1);
    x_opt_logsexpoffset_IgG1_SL = x_opt_logsexpoffset_IgG1_SL_bootstrap(1,:);
    x_opt_logsexpoffset_IgG1_SL_bootstrap_thalf = x_opt_logsexpoffset_IgG1_SL_bootstrap;
    x_opt_logsexpoffset_IgG1_SL_bootstrap_thalf(:,3) = log(2)./x_opt_logsexpoffset_IgG1_SL_bootstrap_thalf(:,3);
    logyfit_logsexpoffset_IgG1_SL = logsingleexpoffset_survival(x_opt_logsexpoffset_IgG1_SL,tgrid(1:(nogridpoints-2)));
    y0_opt_logsexpoffset_IgG1_SL = x_opt_logsexpoffset_IgG1_SL(1);
    f_opt_logsexpoffset_IgG1_SL = x_opt_logsexpoffset_IgG1_SL(2);
    thalf_opt_logsexpoffset_IgG1_SL = log(2)/x_opt_logsexpoffset_IgG1_SL(3);
    AIC_opt_logsexpoffset_IgG1_SL = aic(length(x_opt_logsexpoffset_IgG1_SL),nodatapoints,error_x_opt_logsexpoffset_IgG1_SL);
    titlestr_logsexpoffset_IgG1_SL = sprintf('IgG1 SLT: y_{0} = %.1e, f _{LL} = %.2f, t_1 = %.1f',[y0_opt_logsexpoffset_IgG1_SL,1-f_opt_logsexpoffset_IgG1_SL,thalf_opt_logsexpoffset_IgG1_SL]);
    
    error_x_opt_logsexpoffset = error_x_opt_logsexpoffset_IgE_BM + error_x_opt_logsexpoffset_IgG1_BM + error_x_opt_logsexpoffset_IgE_SL + error_x_opt_logsexpoffset_IgG1_SL;
    AIC_opt_logsexpoffset = aic(length(x_opt_logsexpoffset_IgE_BM)+length(x_opt_logsexpoffset_IgE_SL)+length(x_opt_logsexpoffset_IgG1_BM)+length(x_opt_logsexpoffset_IgG1_SL),4*nodatapoints,error_x_opt_logsexpoffset);
    titlestr_logsexpoffset = sprintf('Single exponential offset fits: s.s.e. = %.2f, AIC = %.3g',[error_x_opt_logsexpoffset,AIC_opt_logsexpoffset]);

%%% Plot Results
    f5 = figure;
    f5.Units = 'inches';
    f5.OuterPosition = [0 0 15 10];
    sgtitle(titlestr_logsexpoffset,'FontWeight','Bold','FontSize',18)
    f5d = subplot(224);
    errorbar(tdata,logydata_mean_hCD4_IgE_BM,logydata_sem_hCD4_IgE_BM,'bo','LineWidth',2,'MarkerSize',10)
    hold on 
    plot(tgrid(1:(nogridpoints-2))+2,logyfit_logsexpoffset_IgE_BM,'k--','LineWidth',2,'MarkerSize',10)
    hold off
    title(titlestr_logsexpoffset_IgE_BM, 'FontWeight','Normal','FontSize',16)
    f5d.TitleHorizontalAlignment = 'left';
    axis([t0 tf 0.5 5.5])
    yticks(gca,[1 2 3 4 5])
    legend('data', 'model fit')
    text(50,5,sprintf('s.s.e. = %.2f\nAIC = %.3g',[error_x_opt_logsexpoffset_IgE_BM,AIC_opt_logsexpoffset_IgE_BM]),'FontSize', 16)
    xlabel('time (days)')
    ylabel('log_{10}(hCD4+)')
    set(gca,'FontSize',16)
    
    f5c = subplot(223);
    errorbar(tdata,logydata_mean_hCD4_IgE_SL,logydata_sem_hCD4_IgE_SL,'bo','LineWidth',2,'MarkerSize',10)
    hold on 
    plot(tgrid(1:(nogridpoints-2))+2,logyfit_logsexpoffset_IgE_SL,'k--','LineWidth',2,'MarkerSize',10)
    hold off
    title(titlestr_logsexpoffset_IgE_SL, 'FontWeight','Normal','FontSize',16)
    f5c.TitleHorizontalAlignment = 'left';
    axis([t0 tf 0.5 5.5])
    yticks(gca,[1 2 3 4 5])
    legend('data', 'model fit')
    text(50,5,sprintf('s.s.e. = %.2f\nAIC = %.3g',[error_x_opt_logsexpoffset_IgE_SL,AIC_opt_logsexpoffset_IgE_SL]),'FontSize', 16)
    xlabel('time (days)')
    ylabel('log_{10}(hCD4+)')
    set(gca,'FontSize',16)
    
    f5b = subplot(222);
    errorbar(tdata,logydata_mean_hCD4_IgG1_BM,logydata_sem_hCD4_IgG1_BM,'bo','LineWidth',2,'MarkerSize',10)
    hold on 
    plot(tgrid(1:(nogridpoints-2))+2,logyfit_logsexpoffset_IgG1_BM,'k--','LineWidth',2,'MarkerSize',10)
    hold off
    title(titlestr_logsexpoffset_IgG1_BM, 'FontWeight','Normal','FontSize',16)
    f5b.TitleHorizontalAlignment = 'left';
    axis([t0 tf 0.5 5.5])
    yticks(gca,[1 2 3 4 5])
    legend('data', 'model fit')
    text(50,5,sprintf('s.s.e. = %.2f\nAIC = %.3g',[error_x_opt_logsexpoffset_IgG1_BM,AIC_opt_logsexpoffset_IgG1_BM]),'FontSize', 16)
    xlabel('time (days)')
    ylabel('log_{10}(hCD4+)')
    set(gca,'FontSize',16)
    
    f5a = subplot(221);
    errorbar(tdata,logydata_mean_hCD4_IgG1_SL,logydata_sem_hCD4_IgG1_SL,'bo','LineWidth',2,'MarkerSize',10)
    hold on 
    plot(tgrid(1:(nogridpoints-2))+2,logyfit_logsexpoffset_IgG1_SL,'k--','LineWidth',2,'MarkerSize',10)
    hold off
    title(titlestr_logsexpoffset_IgG1_SL, 'FontWeight','Normal','FontSize',16)
    f5a.TitleHorizontalAlignment = 'left';
    axis([t0 tf 0.5 5.5])
    yticks(gca,[1 2 3 4 5])
    legend('data', 'model fit')
    text(50,5,sprintf('s.s.e. = %.2f\nAIC = %.3g',[error_x_opt_logsexpoffset_IgG1_SL,AIC_opt_logsexpoffset_IgG1_SL]),'FontSize', 16)
    xlabel('time (days)')
    ylabel('log_{10}(hCD4+)')
    set(gca,'FontSize',16)

%%% Fits to IgE combined SLT/BM and IgG1 combined SLT/BM
    error_x_opt_logsexpoffset_IgE_BMSL = error_x_opt_logsexpoffset_IgE_BMSL_bootstrap(1);
    x_opt_logsexpoffset_IgE_BMSL = x_opt_logsexpoffset_IgE_BMSL_bootstrap(1,:);
    x_opt_logsexpoffset_IgE_BMSL_bootstrap_thalf = x_opt_logsexpoffset_IgE_BMSL_bootstrap;
    x_opt_logsexpoffset_IgE_BMSL_bootstrap_thalf(:,5) = log(2)./x_opt_logsexpoffset_IgE_BMSL_bootstrap_thalf(:,5);
    logyfit_logsexpoffset_IgE_BMSL = logsingleexpoffset_survival_twodatasets(x_opt_logsexpoffset_IgE_BMSL,tgrid(1:(nogridpoints-2)));
    logyfit_logsexpoffset_IgE_BM = logyfit_logsexpoffset_IgE_BMSL(1:(nogridpoints-2));
    logyfit_logsexpoffset_IgE_SL = logyfit_logsexpoffset_IgE_BMSL((nogridpoints-2)+1:2*(nogridpoints-2));
    y0_opt_logsexpoffset_IgE_BM = x_opt_logsexpoffset_IgE_BMSL(1);
    y0_opt_logsexpoffset_IgE_SL = x_opt_logsexpoffset_IgE_BMSL(2);
    f_opt_logsexpoffset_IgE_BM = x_opt_logsexpoffset_IgE_BMSL(3);
    f_opt_logsexpoffset_IgE_SL = x_opt_logsexpoffset_IgE_BMSL(4);
    thalf_opt_logsexpoffset_IgE_BMSL = log(2)/x_opt_logsexpoffset_IgE_BMSL(5);
    AIC_opt_logsexpoffset_IgE_BMSL = aic(length(x_opt_logsexpoffset_IgE_BMSL),2*nodatapoints,error_x_opt_logsexpoffset_IgE_BMSL);
    titlestr_logsexpoffset_IgE_BM = sprintf('IgE BM: y_{0} = %.1e, f _{LL} = %.2f, t_1 = %.1f',[y0_opt_logsexpoffset_IgE_BM,1-f_opt_logsexpoffset_IgE_BM,thalf_opt_logsexpoffset_IgE_BMSL]);
    titlestr_logsexpoffset_IgE_SL = sprintf('IgE SLT: y_{0} = %.1e, f _{LL} = %.2f, t_1 = %.1f',[y0_opt_logsexpoffset_IgE_SL,1-f_opt_logsexpoffset_IgE_SL,thalf_opt_logsexpoffset_IgE_BMSL]);

    error_x_opt_logsexpoffset_IgG1_BMSL = error_x_opt_logsexpoffset_IgG1_BMSL_bootstrap(1);
    x_opt_logsexpoffset_IgG1_BMSL = x_opt_logsexpoffset_IgG1_BMSL_bootstrap(1,:);
    x_opt_logsexpoffset_IgG1_BMSL_bootstrap_thalf = x_opt_logsexpoffset_IgG1_BMSL_bootstrap;
    x_opt_logsexpoffset_IgG1_BMSL_bootstrap_thalf(:,5) = log(2)./x_opt_logsexpoffset_IgG1_BMSL_bootstrap_thalf(:,5);
    logyfit_logsexpoffset_IgG1_BMSL = logsingleexpoffset_survival_twodatasets(x_opt_logsexpoffset_IgG1_BMSL,tgrid(1:(nogridpoints-2)));
    logyfit_logsexpoffset_IgG1_BM = logyfit_logsexpoffset_IgG1_BMSL(1:(nogridpoints-2));
    logyfit_logsexpoffset_IgG1_SL = logyfit_logsexpoffset_IgG1_BMSL((nogridpoints-2)+1:2*(nogridpoints-2));
    y0_opt_logsexpoffset_IgG1_BM = x_opt_logsexpoffset_IgG1_BMSL(1);
    y0_opt_logsexpoffset_IgG1_SL = x_opt_logsexpoffset_IgG1_BMSL(2);
    f_opt_logsexpoffset_IgG1_BM = x_opt_logsexpoffset_IgG1_BMSL(3);
    f_opt_logsexpoffset_IgG1_SL = x_opt_logsexpoffset_IgG1_BMSL(4);
    thalf_opt_logsexpoffset_IgG1_BMSL = log(2)/x_opt_logsexpoffset_IgG1_BMSL(5);
    AIC_opt_logsexpoffset_IgG1_BMSL = aic(length(x_opt_logsexpoffset_IgG1_BMSL),2*nodatapoints,error_x_opt_logsexpoffset_IgG1_BMSL);
    titlestr_logsexpoffset_IgG1_BM = sprintf('IgG1 BM: y_{0} = %.1e, f _{LL} = %.2f, t_1 = %.1f',[y0_opt_logsexpoffset_IgG1_BM,1-f_opt_logsexpoffset_IgG1_BM,thalf_opt_logsexpoffset_IgG1_BMSL]);
    titlestr_logsexpoffset_IgG1_SL = sprintf('IgG1 SLT: y_{0} = %.1e, f _{LL} = %.2f, t_1 = %.1f',[y0_opt_logsexpoffset_IgG1_SL,1-f_opt_logsexpoffset_IgG1_SL,thalf_opt_logsexpoffset_IgG1_BMSL]);

    error_x_opt_logsexpoffset_BMSL = error_x_opt_logsexpoffset_IgE_BMSL + error_x_opt_logsexpoffset_IgG1_BMSL;
    AIC_opt_logsexpoffset_BMSL = aic(length(x_opt_logsexpoffset_IgE_BMSL)+length(x_opt_logsexpoffset_IgG1_BMSL),4*nodatapoints,error_x_opt_logsexpoffset_BMSL);
    titlestr_logsexpoffset_BMSL = sprintf('Single exponential offset fits (SLT/BM combined): s.s.e. = %.2f, AIC = %.3g',[error_x_opt_logsexpoffset_BMSL,AIC_opt_logsexpoffset_BMSL]);

%%% Plot Results
    f6 = figure;
    f6.Units = 'inches';
    f6.OuterPosition = [0 0 15 10];
    sgtitle(titlestr_logsexpoffset_BMSL,'FontWeight','Bold','FontSize',18)
    f6d = subplot(224);
    errorbar(tdata,logydata_mean_hCD4_IgE_BM,logydata_sem_hCD4_IgE_BM,'bo','LineWidth',2,'MarkerSize',10)
    hold on 
    plot(tgrid(1:(nogridpoints-2))+2,logyfit_logsexpoffset_IgE_BM,'k--','LineWidth',2,'MarkerSize',10)
    hold off
    title(titlestr_logsexpoffset_IgE_BM, 'FontWeight','Normal','FontSize',16)
    f6d.TitleHorizontalAlignment = 'left';
    axis([t0 tf 0.5 5.5])
    yticks(gca,[1 2 3 4 5])
    legend('data', 'model fit')
    text(50,5,sprintf('s.s.e. = %.2f\nAIC = %.3g',[error_x_opt_logsexpoffset_IgE_BMSL,AIC_opt_logsexpoffset_IgE_BMSL]),'FontSize', 16)
    xlabel('time (days)')
    ylabel('log_{10}(hCD4+)')
    set(gca,'FontSize',16)
    
    f6c = subplot(223);
    errorbar(tdata,logydata_mean_hCD4_IgE_SL,logydata_sem_hCD4_IgE_SL,'bo','LineWidth',2,'MarkerSize',10)
    hold on 
    plot(tgrid(1:(nogridpoints-2))+2,logyfit_logsexpoffset_IgE_SL,'k--','LineWidth',2,'MarkerSize',10)
    hold off
    title(titlestr_logsexpoffset_IgE_SL, 'FontWeight','Normal','FontSize',16)
    f6c.TitleHorizontalAlignment = 'left';
    axis([t0 tf 0.5 5.5])
    yticks(gca,[1 2 3 4 5])
    legend('data', 'model fit')
    text(50,5,sprintf('s.s.e. = %.2f\nAIC = %.3g',[error_x_opt_logsexpoffset_IgE_BMSL,AIC_opt_logsexpoffset_IgE_BMSL]),'FontSize', 16)
    xlabel('time (days)')
    ylabel('log_{10}(hCD4+)')
    set(gca,'FontSize',16)
    
    f6b = subplot(222);
    errorbar(tdata,logydata_mean_hCD4_IgG1_BM,logydata_sem_hCD4_IgG1_BM,'bo','LineWidth',2,'MarkerSize',10)
    hold on 
    plot(tgrid(1:(nogridpoints-2))+2,logyfit_logsexpoffset_IgG1_BM,'k--','LineWidth',2,'MarkerSize',10)
    hold off
    title(titlestr_logsexpoffset_IgG1_BM, 'FontWeight','Normal','FontSize',16)
    f6b.TitleHorizontalAlignment = 'left';
    axis([t0 tf 0.5 5.5])
    yticks(gca,[1 2 3 4 5])
    legend('data', 'model fit')
    text(50,5,sprintf('s.s.e. = %.2f\nAIC = %.3g',[error_x_opt_logsexpoffset_IgG1_BMSL,AIC_opt_logsexpoffset_IgG1_BMSL]),'FontSize', 16)
    xlabel('time (days)')
    ylabel('log_{10}(hCD4+)')
    set(gca,'FontSize',16)
    
    f6a = subplot(221);
    errorbar(tdata,logydata_mean_hCD4_IgG1_SL,logydata_sem_hCD4_IgG1_SL,'bo','LineWidth',2,'MarkerSize',10)
    hold on 
    plot(tgrid(1:(nogridpoints-2))+2,logyfit_logsexpoffset_IgG1_SL,'k--','LineWidth',2,'MarkerSize',10)
    hold off
    title(titlestr_logsexpoffset_IgG1_SL, 'FontWeight','Normal','FontSize',16)
    f6a.TitleHorizontalAlignment = 'left';
    axis([t0 tf 0.5 5.5])
    yticks(gca,[1 2 3 4 5])
    legend('data', 'model fit')
    text(50,5,sprintf('s.s.e. = %.2f\nAIC = %.3g',[error_x_opt_logsexpoffset_IgG1_BMSL,AIC_opt_logsexpoffset_IgG1_BMSL]),'FontSize', 16)
    xlabel('time (days)')
    ylabel('log_{10}(hCD4+)')
    set(gca,'FontSize',16)

    %%Fits to BM combined IgG1/E and SL combined IgG1/E
    error_x_opt_logsexpoffset_IgEG1_BM = error_x_opt_logsexpoffset_IgEG1_BM_bootstrap(1);
    x_opt_logsexpoffset_IgEG1_BM = x_opt_logsexpoffset_IgEG1_BM_bootstrap(1,:);
    x_opt_logsexpoffset_IgEG1_BM_bootstrap_thalf = x_opt_logsexpoffset_IgEG1_BM_bootstrap;
    x_opt_logsexpoffset_IgEG1_BM_bootstrap_thalf(:,5) = log(2)./x_opt_logsexpoffset_IgEG1_BM_bootstrap_thalf(:,5);
    logyfit_logsexpoffset_IgEG1_BM = logsingleexpoffset_survival_twodatasets(x_opt_logsexpoffset_IgEG1_BM,tgrid(1:(nogridpoints-2)));
    logyfit_logsexpoffset_IgE_BM = logyfit_logsexpoffset_IgEG1_BM(1:(nogridpoints-2));
    logyfit_logsexpoffset_IgG1_BM = logyfit_logsexpoffset_IgEG1_BM((nogridpoints-2)+1:2*(nogridpoints-2));
    y0_opt_logsexpoffset_IgE_BM = x_opt_logsexpoffset_IgEG1_BM(1);
    y0_opt_logsexpoffset_IgG1_BM = x_opt_logsexpoffset_IgEG1_BM(2);
    f_opt_logsexpoffset_IgE_BM = x_opt_logsexpoffset_IgEG1_BM(3);
    f_opt_logsexpoffset_IgG1_BM = x_opt_logsexpoffset_IgEG1_BM(4);
    thalf_opt_logsexpoffset_IgEG1_BM = log(2)/x_opt_logsexpoffset_IgEG1_BM(5);
    AIC_opt_logsexpoffset_IgEG1_BM = aic(length(x_opt_logsexpoffset_IgEG1_BM),2*nodatapoints,error_x_opt_logsexpoffset_IgEG1_BM);
    titlestr_logsexpoffset_IgE_BM = sprintf('IgE BM: y_{0} = %.1e, f _{LL} = %.2f, t_1 = %.1f',[y0_opt_logsexpoffset_IgE_BM,1-f_opt_logsexpoffset_IgE_BM,thalf_opt_logsexpoffset_IgEG1_BM]);
    titlestr_logsexpoffset_IgG1_BM = sprintf('IgG1 BM: y_{0} = %.1e, f _{LL} = %.2f, t_1 = %.1f',[y0_opt_logsexpoffset_IgG1_BM,1-f_opt_logsexpoffset_IgG1_BM,thalf_opt_logsexpoffset_IgEG1_BM]);

    error_x_opt_logsexpoffset_IgEG1_SL = error_x_opt_logsexpoffset_IgEG1_SL_bootstrap(1);
    x_opt_logsexpoffset_IgEG1_SL = x_opt_logsexpoffset_IgEG1_SL_bootstrap(1,:);
    x_opt_logsexpoffset_IgEG1_SL_bootstrap_thalf = x_opt_logsexpoffset_IgEG1_SL_bootstrap;
    x_opt_logsexpoffset_IgEG1_SL_bootstrap_thalf(:,5) = log(2)./x_opt_logsexpoffset_IgEG1_SL_bootstrap_thalf(:,5);
    logyfit_logsexpoffset_IgEG1_SL = logsingleexpoffset_survival_twodatasets(x_opt_logsexpoffset_IgEG1_SL,tgrid(1:(nogridpoints-2)));
    logyfit_logsexpoffset_IgE_SL = logyfit_logsexpoffset_IgEG1_SL(1:(nogridpoints-2));
    logyfit_logsexpoffset_IgG1_SL = logyfit_logsexpoffset_IgEG1_SL((nogridpoints-2)+1:2*(nogridpoints-2));
    y0_opt_logsexpoffset_IgE_SL = x_opt_logsexpoffset_IgEG1_SL(1);
    y0_opt_logsexpoffset_IgG1_SL = x_opt_logsexpoffset_IgEG1_SL(2);
    f_opt_logsexpoffset_IgE_SL = x_opt_logsexpoffset_IgEG1_SL(3);
    f_opt_logsexpoffset_IgG1_SL = x_opt_logsexpoffset_IgEG1_SL(4);
    thalf_opt_logsexpoffset_IgEG1_SL = log(2)/x_opt_logsexpoffset_IgEG1_SL(5);
    AIC_opt_logsexpoffset_IgEG1_SL = aic(length(x_opt_logsexpoffset_IgEG1_SL),2*nodatapoints,error_x_opt_logsexpoffset_IgEG1_SL);
    titlestr_logsexpoffset_IgE_SL = sprintf('IgE SLT: y_{0} = %.1e, f _{LL} = %.2f, t_1 = %.1f',[y0_opt_logsexpoffset_IgE_SL,1-f_opt_logsexpoffset_IgE_SL,thalf_opt_logsexpoffset_IgEG1_SL]);
    titlestr_logsexpoffset_IgG1_SL = sprintf('IgG1 SLT: y_{0} = %.1e, f _{LL} = %.2f, t_1 = %.1f',[y0_opt_logsexpoffset_IgG1_SL,1-f_opt_logsexpoffset_IgG1_SL,thalf_opt_logsexpoffset_IgEG1_SL]);

    error_x_opt_logsexpoffset_IgEG1 = error_x_opt_logsexpoffset_IgEG1_BM + error_x_opt_logsexpoffset_IgEG1_SL;
    AIC_opt_logsexpoffset_IgEG1 = aic(length(x_opt_logsexpoffset_IgEG1_BM)+length(x_opt_logsexpoffset_IgEG1_SL),4*nodatapoints,error_x_opt_logsexpoffset_IgEG1);
    titlestr_logsexpoffset_IgEG1 = sprintf('Single exponential offset fits (IgG1/E combined): s.s.e. = %.2f, AIC = %.3g',[error_x_opt_logsexpoffset_IgEG1,AIC_opt_logsexpoffset_IgEG1]);

%%% Plot Results
    f7 = figure;
    f7.Units = 'inches';
    f7.OuterPosition = [0 0 15 10];
    sgtitle(titlestr_logsexpoffset_IgEG1,'FontWeight','Bold','FontSize',18)
    f7d = subplot(224);
    errorbar(tdata,logydata_mean_hCD4_IgE_BM,logydata_sem_hCD4_IgE_BM,'bo','LineWidth',2,'MarkerSize',10)
    hold on 
    plot(tgrid(1:(nogridpoints-2))+2,logyfit_logsexpoffset_IgE_BM,'k--','LineWidth',2,'MarkerSize',10)
    hold off
    title(titlestr_logsexpoffset_IgE_BM, 'FontWeight','Normal','FontSize',16)
    f7d.TitleHorizontalAlignment = 'left';
    axis([t0 tf 0.5 5.5])
    yticks(gca,[1 2 3 4 5])
    legend('data', 'model fit')
    text(50,5,sprintf('s.s.e. = %.2f\nAIC = %.3g',[error_x_opt_logsexpoffset_IgEG1_BM,AIC_opt_logsexpoffset_IgEG1_BM]),'FontSize', 16)
    xlabel('time (days)')
    ylabel('log_{10}(hCD4+)')
    set(gca,'FontSize',16)
    
    f7c = subplot(223);
    errorbar(tdata,logydata_mean_hCD4_IgE_SL,logydata_sem_hCD4_IgE_SL,'bo','LineWidth',2,'MarkerSize',10)
    hold on 
    plot(tgrid(1:(nogridpoints-2))+2,logyfit_logsexpoffset_IgE_SL,'k--','LineWidth',2,'MarkerSize',10)
    hold off
    title(titlestr_logsexpoffset_IgE_SL, 'FontWeight','Normal','FontSize',16)
    f7c.TitleHorizontalAlignment = 'left';
    axis([t0 tf 0.5 5.5])
    yticks(gca,[1 2 3 4 5])
    legend('data', 'model fit')
    text(50,5,sprintf('s.s.e. = %.2f\nAIC = %.3g',[error_x_opt_logsexpoffset_IgEG1_SL,AIC_opt_logsexpoffset_IgEG1_SL]),'FontSize', 16)
    xlabel('time (days)')
    ylabel('log_{10}(hCD4+)')
    set(gca,'FontSize',16)
    
    f7b = subplot(222);
    errorbar(tdata,logydata_mean_hCD4_IgG1_BM,logydata_sem_hCD4_IgG1_BM,'bo','LineWidth',2,'MarkerSize',10)
    hold on 
    plot(tgrid(1:(nogridpoints-2))+2,logyfit_logsexpoffset_IgG1_BM,'k--','LineWidth',2,'MarkerSize',10)
    hold off
    title(titlestr_logsexpoffset_IgG1_BM, 'FontWeight','Normal','FontSize',16)
    f7b.TitleHorizontalAlignment = 'left';
    axis([t0 tf 0.5 5.5])
    yticks(gca,[1 2 3 4 5])
    legend('data', 'model fit')
    text(50,5,sprintf('s.s.e. = %.2f\nAIC = %.3g',[error_x_opt_logsexpoffset_IgEG1_BM,AIC_opt_logsexpoffset_IgEG1_BM]),'FontSize', 16)
    xlabel('time (days)')
    ylabel('log_{10}(hCD4+)')
    set(gca,'FontSize',16)
    
    f7a = subplot(221);
    errorbar(tdata,logydata_mean_hCD4_IgG1_SL,logydata_sem_hCD4_IgG1_SL,'bo','LineWidth',2,'MarkerSize',10)
    hold on 
    plot(tgrid(1:(nogridpoints-2))+2,logyfit_logsexpoffset_IgG1_SL,'k--','LineWidth',2,'MarkerSize',10)
    hold off
    title(titlestr_logsexpoffset_IgG1_SL, 'FontWeight','Normal','FontSize',16)
    f7a.TitleHorizontalAlignment = 'left';
    axis([t0 tf 0.5 5.5])
    yticks(gca,[1 2 3 4 5])
    legend('data', 'model fit')
    text(50,5,sprintf('s.s.e. = %.2f\nAIC = %.3g',[error_x_opt_logsexpoffset_IgEG1_SL,AIC_opt_logsexpoffset_IgEG1_SL]),'FontSize', 16)
    xlabel('time (days)')
    ylabel('log_{10}(hCD4+)')
    set(gca,'FontSize',16)

    %%Fits to all four data sets simultaneously SLT/BM and IgG1/E
    error_x_opt_logsexpoffset_IgEG1_BMSL = error_x_opt_logsexpoffset_IgEG1_BMSL_bootstrap(1);
    x_opt_logsexpoffset_IgEG1_BMSL = x_opt_logsexpoffset_IgEG1_BMSL_bootstrap(1,:);
    x_opt_logsexpoffset_IgEG1_BMSL_bootstrap_thalf = x_opt_logsexpoffset_IgEG1_BMSL_bootstrap;
    x_opt_logsexpoffset_IgEG1_BMSL_bootstrap_thalf(:,9) = log(2)./x_opt_logsexpoffset_IgEG1_BMSL_bootstrap_thalf(:,9);
    logyfit_logsexpoffset_IgEG1_BMSL = logsingleexpoffset_survival_fourdatasets(x_opt_logsexpoffset_IgEG1_BMSL,tgrid(1:(nogridpoints-2)));
    logyfit_logsexpoffset_IgE_BM = logyfit_logsexpoffset_IgEG1_BMSL(1:(nogridpoints-2));
    logyfit_logsexpoffset_IgG1_BM = logyfit_logsexpoffset_IgEG1_BMSL((nogridpoints-2)+1:2*(nogridpoints-2));
    logyfit_logsexpoffset_IgE_SL = logyfit_logsexpoffset_IgEG1_BMSL(2*(nogridpoints-2)+1:3*(nogridpoints-2));
    logyfit_logsexpoffset_IgG1_SL = logyfit_logsexpoffset_IgEG1_BMSL(3*(nogridpoints-2)+1:4*(nogridpoints-2));
    y0_opt_logsexpoffset_IgE_BM = x_opt_logsexpoffset_IgEG1_BMSL(1);
    y0_opt_logsexpoffset_IgG1_BM = x_opt_logsexpoffset_IgEG1_BMSL(2);
    y0_opt_logsexpoffset_IgE_SL = x_opt_logsexpoffset_IgEG1_BMSL(3);
    y0_opt_logsexpoffset_IgG1_SL = x_opt_logsexpoffset_IgEG1_BMSL(4);
    f_opt_logsexpoffset_IgE_BM = x_opt_logsexpoffset_IgEG1_BMSL(5);
    f_opt_logsexpoffset_IgG1_BM = x_opt_logsexpoffset_IgEG1_BMSL(6);
    f_opt_logsexpoffset_IgE_SL = x_opt_logsexpoffset_IgEG1_BMSL(7);
    f_opt_logsexpoffset_IgG1_SL = x_opt_logsexpoffset_IgEG1_BMSL(8);
    thalf_opt_logsexpoffset_IgEG1_BMSL = log(2)/x_opt_logsexpoffset_IgEG1_BMSL(9);
    titlestr_logsexpoffset_IgE_BM = sprintf('IgE BM: y_{0} = %.1e, f _{LL} = %.2f, t_1 = %.1f',[y0_opt_logsexpoffset_IgE_BM,1-f_opt_logsexpoffset_IgE_BM,thalf_opt_logsexpoffset_IgEG1_BMSL]);
    titlestr_logsexpoffset_IgG1_BM = sprintf('IgG1 BM: y_{0} = %.1e, f _{LL} = %.2f, t_1 = %.1f',[y0_opt_logsexpoffset_IgG1_BM,1-f_opt_logsexpoffset_IgG1_BM,thalf_opt_logsexpoffset_IgEG1_BMSL]);
    titlestr_logsexpoffset_IgE_SL = sprintf('IgE SLT: y_{0} = %.1e, f _{LL} = %.2f, t_1 = %.1f',[y0_opt_logsexpoffset_IgE_SL,1-f_opt_logsexpoffset_IgE_SL,thalf_opt_logsexpoffset_IgEG1_BMSL]);
    titlestr_logsexpoffset_IgG1_SL = sprintf('IgG1 SLT: y_{0} = %.1e, f _{LL} = %.2f, t_1 = %.1f',[y0_opt_logsexpoffset_IgG1_SL,f_opt_logsexpoffset_IgG1_SL,thalf_opt_logsexpoffset_IgEG1_BMSL]);

    AIC_opt_logsexpoffset_IgEG1_BMSL = aic(length(x_opt_logsexpoffset_IgEG1_BMSL),4*nodatapoints,error_x_opt_logsexpoffset_IgEG1_BMSL);
    titlestr_logsexpoffset_IgEG1_BMSL = sprintf('Single exponential offset fits (SLT/BM and IgG1/E combined): s.s.e. = %.2f, AIC = %.3g',[error_x_opt_logsexpoffset_IgEG1_BMSL,AIC_opt_logsexpoffset_IgEG1_BMSL]);

%%% Plot Results
    f8 = figure;
    f8.Units = 'inches';
    f8.OuterPosition = [0 0 15 10];
    sgtitle(titlestr_logsexpoffset_IgEG1_BMSL,'FontWeight','Bold','FontSize',18)
    f8d = subplot(224);
    errorbar(tdata,logydata_mean_hCD4_IgE_BM,logydata_sem_hCD4_IgE_BM,'bo','LineWidth',2,'MarkerSize',10)
    hold on 
    plot(tgrid(1:(nogridpoints-2))+2,logyfit_logsexpoffset_IgE_BM,'k--','LineWidth',2,'MarkerSize',10)
    hold off
    title(titlestr_logsexpoffset_IgE_BM, 'FontWeight','Normal','FontSize',16)
    f8d.TitleHorizontalAlignment = 'left';
    axis([t0 tf 0.5 5.5])
    yticks(gca,[1 2 3 4 5])
    legend('data', 'model fit')
    text(50,5,sprintf('s.s.e. = %.2f\nAIC = %.3g',[error_x_opt_logsexpoffset_IgEG1_BMSL,AIC_opt_logsexpoffset_IgEG1_BMSL]),'FontSize', 16)
    xlabel('time (days)')
    ylabel('log_{10}(hCD4+)')
    set(gca,'FontSize',16)
    
    f8c = subplot(223);
    errorbar(tdata,logydata_mean_hCD4_IgE_SL,logydata_sem_hCD4_IgE_SL,'bo','LineWidth',2,'MarkerSize',10)
    hold on 
    plot(tgrid(1:(nogridpoints-2))+2,logyfit_logsexpoffset_IgE_SL,'k--','LineWidth',2,'MarkerSize',10)
    hold off
    title(titlestr_logsexpoffset_IgE_SL, 'FontWeight','Normal','FontSize',16)
    f8c.TitleHorizontalAlignment = 'left';
    axis([t0 tf 0.5 5.5])
    yticks(gca,[1 2 3 4 5])
    legend('data', 'model fit')
    text(50,5,sprintf('s.s.e. = %.2f\nAIC = %.3g',[error_x_opt_logsexpoffset_IgEG1_BMSL,AIC_opt_logsexpoffset_IgEG1_BMSL]),'FontSize', 16)
    xlabel('time (days)')
    ylabel('log_{10}(hCD4+)')
    set(gca,'FontSize',16)
    
    f8b = subplot(222);
    errorbar(tdata,logydata_mean_hCD4_IgG1_BM,logydata_sem_hCD4_IgG1_BM,'bo','LineWidth',2,'MarkerSize',10)
    hold on 
    plot(tgrid(1:(nogridpoints-2))+2,logyfit_logsexpoffset_IgG1_BM,'k--','LineWidth',2,'MarkerSize',10)
    hold off
    title(titlestr_logsexpoffset_IgG1_BM, 'FontWeight','Normal','FontSize',16)
    f8b.TitleHorizontalAlignment = 'left';
    axis([t0 tf 0.5 5.5])
    yticks(gca,[1 2 3 4 5])
    legend('data', 'model fit')
    text(50,5,sprintf('s.s.e. = %.2f\nAIC = %.3g',[error_x_opt_logsexpoffset_IgEG1_BMSL,AIC_opt_logsexpoffset_IgEG1_BMSL]),'FontSize', 16)
    xlabel('time (days)')
    ylabel('log_{10}(hCD4+)')
    set(gca,'FontSize',16)
    
    f8a = subplot(221);
    errorbar(tdata,logydata_mean_hCD4_IgG1_SL,logydata_sem_hCD4_IgG1_SL,'bo','LineWidth',2,'MarkerSize',10)
    hold on 
    plot(tgrid(1:(nogridpoints-2))+2,logyfit_logsexpoffset_IgG1_SL,'k--','LineWidth',2,'MarkerSize',10)
    hold off
    title(titlestr_logsexpoffset_IgG1_SL, 'FontWeight','Normal','FontSize',16)
    f8a.TitleHorizontalAlignment = 'left';
    axis([t0 tf 0.5 5.5])
    yticks(gca,[1 2 3 4 5])
    legend('data', 'model fit')
    text(50,5,sprintf('s.s.e. = %.2f\nAIC = %.3g',[error_x_opt_logsexpoffset_IgEG1_BMSL,AIC_opt_logsexpoffset_IgEG1_BMSL]),'FontSize', 16)
    xlabel('time (days)')
    ylabel('log_{10}(hCD4+)')
    set(gca,'FontSize',16)
 

    %%%% DOUBLE EXPONENTIAL MODEL

%%% Individual fits to each IgG1/E and SLT/BM data set
    error_x_opt_logdexp_IgE_BM = error_x_opt_logdexp_IgE_BM_bootstrap(1);
    x_opt_logdexp_IgE_BM = x_opt_logdexp_IgE_BM_bootstrap(1,:);
    x_opt_logdexp_IgE_BM_bootstrap_thalf = x_opt_logdexp_IgE_BM_bootstrap;
    x_opt_logdexp_IgE_BM_bootstrap_thalf(:,3) = log(2)./x_opt_logdexp_IgE_BM_bootstrap_thalf(:,3);
    x_opt_logdexp_IgE_BM_bootstrap_thalf(:,4) = log(2)./x_opt_logdexp_IgE_BM_bootstrap_thalf(:,4);
    logyfit_logdexp_IgE_BM = logdoubleexp_survival(x_opt_logdexp_IgE_BM,tgrid(1:(nogridpoints-2)));
    y0_opt_logdexp_IgE_BM = x_opt_logdexp_IgE_BM(1);
    f_opt_logdexp_IgE_BM = x_opt_logdexp_IgE_BM(2);
    thalf_1_opt_logdexp_IgE_BM = log(2)/x_opt_logdexp_IgE_BM(3);
    thalf_2_opt_logdexp_IgE_BM = log(2)/x_opt_logdexp_IgE_BM(4);
    AIC_opt_logdexp_IgE_BM = aic(length(x_opt_logdexp_IgE_BM),nodatapoints,error_x_opt_logdexp_IgE_BM);
    titlestr_logdexp_IgE_BM = sprintf('IgE BM: y_{0} = %.1e, f _{LL} = %.2f, t_1 = %.1f, t_2 = %.1f',[y0_opt_logdexp_IgE_BM,1-f_opt_logdexp_IgE_BM,thalf_1_opt_logdexp_IgE_BM,thalf_2_opt_logdexp_IgE_BM]);

    error_x_opt_logdexp_IgG1_BM = error_x_opt_logdexp_IgG1_BM_bootstrap(1);
    x_opt_logdexp_IgG1_BM = x_opt_logdexp_IgG1_BM_bootstrap(1,:);
    x_opt_logdexp_IgG1_BM_bootstrap_thalf = x_opt_logdexp_IgG1_BM_bootstrap;
    x_opt_logdexp_IgG1_BM_bootstrap_thalf(:,3) = log(2)./x_opt_logdexp_IgG1_BM_bootstrap_thalf(:,3);
    x_opt_logdexp_IgG1_BM_bootstrap_thalf(:,4) = log(2)./x_opt_logdexp_IgG1_BM_bootstrap_thalf(:,4);
    logyfit_logdexp_IgG1_BM = logdoubleexp_survival(x_opt_logdexp_IgG1_BM,tgrid(1:(nogridpoints-2)));
    y0_opt_logdexp_IgG1_BM = x_opt_logdexp_IgG1_BM(1);
    f_opt_logdexp_IgG1_BM = x_opt_logdexp_IgG1_BM(2);
    thalf_1_opt_logdexp_IgG1_BM = log(2)/x_opt_logdexp_IgG1_BM(3);
    thalf_2_opt_logdexp_IgG1_BM = log(2)/x_opt_logdexp_IgG1_BM(4);
    AIC_opt_logdexp_IgG1_BM = aic(length(x_opt_logdexp_IgG1_BM),nodatapoints,error_x_opt_logdexp_IgG1_BM);
    titlestr_logdexp_IgG1_BM = sprintf('IgG1 BM: y_{0} = %.1e, f _{LL} = %.2f, t_1 = %.1f, t_2 = %.1f',[y0_opt_logdexp_IgG1_BM,1-f_opt_logdexp_IgG1_BM,thalf_1_opt_logdexp_IgG1_BM,thalf_2_opt_logdexp_IgG1_BM]);

    error_x_opt_logdexp_IgE_SL = error_x_opt_logdexp_IgE_SL_bootstrap(1);
    x_opt_logdexp_IgE_SL = x_opt_logdexp_IgE_SL_bootstrap(1,:);
    x_opt_logdexp_IgE_SL_bootstrap_thalf = x_opt_logdexp_IgE_SL_bootstrap;
    x_opt_logdexp_IgE_SL_bootstrap_thalf(:,3) = log(2)./x_opt_logdexp_IgE_SL_bootstrap_thalf(:,3);
    x_opt_logdexp_IgE_SL_bootstrap_thalf(:,4) = log(2)./x_opt_logdexp_IgE_SL_bootstrap_thalf(:,4);
    logyfit_logdexp_IgE_SL = logdoubleexp_survival(x_opt_logdexp_IgE_SL,tgrid(1:(nogridpoints-2)));
    y0_opt_logdexp_IgE_SL = x_opt_logdexp_IgE_SL(1);
    f_opt_logdexp_IgE_SL = x_opt_logdexp_IgE_SL(2);
    thalf_1_opt_logdexp_IgE_SL = log(2)/x_opt_logdexp_IgE_SL(3);
    thalf_2_opt_logdexp_IgE_SL = log(2)/x_opt_logdexp_IgE_SL(4);
    AIC_opt_logdexp_IgE_SL = aic(length(x_opt_logdexp_IgE_SL),nodatapoints,error_x_opt_logdexp_IgE_SL);
    titlestr_logdexp_IgE_SL = sprintf('IgE SLT: y_{0} = %.1e, f _{LL} = %.2f, t_1 = %.1f, t_2 = %.1f',[y0_opt_logdexp_IgE_SL,1-f_opt_logdexp_IgE_SL,thalf_1_opt_logdexp_IgE_SL,thalf_2_opt_logdexp_IgE_SL]);

    error_x_opt_logdexp_IgG1_SL = error_x_opt_logdexp_IgG1_SL_bootstrap(1);
    x_opt_logdexp_IgG1_SL = x_opt_logdexp_IgG1_SL_bootstrap(1,:);
    x_opt_logdexp_IgG1_SL_bootstrap_thalf = x_opt_logdexp_IgG1_SL_bootstrap;
    x_opt_logdexp_IgG1_SL_bootstrap_thalf(:,3) = log(2)./x_opt_logdexp_IgG1_SL_bootstrap_thalf(:,3);
    x_opt_logdexp_IgG1_SL_bootstrap_thalf(:,4) = log(2)./x_opt_logdexp_IgG1_SL_bootstrap_thalf(:,4);
    logyfit_logdexp_IgG1_SL = logdoubleexp_survival(x_opt_logdexp_IgG1_SL,tgrid(1:(nogridpoints-2)));
    y0_opt_logdexp_IgG1_SL = x_opt_logdexp_IgG1_SL(1);
    f_opt_logdexp_IgG1_SL = x_opt_logdexp_IgG1_SL(2);
    thalf_1_opt_logdexp_IgG1_SL = log(2)/x_opt_logdexp_IgG1_SL(3);
    thalf_2_opt_logdexp_IgG1_SL = log(2)/x_opt_logdexp_IgG1_SL(4);
    AIC_opt_logdexp_IgG1_SL = aic(length(x_opt_logdexp_IgG1_SL),nodatapoints,error_x_opt_logdexp_IgG1_SL);
    titlestr_logdexp_IgG1_SL = sprintf('IgG1 SLT: y_{0} = %.1e, f _{LL} = %.2f, t_1 = %.1f, t_2 = %.1f',[y0_opt_logdexp_IgG1_SL,1-f_opt_logdexp_IgG1_SL,thalf_1_opt_logdexp_IgG1_SL,thalf_2_opt_logdexp_IgG1_SL]);

    error_x_opt_logdexp = error_x_opt_logdexp_IgE_BM + error_x_opt_logdexp_IgG1_BM + error_x_opt_logdexp_IgE_SL + error_x_opt_logdexp_IgG1_SL;
    AIC_opt_logdexp = aic(length(x_opt_logdexp_IgE_BM)+length(x_opt_logdexp_IgE_SL)+length(x_opt_logdexp_IgG1_BM)+length(x_opt_logdexp_IgG1_SL),4*nodatapoints,error_x_opt_logdexp);
    titlestr_logdexp = sprintf('Double exponential fits: s.s.e. = %.2f, AIC = %.3g',[error_x_opt_logdexp,AIC_opt_logdexp]);

%%% Plot Results
    f9 = figure;
    f9.Units = 'inches';
    f9.OuterPosition = [0 0 15 10];
    sgtitle(titlestr_logdexp,'FontWeight','Bold','FontSize',18)
    f9d = subplot(224);
    errorbar(tdata,logydata_mean_hCD4_IgE_BM,logydata_sem_hCD4_IgE_BM,'bo','LineWidth',2,'MarkerSize',10)
    hold on 
    plot(tgrid(1:(nogridpoints-2))+2,logyfit_logdexp_IgE_BM,'k--','LineWidth',2,'MarkerSize',10)
    hold off
    title(titlestr_logdexp_IgE_BM, 'FontWeight','Normal','FontSize',16)
    f9d.TitleHorizontalAlignment = 'left';
    axis([t0 tf 0.5 5.5])
    yticks(gca,[1 2 3 4 5])
    legend('data', 'model fit')
    text(50,5,sprintf('s.s.e. = %.2f\nAIC = %.3g',[error_x_opt_logdexp_IgE_BM,AIC_opt_logdexp_IgE_BM]),'FontSize', 16)
    xlabel('time (days)')
    ylabel('log_{10}(hCD4+)')
    set(gca,'FontSize',16)
    
    f9c = subplot(223);
    errorbar(tdata,logydata_mean_hCD4_IgE_SL,logydata_sem_hCD4_IgE_SL,'bo','LineWidth',2,'MarkerSize',10)
    hold on 
    plot(tgrid(1:(nogridpoints-2))+2,logyfit_logdexp_IgE_SL,'k--','LineWidth',2,'MarkerSize',10)
    hold off
    title(titlestr_logdexp_IgE_SL, 'FontWeight','Normal','FontSize',16)
    f9c.TitleHorizontalAlignment = 'left';
    axis([t0 tf 0.5 5.5])
    yticks(gca,[1 2 3 4 5])
    legend('data', 'model fit')
    text(50,5,sprintf('s.s.e. = %.2f\nAIC = %.3g',[error_x_opt_logdexp_IgE_SL,AIC_opt_logdexp_IgE_SL]),'FontSize', 16)
    xlabel('time (days)')
    ylabel('log_{10}(hCD4+)')
    set(gca,'FontSize',16)
    
    f9b = subplot(222);
    errorbar(tdata,logydata_mean_hCD4_IgG1_BM,logydata_sem_hCD4_IgG1_BM,'bo','LineWidth',2,'MarkerSize',10)
    hold on 
    plot(tgrid(1:(nogridpoints-2))+2,logyfit_logdexp_IgG1_BM,'k--','LineWidth',2,'MarkerSize',10)
    hold off
    title(titlestr_logdexp_IgG1_BM, 'FontWeight','Normal','FontSize',16)
    f9b.TitleHorizontalAlignment = 'left';
    axis([t0 tf 0.5 5.5])
    yticks(gca,[1 2 3 4 5])
    legend('data', 'model fit')
    text(50,5,sprintf('s.s.e. = %.2f\nAIC = %.3g',[error_x_opt_logdexp_IgG1_BM,AIC_opt_logdexp_IgG1_BM]),'FontSize', 16)
    xlabel('time (days)')
    ylabel('log_{10}(hCD4+)')
    set(gca,'FontSize',16)
    
    f9a = subplot(221);
    errorbar(tdata,logydata_mean_hCD4_IgG1_SL,logydata_sem_hCD4_IgG1_SL,'bo','LineWidth',2,'MarkerSize',10)
    hold on 
    plot(tgrid(1:(nogridpoints-2))+2,logyfit_logdexp_IgG1_SL,'k--','LineWidth',2,'MarkerSize',10)
    hold off
    title(titlestr_logdexp_IgG1_SL, 'FontWeight','Normal','FontSize',16)
    f9a.TitleHorizontalAlignment = 'left';
    axis([t0 tf 0.5 5.5])
    yticks(gca,[1 2 3 4 5])
    legend('data', 'model fit')
    text(50,5,sprintf('s.s.e. = %.2f\nAIC = %.3g',[error_x_opt_logdexp_IgG1_SL,AIC_opt_logdexp_IgG1_SL]),'FontSize', 16)
    xlabel('time (days)')
    ylabel('log_{10}(hCD4+)')
    set(gca,'FontSize',16)

%%% Fits to IgE combined SLT/BM and IgG1 combined SLT/BM
    error_x_opt_logdexp_IgE_BMSL = error_x_opt_logdexp_IgE_BMSL_bootstrap(1);
    x_opt_logdexp_IgE_BMSL = x_opt_logdexp_IgE_BMSL_bootstrap(1,:);
    x_opt_logdexp_IgE_BMSL_bootstrap_thalf = x_opt_logdexp_IgE_BMSL_bootstrap;
    x_opt_logdexp_IgE_BMSL_bootstrap_thalf(:,5) = log(2)./x_opt_logdexp_IgE_BMSL_bootstrap_thalf(:,5);
    x_opt_logdexp_IgE_BMSL_bootstrap_thalf(:,6) = log(2)./x_opt_logdexp_IgE_BMSL_bootstrap_thalf(:,6);
    logyfit_logdexp_IgE_BMSL = logdoubleexp_survival_twodatasets(x_opt_logdexp_IgE_BMSL,tgrid(1:(nogridpoints-2)));
    logyfit_logdexp_IgE_BM = logyfit_logdexp_IgE_BMSL(1:(nogridpoints-2));
    logyfit_logdexp_IgE_SL = logyfit_logdexp_IgE_BMSL((nogridpoints-2)+1:2*(nogridpoints-2));
    y0_opt_logdexp_IgE_BM = x_opt_logdexp_IgE_BMSL(1);
    y0_opt_logdexp_IgE_SL = x_opt_logdexp_IgE_BMSL(2);
    f_opt_logdexp_IgE_BM = x_opt_logdexp_IgE_BMSL(3);
    f_opt_logdexp_IgE_SL = x_opt_logdexp_IgE_BMSL(4);
    thalf_1_opt_logdexp_IgE_BMSL = log(2)/x_opt_logdexp_IgE_BMSL(5);
    thalf_2_opt_logdexp_IgE_BMSL = log(2)/x_opt_logdexp_IgE_BMSL(6);
    AIC_opt_logdexp_IgE_BMSL = aic(length(x_opt_logdexp_IgE_BMSL),2*nodatapoints,error_x_opt_logdexp_IgE_BMSL);
    titlestr_logdexp_IgE_BM = sprintf('IgE BM: y_{0} = %.1e, f _{LL} = %.2f, t_1 = %.1f, t_2 = %.1f',[y0_opt_logdexp_IgE_BM,1-f_opt_logdexp_IgE_BM,thalf_1_opt_logdexp_IgE_BMSL,thalf_2_opt_logdexp_IgE_BMSL]);
    titlestr_logdexp_IgE_SL = sprintf('IgE SLT: y_{0} = %.1e, f _{LL} = %.2f, t_1 = %.1f, t_2 = %.1f',[y0_opt_logdexp_IgE_SL,1-f_opt_logdexp_IgE_SL,thalf_1_opt_logdexp_IgE_BMSL,thalf_2_opt_logdexp_IgE_BMSL]);

    error_x_opt_logdexp_IgG1_BMSL = error_x_opt_logdexp_IgG1_BMSL_bootstrap(1);
    x_opt_logdexp_IgG1_BMSL = x_opt_logdexp_IgG1_BMSL_bootstrap(1,:);
    x_opt_logdexp_IgG1_BMSL_bootstrap_thalf = x_opt_logdexp_IgG1_BMSL_bootstrap;
    x_opt_logdexp_IgG1_BMSL_bootstrap_thalf(:,5) = log(2)./x_opt_logdexp_IgG1_BMSL_bootstrap_thalf(:,5);
    x_opt_logdexp_IgG1_BMSL_bootstrap_thalf(:,6) = log(2)./x_opt_logdexp_IgG1_BMSL_bootstrap_thalf(:,6);
    logyfit_logdexp_IgG1_BMSL = logdoubleexp_survival_twodatasets(x_opt_logdexp_IgG1_BMSL,tgrid(1:(nogridpoints-2)));
    logyfit_logdexp_IgG1_BM = logyfit_logdexp_IgG1_BMSL(1:(nogridpoints-2));
    logyfit_logdexp_IgG1_SL = logyfit_logdexp_IgG1_BMSL((nogridpoints-2)+1:2*(nogridpoints-2));
    y0_opt_logdexp_IgG1_BM = x_opt_logdexp_IgG1_BMSL(1);
    y0_opt_logdexp_IgG1_SL = x_opt_logdexp_IgG1_BMSL(2);
    f_opt_logdexp_IgG1_BM = x_opt_logdexp_IgG1_BMSL(3);
    f_opt_logdexp_IgG1_SL = x_opt_logdexp_IgG1_BMSL(4);
    thalf_1_opt_logdexp_IgG1_BMSL = log(2)/x_opt_logdexp_IgG1_BMSL(5);
    thalf_2_opt_logdexp_IgG1_BMSL = log(2)/x_opt_logdexp_IgG1_BMSL(6);
    AIC_opt_logdexp_IgG1_BMSL = aic(length(x_opt_logdexp_IgG1_BMSL),2*nodatapoints,error_x_opt_logdexp_IgG1_BMSL);
    titlestr_logdexp_IgG1_BM = sprintf('IgG1 BM: y_{0} = %.1e, f _{LL} = %.2f, t_1 = %.1f, t_2 = %.1f',[y0_opt_logdexp_IgG1_BM,1-f_opt_logdexp_IgG1_BM,thalf_1_opt_logdexp_IgG1_BMSL,thalf_2_opt_logdexp_IgG1_BMSL]);
    titlestr_logdexp_IgG1_SL = sprintf('IgG1 SLT: y_{0} = %.1e, f _{LL} = %.2f, t_1 = %.1f, t_2 = %.1f',[y0_opt_logdexp_IgG1_SL,1-f_opt_logdexp_IgG1_SL,thalf_1_opt_logdexp_IgG1_BMSL,thalf_2_opt_logdexp_IgG1_BMSL]);

    error_x_opt_logdexp_BMSL = error_x_opt_logdexp_IgE_BMSL + error_x_opt_logdexp_IgG1_BMSL;
    AIC_opt_logdexp_BMSL = aic(length(x_opt_logdexp_IgE_BMSL)+length(x_opt_logdexp_IgG1_BMSL),4*nodatapoints,error_x_opt_logdexp_BMSL);
    titlestr_logdexp_BMSL = sprintf('Double exponential fits (SLT/BM combined): s.s.e. = %.2f, AIC = %.3g',[error_x_opt_logdexp_BMSL,AIC_opt_logdexp_BMSL]);

%%% Plot Results
    f10 = figure;
    f10.Units = 'inches';
    f10.OuterPosition = [0 0 15 10];
    sgtitle(titlestr_logdexp_BMSL,'FontWeight','Bold','FontSize',18)
    f10d = subplot(224);
    errorbar(tdata,logydata_mean_hCD4_IgE_BM,logydata_sem_hCD4_IgE_BM,'bo','LineWidth',2,'MarkerSize',10)
    hold on 
    plot(tgrid(1:(nogridpoints-2))+2,logyfit_logdexp_IgE_BM,'k--','LineWidth',2,'MarkerSize',10)
    hold off
    title(titlestr_logdexp_IgE_BM, 'FontWeight','Normal','FontSize',16)
    f10d.TitleHorizontalAlignment = 'left';
    axis([t0 tf 0.5 5.5])
    yticks(gca,[1 2 3 4 5])
    legend('data', 'model fit')
    text(50,5,sprintf('s.s.e. = %.2f\nAIC = %.3g',[error_x_opt_logdexp_IgE_BMSL,AIC_opt_logdexp_IgE_BMSL]),'FontSize', 16)
    xlabel('time (days)')
    ylabel('log_{10}(hCD4+)')
    set(gca,'FontSize',16)
    
    f10c = subplot(223);
    errorbar(tdata,logydata_mean_hCD4_IgE_SL,logydata_sem_hCD4_IgE_SL,'bo','LineWidth',2,'MarkerSize',10)
    hold on 
    plot(tgrid(1:(nogridpoints-2))+2,logyfit_logdexp_IgE_SL,'k--','LineWidth',2,'MarkerSize',10)
    hold off
    title(titlestr_logdexp_IgE_SL, 'FontWeight','Normal','FontSize',16)
    f10c.TitleHorizontalAlignment = 'left';
    axis([t0 tf 0.5 5.5])
    yticks(gca,[1 2 3 4 5])
    legend('data', 'model fit')
    text(50,5,sprintf('s.s.e. = %.2f\nAIC = %.3g',[error_x_opt_logdexp_IgE_BMSL,AIC_opt_logdexp_IgE_BMSL]),'FontSize', 16)
    xlabel('time (days)')
    ylabel('log_{10}(hCD4+)')
    set(gca,'FontSize',16)
    
    f10b = subplot(222);
    errorbar(tdata,logydata_mean_hCD4_IgG1_BM,logydata_sem_hCD4_IgG1_BM,'bo','LineWidth',2,'MarkerSize',10)
    hold on 
    plot(tgrid(1:(nogridpoints-2))+2,logyfit_logdexp_IgG1_BM,'k--','LineWidth',2,'MarkerSize',10)
    hold off
    title(titlestr_logdexp_IgG1_BM, 'FontWeight','Normal','FontSize',16)
    text(50,5,sprintf('s.s.e. = %.2f\nAIC = %.3g',[error_x_opt_logdexp_IgG1_BM,AIC_opt_logdexp_IgG1_BM]),'FontSize', 16)
    f10b.TitleHorizontalAlignment = 'left';
    axis([t0 tf 0.5 5.5])
    yticks(gca,[1 2 3 4 5])
    legend('data', 'model fit')
    xlabel('time (days)')
    ylabel('log_{10}(hCD4+)')
    set(gca,'FontSize',16)
    
    f10a = subplot(221);
    errorbar(tdata,logydata_mean_hCD4_IgG1_SL,logydata_sem_hCD4_IgG1_SL,'bo','LineWidth',2,'MarkerSize',10)
    hold on 
    plot(tgrid(1:(nogridpoints-2))+2,logyfit_logdexp_IgG1_SL,'k--','LineWidth',2,'MarkerSize',10)
    hold off
    title(titlestr_logdexp_IgG1_SL, 'FontWeight','Normal','FontSize',16)
    f10a.TitleHorizontalAlignment = 'left';
    axis([t0 tf 0.5 5.5])
    yticks(gca,[1 2 3 4 5])
    legend('data', 'model fit')
    text(50,5,sprintf('s.s.e. = %.2f\nAIC = %.3g',[error_x_opt_logdexp_IgG1_SL,AIC_opt_logdexp_IgG1_SL]),'FontSize', 16)
    xlabel('time (days)')
    ylabel('log_{10}(hCD4+)')
    set(gca,'FontSize',16)

    %%Fits to BM combined IgG1/E and SL combined IgG1/E
    error_x_opt_logdexp_IgEG1_BM = error_x_opt_logdexp_IgEG1_BM_bootstrap(1);
    x_opt_logdexp_IgEG1_BM = x_opt_logdexp_IgEG1_BM_bootstrap(1,:);
    x_opt_logdexp_IgEG1_BM_bootstrap_thalf = x_opt_logdexp_IgEG1_BM_bootstrap;
    x_opt_logdexp_IgEG1_BM_bootstrap_thalf(:,5) = log(2)./x_opt_logdexp_IgEG1_BM_bootstrap_thalf(:,5);
    x_opt_logdexp_IgEG1_BM_bootstrap_thalf(:,6) = log(2)./x_opt_logdexp_IgEG1_BM_bootstrap_thalf(:,6);
    logyfit_logdexp_IgEG1_BM = logdoubleexp_survival_twodatasets(x_opt_logdexp_IgEG1_BM,tgrid(1:(nogridpoints-2)));
    logyfit_logdexp_IgE_BM = logyfit_logdexp_IgEG1_BM(1:(nogridpoints-2));
    logyfit_logdexp_IgG1_BM = logyfit_logdexp_IgEG1_BM((nogridpoints-2)+1:2*(nogridpoints-2));
    y0_opt_logdexp_IgE_BM = x_opt_logdexp_IgEG1_BM(1);
    y0_opt_logdexp_IgG1_BM = x_opt_logdexp_IgEG1_BM(2);
    f_opt_logdexp_IgE_BM = x_opt_logdexp_IgEG1_BM(3);
    f_opt_logdexp_IgG1_BM = x_opt_logdexp_IgEG1_BM(4);
    thalf_1_opt_logdexp_IgEG1_BM = log(2)/x_opt_logdexp_IgEG1_BM(5);
    thalf_2_opt_logdexp_IgEG1_BM = log(2)/x_opt_logdexp_IgEG1_BM(6);
    AIC_opt_logdexp_IgEG1_BM = aic(length(x_opt_logdexp_IgEG1_BM),2*nodatapoints,error_x_opt_logdexp_IgEG1_BM);
    titlestr_logdexp_IgE_BM = sprintf('IgE BM: y_{0} = %.1e, f _{LL} = %.2f, t_1 = %.1f, t_2 = %.1f',[y0_opt_logdexp_IgE_BM,1-f_opt_logdexp_IgE_BM,thalf_1_opt_logdexp_IgEG1_BM,thalf_2_opt_logdexp_IgEG1_BM]);
    titlestr_logdexp_IgG1_BM = sprintf('IgG1 BM: y_{0} = %.1e, f _{LL} = %.2f, t_1 = %.1f, t_2 = %.1f',[y0_opt_logdexp_IgG1_BM,1-f_opt_logdexp_IgG1_BM,thalf_1_opt_logdexp_IgEG1_BM,thalf_2_opt_logdexp_IgEG1_BM]);

    error_x_opt_logdexp_IgEG1_SL = error_x_opt_logdexp_IgEG1_SL_bootstrap(1);
    x_opt_logdexp_IgEG1_SL = x_opt_logdexp_IgEG1_SL_bootstrap(1,:);
    x_opt_logdexp_IgEG1_SL_bootstrap_thalf = x_opt_logdexp_IgEG1_SL_bootstrap;
    x_opt_logdexp_IgEG1_SL_bootstrap_thalf(:,5) = log(2)./x_opt_logdexp_IgEG1_SL_bootstrap_thalf(:,5);
    x_opt_logdexp_IgEG1_SL_bootstrap_thalf(:,6) = log(2)./x_opt_logdexp_IgEG1_SL_bootstrap_thalf(:,6);
    logyfit_logdexp_IgEG1_SL = logdoubleexp_survival_twodatasets(x_opt_logdexp_IgEG1_SL,tgrid(1:(nogridpoints-2)));
    logyfit_logdexp_IgE_SL = logyfit_logdexp_IgEG1_SL(1:(nogridpoints-2));
    logyfit_logdexp_IgG1_SL = logyfit_logdexp_IgEG1_SL((nogridpoints-2)+1:2*(nogridpoints-2));
    y0_opt_logdexp_IgE_SL = x_opt_logdexp_IgEG1_SL(1);
    y0_opt_logdexp_IgG1_SL = x_opt_logdexp_IgEG1_SL(2);
    f_opt_logdexp_IgE_SL = x_opt_logdexp_IgEG1_SL(3);
    f_opt_logdexp_IgG1_SL = x_opt_logdexp_IgEG1_SL(4);
    thalf_1_opt_logdexp_IgEG1_SL = log(2)/x_opt_logdexp_IgEG1_SL(5);
    thalf_2_opt_logdexp_IgEG1_SL = log(2)/x_opt_logdexp_IgEG1_SL(6);
    AIC_opt_logdexp_IgEG1_SL = aic(length(x_opt_logdexp_IgEG1_SL),2*nodatapoints,error_x_opt_logdexp_IgEG1_SL);
    titlestr_logdexp_IgE_SL = sprintf('IgE SLT: y_{0} = %.1e, f _{LL} = %.2f, t_1 = %.1f, t_2 = %.1f',[y0_opt_logdexp_IgE_SL,1-f_opt_logdexp_IgE_SL,thalf_1_opt_logdexp_IgEG1_SL,thalf_2_opt_logdexp_IgEG1_SL]);
    titlestr_logdexp_IgG1_SL = sprintf('IgG1 SLT: y_{0} = %.1e, f _{LL} = %.2f, t_1 = %.1f, t_2 = %.1f',[y0_opt_logdexp_IgG1_SL,1-f_opt_logdexp_IgG1_SL,thalf_1_opt_logdexp_IgEG1_SL,thalf_2_opt_logdexp_IgEG1_SL]);

    error_x_opt_logdexp_IgEG1 = error_x_opt_logdexp_IgEG1_BM + error_x_opt_logdexp_IgEG1_SL;
    AIC_opt_logdexp_IgEG1 = aic(length(x_opt_logdexp_IgEG1_BM)+length(x_opt_logdexp_IgEG1_SL),4*nodatapoints,error_x_opt_logdexp_IgEG1);
    titlestr_logdexp_IgEG1 = sprintf('Double exponential fits (IgG1/E combined): s.s.e. = %.2f, AIC = %.3g',[error_x_opt_logdexp_IgEG1,AIC_opt_logdexp_IgEG1]);

%%% Plot Results
    f11 = figure;
    f11.Units = 'inches';
    f11.OuterPosition = [0 0 15 10];
    sgtitle(titlestr_logdexp_IgEG1,'FontWeight','Bold','FontSize',18)
    f11d = subplot(224);
    errorbar(tdata,logydata_mean_hCD4_IgE_BM,logydata_sem_hCD4_IgE_BM,'bo','LineWidth',2,'MarkerSize',10)
    hold on 
    plot(tgrid(1:(nogridpoints-2))+2,logyfit_logdexp_IgE_BM,'k--','LineWidth',2,'MarkerSize',10)
    hold off
    title(titlestr_logdexp_IgE_BM, 'FontWeight','Normal','FontSize',16)
    f11d.TitleHorizontalAlignment = 'left';
    axis([t0 tf 0.5 5.5])
    yticks(gca,[1 2 3 4 5])
    legend('data', 'model fit')
    text(50,5,sprintf('s.s.e. = %.2f\nAIC = %.3g',[error_x_opt_logdexp_IgEG1_BM,AIC_opt_logdexp_IgEG1_BM]),'FontSize', 16)
    xlabel('time (days)')
    ylabel('log_{10}(hCD4+)')
    set(gca,'FontSize',16)
    
    f11c = subplot(223);
    errorbar(tdata,logydata_mean_hCD4_IgE_SL,logydata_sem_hCD4_IgE_SL,'bo','LineWidth',2,'MarkerSize',10)
    hold on 
    plot(tgrid(1:(nogridpoints-2))+2,logyfit_logdexp_IgE_SL,'k--','LineWidth',2,'MarkerSize',10)
    hold off
    title(titlestr_logdexp_IgE_SL, 'FontWeight','Normal','FontSize',16)
    f11c.TitleHorizontalAlignment = 'left';
    axis([t0 tf 0.5 5.5])
    yticks(gca,[1 2 3 4 5])
    legend('data', 'model fit')
    text(50,5,sprintf('s.s.e. = %.2f\nAIC = %.3g',[error_x_opt_logdexp_IgEG1_SL,AIC_opt_logdexp_IgEG1_SL]),'FontSize', 16)
    xlabel('time (days)')
    ylabel('log_{10}(hCD4+)')
    set(gca,'FontSize',16)
    
    f11b = subplot(222);
    errorbar(tdata,logydata_mean_hCD4_IgG1_BM,logydata_sem_hCD4_IgG1_BM,'bo','LineWidth',2,'MarkerSize',10)
    hold on 
    plot(tgrid(1:(nogridpoints-2))+2,logyfit_logdexp_IgG1_BM,'k--','LineWidth',2,'MarkerSize',10)
    hold off
    title(titlestr_logdexp_IgG1_BM, 'FontWeight','Normal','FontSize',16)
    f11b.TitleHorizontalAlignment = 'left';
    axis([t0 tf 0.5 5.5])
    yticks(gca,[1 2 3 4 5])
    legend('data', 'model fit')
    text(50,5,sprintf('s.s.e. = %.2f\nAIC = %.3g',[error_x_opt_logdexp_IgEG1_BM,AIC_opt_logdexp_IgEG1_BM]),'FontSize', 16)
    xlabel('time (days)')
    ylabel('log_{10}(hCD4+)')
    set(gca,'FontSize',16)
    
    f11a = subplot(221);
    errorbar(tdata,logydata_mean_hCD4_IgG1_SL,logydata_sem_hCD4_IgG1_SL,'bo','LineWidth',2,'MarkerSize',10)
    hold on 
    plot(tgrid(1:(nogridpoints-2))+2,logyfit_logdexp_IgG1_SL,'k--','LineWidth',2,'MarkerSize',10)
    hold off
    title(titlestr_logdexp_IgG1_SL, 'FontWeight','Normal','FontSize',16)
    f11a.TitleHorizontalAlignment = 'left';
    axis([t0 tf 0.5 5.5])
    yticks(gca,[1 2 3 4 5])
    legend('data', 'model fit')
    text(50,5,sprintf('s.s.e. = %.2f\nAIC = %.3g',[error_x_opt_logdexp_IgEG1_SL,AIC_opt_logdexp_IgEG1_SL]),'FontSize', 16)
    xlabel('time (days)')
    ylabel('log_{10}(hCD4+)')
    set(gca,'FontSize',16)

    %%Fits to all four data sets simultaneously SLT/BM and IgG1/E
    error_x_opt_logdexp_IgEG1_BMSL = error_x_opt_logdexp_IgEG1_BMSL_bootstrap(1);
    x_opt_logdexp_IgEG1_BMSL = x_opt_logdexp_IgEG1_BMSL_bootstrap(1,:);
    x_opt_logdexp_IgEG1_BMSL_bootstrap_thalf = x_opt_logdexp_IgEG1_BMSL_bootstrap;
    x_opt_logdexp_IgEG1_BMSL_bootstrap_thalf(:,9) = log(2)./x_opt_logdexp_IgEG1_BMSL_bootstrap_thalf(:,9);
    x_opt_logdexp_IgEG1_BMSL_bootstrap_thalf(:,10) = log(2)./x_opt_logdexp_IgEG1_BMSL_bootstrap_thalf(:,10);
    logyfit_logdexp_IgEG1_BMSL = logdoubleexp_survival_fourdatasets(x_opt_logdexp_IgEG1_BMSL,tgrid(1:(nogridpoints-2)));
    logyfit_logdexp_IgE_BM = logyfit_logdexp_IgEG1_BMSL(1:(nogridpoints-2));
    logyfit_logdexp_IgG1_BM = logyfit_logdexp_IgEG1_BMSL((nogridpoints-2)+1:2*(nogridpoints-2));
    logyfit_logdexp_IgE_SL = logyfit_logdexp_IgEG1_BMSL(2*(nogridpoints-2)+1:3*(nogridpoints-2));
    logyfit_logdexp_IgG1_SL = logyfit_logdexp_IgEG1_BMSL(3*(nogridpoints-2)+1:4*(nogridpoints-2));
    y0_opt_logdexp_IgE_BM = x_opt_logdexp_IgEG1_BMSL(1);
    y0_opt_logdexp_IgG1_BM = x_opt_logdexp_IgEG1_BMSL(2);
    y0_opt_logdexp_IgE_SL = x_opt_logdexp_IgEG1_BMSL(3);
    y0_opt_logdexp_IgG1_SL = x_opt_logdexp_IgEG1_BMSL(4);
    f_opt_logdexp_IgE_BM = x_opt_logdexp_IgEG1_BMSL(5);
    f_opt_logdexp_IgG1_BM = x_opt_logdexp_IgEG1_BMSL(6);
    f_opt_logdexp_IgE_SL = x_opt_logdexp_IgEG1_BMSL(7);
    f_opt_logdexp_IgG1_SL = x_opt_logdexp_IgEG1_BMSL(8);
    thalf_1_opt_logdexp_IgEG1_BMSL = log(2)/x_opt_logdexp_IgEG1_BMSL(9);
    thalf_2_opt_logdexp_IgEG1_BMSL = log(2)/x_opt_logdexp_IgEG1_BMSL(10);
    titlestr_logdexp_IgE_BM = sprintf('IgE BM: y_{0} = %.1e, f _{LL} = %.2f, t_1 = %.1f, t_2 = %.1f',[y0_opt_logdexp_IgE_BM,1-f_opt_logdexp_IgE_BM,thalf_1_opt_logdexp_IgEG1_BMSL,thalf_2_opt_logdexp_IgEG1_BMSL]);
    titlestr_logdexp_IgG1_BM = sprintf('IgG1 BM: y_{0} = %.1e, f _{LL} = %.2f, t_1 = %.1f, t_2 = %.1f',[y0_opt_logdexp_IgG1_BM,1-f_opt_logdexp_IgG1_BM,thalf_1_opt_logdexp_IgEG1_BMSL,thalf_2_opt_logdexp_IgEG1_BMSL]);
    titlestr_logdexp_IgE_SL = sprintf('IgE SLT: y_{0} = %.1e, f _{LL} = %.2f, t_1 = %.1f, t_2 = %.1f',[y0_opt_logdexp_IgE_SL,1-f_opt_logdexp_IgE_SL,thalf_1_opt_logdexp_IgEG1_BMSL,thalf_2_opt_logdexp_IgEG1_BMSL]);
    titlestr_logdexp_IgG1_SL = sprintf('IgG1 SLT: y_{0} = %.1e, f _{LL} = %.2f, t_1 = %.1f, t_2 = %.1f',[y0_opt_logdexp_IgG1_SL,1-f_opt_logdexp_IgG1_SL,thalf_1_opt_logdexp_IgEG1_BMSL,thalf_2_opt_logdexp_IgEG1_BMSL]);

    AIC_opt_logdexp_IgEG1_BMSL = aic(length(x_opt_logdexp_IgEG1_BMSL),4*nodatapoints,error_x_opt_logdexp_IgEG1_BMSL);
    titlestr_logdexp_IgEG1_BMSL = sprintf('Double exponential fits (SLT/BM and IgG1/E combined): s.s.e. = %.2f, AIC = %.3g',[error_x_opt_logdexp_IgEG1_BMSL,AIC_opt_logdexp_IgEG1_BMSL]);

%%% Plot Results
    f12 = figure;
    f12.Units = 'inches';
    f12.OuterPosition = [0 0 15 10];
    sgtitle(titlestr_logdexp_IgEG1_BMSL,'FontWeight','Bold','FontSize',18)
    f12d = subplot(224);
    errorbar(tdata,logydata_mean_hCD4_IgE_BM,logydata_sem_hCD4_IgE_BM,'bo','LineWidth',2,'MarkerSize',10)
    hold on 
    plot(tgrid(1:(nogridpoints-2))+2,logyfit_logdexp_IgE_BM,'k--','LineWidth',2,'MarkerSize',10)
    hold off
    title(titlestr_logdexp_IgE_BM, 'FontWeight','Normal','FontSize',16)
    f12d.TitleHorizontalAlignment = 'left';
    axis([t0 tf 0.5 5.5])
    yticks(gca,[1 2 3 4 5])
    legend('data', 'model fit')
    text(50,5,sprintf('s.s.e. = %.2f\nAIC = %.3g',[error_x_opt_logdexp_IgEG1_BMSL,AIC_opt_logdexp_IgEG1_BMSL]),'FontSize', 16)
    xlabel('time (days)')
    ylabel('log_{10}(hCD4+)')
    set(gca,'FontSize',16)
    
    f12c = subplot(223);
    errorbar(tdata,logydata_mean_hCD4_IgE_SL,logydata_sem_hCD4_IgE_SL,'bo','LineWidth',2,'MarkerSize',10)
    hold on 
    plot(tgrid(1:(nogridpoints-2))+2,logyfit_logdexp_IgE_SL,'k--','LineWidth',2,'MarkerSize',10)
    hold off
    title(titlestr_logdexp_IgE_SL, 'FontWeight','Normal','FontSize',16)
    f12c.TitleHorizontalAlignment = 'left';
    axis([t0 tf 0.5 5.5])
    yticks(gca,[1 2 3 4 5])
    legend('data', 'model fit')
    text(50,5,sprintf('s.s.e. = %.2f\nAIC = %.3g',[error_x_opt_logdexp_IgEG1_BMSL,AIC_opt_logdexp_IgEG1_BMSL]),'FontSize', 16)
    xlabel('time (days)')
    ylabel('log_{10}(hCD4+)')
    set(gca,'FontSize',16)
    
    f12b = subplot(222);
    errorbar(tdata,logydata_mean_hCD4_IgG1_BM,logydata_sem_hCD4_IgG1_BM,'bo','LineWidth',2,'MarkerSize',10)
    hold on 
    plot(tgrid(1:(nogridpoints-2))+2,logyfit_logdexp_IgG1_BM,'k--','LineWidth',2,'MarkerSize',10)
    hold off
    title(titlestr_logdexp_IgG1_BM, 'FontWeight','Normal','FontSize',16)
    f12b.TitleHorizontalAlignment = 'left';
    axis([t0 tf 0.5 5.5])
    yticks(gca,[1 2 3 4 5])
    legend('data', 'model fit')
    text(50,5,sprintf('s.s.e. = %.2f\nAIC = %.3g',[error_x_opt_logdexp_IgEG1_BMSL,AIC_opt_logdexp_IgEG1_BMSL]),'FontSize', 16)
    xlabel('time (days)')
    ylabel('log_{10}(hCD4+)')
    set(gca,'FontSize',16)
    
    f12a = subplot(221);
    errorbar(tdata,logydata_mean_hCD4_IgG1_SL,logydata_sem_hCD4_IgG1_SL,'bo','LineWidth',2,'MarkerSize',10)
    hold on 
    plot(tgrid(1:(nogridpoints-2))+2,logyfit_logdexp_IgG1_SL,'k--','LineWidth',2,'MarkerSize',10)
    hold off
    title(titlestr_logdexp_IgG1_SL, 'FontWeight','Normal','FontSize',16)
    f12a.TitleHorizontalAlignment = 'left';
    axis([t0 tf 0.5 5.5])
    yticks(gca,[1 2 3 4 5])
    legend('data', 'model fit')
    text(50,5,sprintf('s.s.e. = %.2f\nAIC = %.3g',[error_x_opt_logdexp_IgEG1_BMSL,AIC_opt_logdexp_IgEG1_BMSL]),'FontSize', 16)
    xlabel('time (days)')
    ylabel('log_{10}(hCD4+)')
    set(gca,'FontSize',16)


%%%STEADY STATE LOGNORMAL MODEL

    %%% Individual fits to each IgG1/E and SLT/BM data set
    error_x_opt_logsslogn_IgE_BM = error_x_opt_logsslogn_IgE_BM_bootstrap(1);
    x_opt_logsslogn_IgE_BM = x_opt_logsslogn_IgE_BM_bootstrap(1,:);
    x_opt_logsslogn_IgE_BM_bootstrap_linparams = x_opt_logsslogn_IgE_BM_bootstrap;
    [mu,sigma] = lognmusigma(x_opt_logsslogn_IgE_BM_bootstrap(:,2),x_opt_logsslogn_IgE_BM_bootstrap(:,3));
    x_opt_logsslogn_IgE_BM_bootstrap_linparams(:,2) = mu; 
    x_opt_logsslogn_IgE_BM_bootstrap_linparams(:,3) = sigma; 
    logyfit_logsslogn_IgE_BM = logsslogn_survival(x_opt_logsslogn_IgE_BM,tgrid(1:(nogridpoints-2)));
    y0_opt_logsslogn_IgE_BM = x_opt_logsslogn_IgE_BM(1);
    m_opt_logsslogn_IgE_BM = x_opt_logsslogn_IgE_BM(2);
    s_opt_logsslogn_IgE_BM = x_opt_logsslogn_IgE_BM(3);
    [mu_opt_logsslogn_IgE_BM,sigma_opt_logsslogn_IgE_BM] = lognmusigma(m_opt_logsslogn_IgE_BM,s_opt_logsslogn_IgE_BM);
    AIC_opt_logsslogn_IgE_BM = aic(length(x_opt_logsslogn_IgE_BM),nodatapoints,error_x_opt_logsslogn_IgE_BM);
    %titlestr_logsslogn_IgE_BM = sprintf('IgE BM: y_{0} = %.1e, m = %.1f, s = %.1f',[y0_opt_logsslogn_IgE_BM,m_opt_logsslogn_IgE_BM,s_opt_logsslogn_IgE_BM]);
    titlestr_logsslogn_IgE_BM = sprintf('IgE BM: y_{0} = %.1e, \\mu = %.1f, \\sigma = %.1f',[y0_opt_logsslogn_IgE_BM,mu_opt_logsslogn_IgE_BM,sigma_opt_logsslogn_IgE_BM]);

    error_x_opt_logsslogn_IgG1_BM = error_x_opt_logsslogn_IgG1_BM_bootstrap(1);
    x_opt_logsslogn_IgG1_BM = x_opt_logsslogn_IgG1_BM_bootstrap(1,:);
    x_opt_logsslogn_IgG1_BM_bootstrap_linparams = x_opt_logsslogn_IgG1_BM_bootstrap;
    [mu,sigma] = lognmusigma(x_opt_logsslogn_IgG1_BM_bootstrap(:,2),x_opt_logsslogn_IgG1_BM_bootstrap(:,3));
    x_opt_logsslogn_IgG1_BM_bootstrap_linparams(:,2) = mu; 
    x_opt_logsslogn_IgG1_BM_bootstrap_linparams(:,3) = sigma; 
    logyfit_logsslogn_IgG1_BM = logsslogn_survival(x_opt_logsslogn_IgG1_BM,tgrid(1:(nogridpoints-2)));
    y0_opt_logsslogn_IgG1_BM = x_opt_logsslogn_IgG1_BM(1);
    m_opt_logsslogn_IgG1_BM = x_opt_logsslogn_IgG1_BM(2);
    s_opt_logsslogn_IgG1_BM = x_opt_logsslogn_IgG1_BM(3);
    [mu_opt_logsslogn_IgG1_BM,sigma_opt_logsslogn_IgG1_BM] = lognmusigma(m_opt_logsslogn_IgG1_BM,s_opt_logsslogn_IgG1_BM);
    AIC_opt_logsslogn_IgG1_BM = aic(length(x_opt_logsslogn_IgG1_BM),nodatapoints,error_x_opt_logsslogn_IgG1_BM);
    %titlestr_logsslogn_IgG1_BM = sprintf('IgG1 BM: y_{0} = %.1e, m = %.1f, s = %.1f',[y0_opt_logsslogn_IgG1_BM,m_opt_logsslogn_IgG1_BM,s_opt_logsslogn_IgG1_BM]);
    titlestr_logsslogn_IgG1_BM = sprintf('IgG1 BM: y_{0} = %.1e, \\mu = %.1f, \\sigma = %.1f',[y0_opt_logsslogn_IgG1_BM,mu_opt_logsslogn_IgG1_BM,sigma_opt_logsslogn_IgG1_BM]);

    error_x_opt_logsslogn_IgE_SL = error_x_opt_logsslogn_IgE_SL_bootstrap(1);
    x_opt_logsslogn_IgE_SL = x_opt_logsslogn_IgE_SL_bootstrap(1,:);
    x_opt_logsslogn_IgE_SL_bootstrap_linparams = x_opt_logsslogn_IgE_SL_bootstrap;
    [mu,sigma] = lognmusigma(x_opt_logsslogn_IgE_SL_bootstrap(:,2),x_opt_logsslogn_IgE_SL_bootstrap(:,3));
    x_opt_logsslogn_IgE_SL_bootstrap_linparams(:,2) = mu; 
    x_opt_logsslogn_IgE_SL_bootstrap_linparams(:,3) = sigma; 
    logyfit_logsslogn_IgE_SL = logsslogn_survival(x_opt_logsslogn_IgE_SL,tgrid(1:(nogridpoints-2)));
    y0_opt_logsslogn_IgE_SL = x_opt_logsslogn_IgE_SL(1);
    m_opt_logsslogn_IgE_SL = x_opt_logsslogn_IgE_SL(2);
    s_opt_logsslogn_IgE_SL = x_opt_logsslogn_IgE_SL(3);
    [mu_opt_logsslogn_IgE_SL,sigma_opt_logsslogn_IgE_SL] = lognmusigma(m_opt_logsslogn_IgE_SL,s_opt_logsslogn_IgE_SL);
    AIC_opt_logsslogn_IgE_SL = aic(length(x_opt_logsslogn_IgE_SL),nodatapoints,error_x_opt_logsslogn_IgE_SL);
    %titlestr_logsslogn_IgE_SL = sprintf('IgE SLT: y_{0} = %.1e, m = %.1f, s = %.1f',[y0_opt_logsslogn_IgE_SL,m_opt_logsslogn_IgE_SL,s_opt_logsslogn_IgE_SL]);
    titlestr_logsslogn_IgE_SL = sprintf('IgE SLT: y_{0} = %.1e, \\mu = %.1f, \\sigma = %.1f',[y0_opt_logsslogn_IgE_SL,mu_opt_logsslogn_IgE_SL,sigma_opt_logsslogn_IgE_SL]);

    error_x_opt_logsslogn_IgG1_SL = error_x_opt_logsslogn_IgG1_SL_bootstrap(1);
    x_opt_logsslogn_IgG1_SL = x_opt_logsslogn_IgG1_SL_bootstrap(1,:);
    x_opt_logsslogn_IgG1_SL_bootstrap_linparams = x_opt_logsslogn_IgG1_SL_bootstrap;
    [mu,sigma] = lognmusigma(x_opt_logsslogn_IgG1_SL_bootstrap(:,2),x_opt_logsslogn_IgG1_SL_bootstrap(:,3));
    x_opt_logsslogn_IgG1_SL_bootstrap_linparams(:,2) = mu; 
    x_opt_logsslogn_IgG1_SL_bootstrap_linparams(:,3) = sigma; 
    logyfit_logsslogn_IgG1_SL = logsslogn_survival(x_opt_logsslogn_IgG1_SL,tgrid(1:(nogridpoints-2)));
    y0_opt_logsslogn_IgG1_SL = x_opt_logsslogn_IgG1_SL(1);
    m_opt_logsslogn_IgG1_SL = x_opt_logsslogn_IgG1_SL(2);
    s_opt_logsslogn_IgG1_SL = x_opt_logsslogn_IgG1_SL(3);
    [mu_opt_logsslogn_IgG1_SL,sigma_opt_logsslogn_IgG1_SL] = lognmusigma(m_opt_logsslogn_IgG1_SL,s_opt_logsslogn_IgG1_SL);
    AIC_opt_logsslogn_IgG1_SL = aic(length(x_opt_logsslogn_IgG1_SL),nodatapoints,error_x_opt_logsslogn_IgG1_SL);
    %titlestr_logsslogn_IgG1_SL = sprintf('IgG1 SLT: y_{0} = %.1e, m = %.1f, s = %.1f',[y0_opt_logsslogn_IgG1_SL,m_opt_logsslogn_IgG1_SL,s_opt_logsslogn_IgG1_SL]);
    titlestr_logsslogn_IgG1_SL = sprintf('IgG1 SLT: y_{0} = %.1e, \\mu = %.1f, \\sigma = %.1f',[y0_opt_logsslogn_IgG1_SL,mu_opt_logsslogn_IgG1_SL,sigma_opt_logsslogn_IgG1_SL]);

    error_x_opt_logsslogn = error_x_opt_logsslogn_IgE_BM + error_x_opt_logsslogn_IgG1_BM + error_x_opt_logsslogn_IgE_SL + error_x_opt_logsslogn_IgG1_SL;
    AIC_opt_logsslogn = aic(length(x_opt_logsslogn_IgE_BM)+length(x_opt_logsslogn_IgE_SL)+length(x_opt_logsslogn_IgG1_BM)+length(x_opt_logsslogn_IgG1_SL),4*nodatapoints,error_x_opt_logsslogn);
    titlestr_logsslogn = sprintf('Steady-state lognormal fits: s.s.e. = %.2f, AIC = %.3g',[error_x_opt_logsslogn,AIC_opt_logsslogn]);

%%% Plot Results
    f13 = figure;
    f13.Units = 'inches';
    f13.OuterPosition = [0 0 15 10];
    sgtitle(titlestr_logsslogn,'FontWeight','Bold','FontSize',18)
    f13d = subplot(224);
    errorbar(tdata,logydata_mean_hCD4_IgE_BM,logydata_sem_hCD4_IgE_BM,'bo','LineWidth',2,'MarkerSize',10)
    hold on 
    plot(tgrid(1:(nogridpoints-2))+2,logyfit_logsslogn_IgE_BM,'k--','LineWidth',2,'MarkerSize',10)
    hold off
    title(titlestr_logsslogn_IgE_BM, 'FontWeight','Normal','FontSize',16)
    f13d.TitleHorizontalAlignment = 'left';
    axis([t0 tf 0.5 5.5])
    yticks(gca,[1 2 3 4 5])
    legend('data', 'model fit')
    text(50,5,sprintf('s.s.e. = %.2f\nAIC = %.3g',[error_x_opt_logsslogn_IgE_BM,AIC_opt_logsslogn_IgE_BM]),'FontSize', 16)
    xlabel('time (days)')
    ylabel('log_{10}(hCD4+)')
    set(gca,'FontSize',16)
    
    f13c = subplot(223);
    errorbar(tdata,logydata_mean_hCD4_IgE_SL,logydata_sem_hCD4_IgE_SL,'bo','LineWidth',2,'MarkerSize',10)
    hold on 
    plot(tgrid(1:(nogridpoints-2))+2,logyfit_logsslogn_IgE_SL,'k--','LineWidth',2,'MarkerSize',10)
    hold off
    title(titlestr_logsslogn_IgE_SL, 'FontWeight','Normal','FontSize',16)
    f13c.TitleHorizontalAlignment = 'left';
    axis([t0 tf 0.5 5.5])
    yticks(gca,[1 2 3 4 5])
    legend('data', 'model fit')
    text(50,5,sprintf('s.s.e. = %.2f\nAIC = %.3g',[error_x_opt_logsslogn_IgE_SL,AIC_opt_logsslogn_IgE_SL]),'FontSize', 16)
    xlabel('time (days)')
    ylabel('log_{10}(hCD4+)')
    set(gca,'FontSize',16)
    
    f13b = subplot(222);
    errorbar(tdata,logydata_mean_hCD4_IgG1_BM,logydata_sem_hCD4_IgG1_BM,'bo','LineWidth',2,'MarkerSize',10)
    hold on 
    plot(tgrid(1:(nogridpoints-2))+2,logyfit_logsslogn_IgG1_BM,'k--','LineWidth',2,'MarkerSize',10)
    hold off
    title(titlestr_logsslogn_IgG1_BM, 'FontWeight','Normal','FontSize',16)
    f13b.TitleHorizontalAlignment = 'left';
    axis([t0 tf 0.5 5.5])
    yticks(gca,[1 2 3 4 5])
    legend('data', 'model fit')
    text(50,5,sprintf('s.s.e. = %.2f\nAIC = %.3g',[error_x_opt_logsslogn_IgG1_BM,AIC_opt_logsslogn_IgG1_BM]),'FontSize', 16)
    xlabel('time (days)')
    ylabel('log_{10}(hCD4+)')
    set(gca,'FontSize',16)
    
    f13a = subplot(221);
    errorbar(tdata,logydata_mean_hCD4_IgG1_SL,logydata_sem_hCD4_IgG1_SL,'bo','LineWidth',2,'MarkerSize',10)
    hold on 
    plot(tgrid(1:(nogridpoints-2))+2,logyfit_logsslogn_IgG1_SL,'k--','LineWidth',2,'MarkerSize',10)
    hold off
    title(titlestr_logsslogn_IgG1_SL, 'FontWeight','Normal','FontSize',16)
    f13a.TitleHorizontalAlignment = 'left';
    axis([t0 tf 0.5 5.5])
    yticks(gca,[1 2 3 4 5])
    legend('data', 'model fit')
    text(50,5,sprintf('s.s.e. = %.2f\nAIC = %.3g',[error_x_opt_logsslogn_IgG1_SL,AIC_opt_logsslogn_IgG1_SL]),'FontSize', 16)
    xlabel('time (days)')
    ylabel('log_{10}(hCD4+)')
    set(gca,'FontSize',16)

%%% Fits to IgE combined SLT/BM and IgG1 combined SLT/BM
    error_x_opt_logsslogn_IgE_BMSL = error_x_opt_logsslogn_IgE_BMSL_bootstrap(1);
    x_opt_logsslogn_IgE_BMSL = x_opt_logsslogn_IgE_BMSL_bootstrap(1,:);
    x_opt_logsslogn_IgE_BMSL_bootstrap_linparams = x_opt_logsslogn_IgE_BMSL_bootstrap;
    [mu,sigma] = lognmusigma(x_opt_logsslogn_IgE_BMSL_bootstrap(:,3),x_opt_logsslogn_IgE_BMSL_bootstrap(:,4));
    x_opt_logsslogn_IgE_BMSL_bootstrap_linparams(:,3) = mu; 
    x_opt_logsslogn_IgE_BMSL_bootstrap_linparams(:,4) = sigma; 
    logyfit_logsslogn_IgE_BMSL = logsslogn_survival_twodatasets(x_opt_logsslogn_IgE_BMSL,tgrid(1:(nogridpoints-2)));
    logyfit_logsslogn_IgE_BM = logyfit_logsslogn_IgE_BMSL(1:(nogridpoints-2));
    logyfit_logsslogn_IgE_SL = logyfit_logsslogn_IgE_BMSL((nogridpoints-2)+1:2*(nogridpoints-2));
    y0_opt_logsslogn_IgE_BM = x_opt_logsslogn_IgE_BMSL(1);
    y0_opt_logsslogn_IgE_SL = x_opt_logsslogn_IgE_BMSL(2);
    m_opt_logsslogn_IgE_BMSL = x_opt_logsslogn_IgE_BMSL(3);
    s_opt_logsslogn_IgE_BMSL = x_opt_logsslogn_IgE_BMSL(4);
    [mu_opt_logsslogn_IgE_BMSL,sigma_opt_logsslogn_IgE_BMSL] = lognmusigma(m_opt_logsslogn_IgE_BMSL,s_opt_logsslogn_IgE_BMSL);
    AIC_opt_logsslogn_IgE_BMSL = aic(length(x_opt_logsslogn_IgE_BMSL),2*nodatapoints,error_x_opt_logsslogn_IgE_BMSL);
    % titlestr_logsslogn_IgE_BM = sprintf('IgE BM: y_{0} = %.1e, m = %.1f, s = %.1f',[y0_opt_logsslogn_IgE_BM,m_opt_logsslogn_IgE_BMSL,s_opt_logsslogn_IgE_BMSL]);
    % titlestr_logsslogn_IgE_SL = sprintf('IgE SLT: y_{0} = %.1e, m = %.1f, s = %.1f',[y0_opt_logsslogn_IgE_SL,m_opt_logsslogn_IgE_BMSL,s_opt_logsslogn_IgE_BMSL]);
    titlestr_logsslogn_IgE_BM = sprintf('IgE BM: y_{0} = %.1e, \\mu = %.1f, \\sigma = %.1f',[y0_opt_logsslogn_IgE_BM,mu_opt_logsslogn_IgE_BMSL,sigma_opt_logsslogn_IgE_BMSL]);
    titlestr_logsslogn_IgE_SL = sprintf('IgE SLT: y_{0} = %.1e, \\mu = %.1f, \\sigma = %.1f',[y0_opt_logsslogn_IgE_SL,mu_opt_logsslogn_IgE_BMSL,sigma_opt_logsslogn_IgE_BMSL]);

    error_x_opt_logsslogn_IgG1_BMSL = error_x_opt_logsslogn_IgG1_BMSL_bootstrap(1);
    x_opt_logsslogn_IgG1_BMSL = x_opt_logsslogn_IgG1_BMSL_bootstrap(1,:);
    x_opt_logsslogn_IgG1_BMSL_bootstrap_linparams = x_opt_logsslogn_IgG1_BMSL_bootstrap;
    [mu,sigma] = lognmusigma(x_opt_logsslogn_IgG1_BMSL_bootstrap(:,3),x_opt_logsslogn_IgG1_BMSL_bootstrap(:,4));
    x_opt_logsslogn_IgG1_BMSL_bootstrap_linparams(:,3) = mu; 
    x_opt_logsslogn_IgG1_BMSL_bootstrap_linparams(:,4) = sigma; 
    logyfit_logsslogn_IgG1_BMSL = logsslogn_survival_twodatasets(x_opt_logsslogn_IgG1_BMSL,tgrid(1:(nogridpoints-2)));
    logyfit_logsslogn_IgG1_BM = logyfit_logsslogn_IgG1_BMSL(1:(nogridpoints-2));
    logyfit_logsslogn_IgG1_SL = logyfit_logsslogn_IgG1_BMSL((nogridpoints-2)+1:2*(nogridpoints-2));
    y0_opt_logsslogn_IgG1_BM = x_opt_logsslogn_IgG1_BMSL(1);
    y0_opt_logsslogn_IgG1_SL = x_opt_logsslogn_IgG1_BMSL(2);
    m_opt_logsslogn_IgG1_BMSL = x_opt_logsslogn_IgG1_BMSL(3);
    s_opt_logsslogn_IgG1_BMSL = x_opt_logsslogn_IgG1_BMSL(4);
    [mu_opt_logsslogn_IgG1_BMSL,sigma_opt_logsslogn_IgG1_BMSL] = lognmusigma(m_opt_logsslogn_IgG1_BMSL,s_opt_logsslogn_IgG1_BMSL);
    AIC_opt_logsslogn_IgG1_BMSL = aic(length(x_opt_logsslogn_IgG1_BMSL),2*nodatapoints,error_x_opt_logsslogn_IgG1_BMSL);
    %titlestr_logsslogn_IgG1_BM = sprintf('IgG1 BM: y_{0} = %.1e, m = %.1f, s = %.1f',[y0_opt_logsslogn_IgG1_BM,m_opt_logsslogn_IgG1_BMSL,s_opt_logsslogn_IgG1_BMSL]);
    %titlestr_logsslogn_IgG1_SL = sprintf('IgG1 SLT: y_{0} = %.1e, m = %.1f, s = %.1f',[y0_opt_logsslogn_IgG1_SL,m_opt_logsslogn_IgG1_BMSL,s_opt_logsslogn_IgG1_BMSL]);
    titlestr_logsslogn_IgG1_BM = sprintf('IgG1 BM: y_{0} = %.1e, \\mu = %.1f, \\sigma = %.1f',[y0_opt_logsslogn_IgG1_BM,mu_opt_logsslogn_IgG1_BMSL,sigma_opt_logsslogn_IgG1_BMSL]);
    titlestr_logsslogn_IgG1_SL = sprintf('IgG1 SLT: y_{0} = %.1e, \\mu = %.1f, \\sigma = %.1f',[y0_opt_logsslogn_IgG1_SL,mu_opt_logsslogn_IgG1_BMSL,sigma_opt_logsslogn_IgG1_BMSL]);

    error_x_opt_logsslogn_BMSL = error_x_opt_logsslogn_IgE_BMSL + error_x_opt_logsslogn_IgG1_BMSL;
    AIC_opt_logsslogn_BMSL = aic(length(x_opt_logsslogn_IgE_BMSL)+length(x_opt_logsslogn_IgG1_BMSL),4*nodatapoints,error_x_opt_logsslogn_BMSL);
    titlestr_logsslogn_BMSL = sprintf('Steady-state lognormal fits (SLT/BM combined): s.s.e. = %.2f, AIC = %.3g',[error_x_opt_logsslogn_BMSL,AIC_opt_logsslogn_BMSL]);

%%% Plot Results
    f14 = figure;
    f14.Units = 'inches';
    f14.OuterPosition = [0 0 15 10];
    sgtitle(titlestr_logsslogn_BMSL,'FontWeight','Bold','FontSize',18)
    f14d = subplot(224);
    errorbar(tdata,logydata_mean_hCD4_IgE_BM,logydata_sem_hCD4_IgE_BM,'bo','LineWidth',2,'MarkerSize',10)
    hold on 
    plot(tgrid(1:(nogridpoints-2))+2,logyfit_logsslogn_IgE_BM,'k--','LineWidth',2,'MarkerSize',10)
    hold off
    title(titlestr_logsslogn_IgE_BM, 'FontWeight','Normal','FontSize',16)
    f14d.TitleHorizontalAlignment = 'left';
    axis([t0 tf 0.5 5.5])
    yticks(gca,[1 2 3 4 5])
    legend('data', 'model fit')
    text(50,5,sprintf('s.s.e. = %.2f\nAIC = %.3g',[error_x_opt_logsslogn_IgE_BMSL,AIC_opt_logsslogn_IgE_BMSL]),'FontSize', 16)
    xlabel('time (days)')
    ylabel('log_{10}(hCD4+)')
    set(gca,'FontSize',16)
    
    f14c = subplot(223);
    errorbar(tdata,logydata_mean_hCD4_IgE_SL,logydata_sem_hCD4_IgE_SL,'bo','LineWidth',2,'MarkerSize',10)
    hold on 
    plot(tgrid(1:(nogridpoints-2))+2,logyfit_logsslogn_IgE_SL,'k--','LineWidth',2,'MarkerSize',10)
    hold off
    title(titlestr_logsslogn_IgE_SL, 'FontWeight','Normal','FontSize',16)
    f14c.TitleHorizontalAlignment = 'left';
    axis([t0 tf 0.5 5.5])
    yticks(gca,[1 2 3 4 5])
    legend('data', 'model fit')
    text(50,5,sprintf('s.s.e. = %.2f\nAIC = %.3g',[error_x_opt_logsslogn_IgE_BMSL,AIC_opt_logsslogn_IgE_BMSL]),'FontSize', 16)
    xlabel('time (days)')
    ylabel('log_{10}(hCD4+)')
    set(gca,'FontSize',16)
    
    f14b = subplot(222);
    errorbar(tdata,logydata_mean_hCD4_IgG1_BM,logydata_sem_hCD4_IgG1_BM,'bo','LineWidth',2,'MarkerSize',10)
    hold on 
    plot(tgrid(1:(nogridpoints-2))+2,logyfit_logsslogn_IgG1_BM,'k--','LineWidth',2,'MarkerSize',10)
    hold off
    title(titlestr_logsslogn_IgG1_BM, 'FontWeight','Normal','FontSize',16)
    f14b.TitleHorizontalAlignment = 'left';
    axis([t0 tf 0.5 5.5])
    yticks(gca,[1 2 3 4 5])
    legend('data', 'model fit')
    text(50,5,sprintf('s.s.e. = %.2f\nAIC = %.3g',[error_x_opt_logsslogn_IgG1_BMSL,AIC_opt_logsslogn_IgG1_BMSL]),'FontSize', 16)
    xlabel('time (days)')
    ylabel('log_{10}(hCD4+)')
    set(gca,'FontSize',16)
    
    f14a = subplot(221);
    errorbar(tdata,logydata_mean_hCD4_IgG1_SL,logydata_sem_hCD4_IgG1_SL,'bo','LineWidth',2,'MarkerSize',10)
    hold on 
    plot(tgrid(1:(nogridpoints-2))+2,logyfit_logsslogn_IgG1_SL,'k--','LineWidth',2,'MarkerSize',10)
    hold off
    title(titlestr_logsslogn_IgG1_SL, 'FontWeight','Normal','FontSize',16)
    f14a.TitleHorizontalAlignment = 'left';
    axis([t0 tf 0.5 5.5])
    yticks(gca,[1 2 3 4 5])
    legend('data', 'model fit')
    text(50,5,sprintf('s.s.e. = %.2f\nAIC = %.3g',[error_x_opt_logsslogn_IgG1_BMSL,AIC_opt_logsslogn_IgG1_BMSL]),'FontSize', 16)
    xlabel('time (days)')
    ylabel('log_{10}(hCD4+)')
    set(gca,'FontSize',16)


    %%Fits to BM combined IgG1/E and SL combined IgG1/E
    error_x_opt_logsslogn_IgEG1_BM = error_x_opt_logsslogn_IgEG1_BM_bootstrap(1);
    x_opt_logsslogn_IgEG1_BM = x_opt_logsslogn_IgEG1_BM_bootstrap(1,:);
    x_opt_logsslogn_IgEG1_BM_bootstrap_linparams = x_opt_logsslogn_IgEG1_BM_bootstrap;
    [mu,sigma] = lognmusigma(x_opt_logsslogn_IgEG1_BM_bootstrap(:,3),x_opt_logsslogn_IgEG1_BM_bootstrap(:,4));
    x_opt_logsslogn_IgEG1_BM_bootstrap_linparams(:,3) = mu; 
    x_opt_logsslogn_IgEG1_BM_bootstrap_linparams(:,4) = sigma; 
    logyfit_logsslogn_IgEG1_BM = logsslogn_survival_twodatasets(x_opt_logsslogn_IgEG1_BM,tgrid(1:(nogridpoints-2)));
    logyfit_logsslogn_IgE_BM = logyfit_logsslogn_IgEG1_BM(1:(nogridpoints-2));
    logyfit_logsslogn_IgG1_BM = logyfit_logsslogn_IgEG1_BM((nogridpoints-2)+1:2*(nogridpoints-2));
    y0_opt_logsslogn_IgE_BM = x_opt_logsslogn_IgEG1_BM(1);
    y0_opt_logsslogn_IgG1_BM = x_opt_logsslogn_IgEG1_BM(2);
    m_opt_logsslogn_IgEG1_BM = x_opt_logsslogn_IgEG1_BM(3);
    s_opt_logsslogn_IgEG1_BM = x_opt_logsslogn_IgEG1_BM(4);
    [mu_opt_logsslogn_IgEG1_BM,sigma_opt_logsslogn_IgEG1_BM] = lognmusigma(m_opt_logsslogn_IgEG1_BM,s_opt_logsslogn_IgEG1_BM);
    AIC_opt_logsslogn_IgEG1_BM = aic(length(x_opt_logsslogn_IgEG1_BM),2*nodatapoints,error_x_opt_logsslogn_IgEG1_BM);
    %titlestr_logsslogn_IgE_BM = sprintf('IgE BM: y_{0} = %.1e, m = %.1f, s = %.1f',[y0_opt_logsslogn_IgE_BM,m_opt_logsslogn_IgEG1_BM,s_opt_logsslogn_IgEG1_BM]);
    %titlestr_logsslogn_IgG1_BM = sprintf('IgG1 BM: y_{0} = %.1e, m = %.1f, s = %.1f',[y0_opt_logsslogn_IgG1_BM,m_opt_logsslogn_IgEG1_BM,s_opt_logsslogn_IgEG1_BM]);
    titlestr_logsslogn_IgE_BM = sprintf('IgE BM: y_{0} = %.1e, \\mu = %.1f, \\sigma = %.1f',[y0_opt_logsslogn_IgE_BM,mu_opt_logsslogn_IgEG1_BM,sigma_opt_logsslogn_IgEG1_BM]);
    titlestr_logsslogn_IgG1_BM = sprintf('IgG1 BM: y_{0} = %.1e, \\mu = %.1f, \\sigma = %.1f',[y0_opt_logsslogn_IgG1_BM,mu_opt_logsslogn_IgEG1_BM,sigma_opt_logsslogn_IgEG1_BM]);

    error_x_opt_logsslogn_IgEG1_SL = error_x_opt_logsslogn_IgEG1_SL_bootstrap(1);
    x_opt_logsslogn_IgEG1_SL = x_opt_logsslogn_IgEG1_SL_bootstrap(1,:);
    x_opt_logsslogn_IgEG1_SL_bootstrap_linparams = x_opt_logsslogn_IgEG1_SL_bootstrap;
    [mu,sigma] = lognmusigma(x_opt_logsslogn_IgEG1_SL_bootstrap(:,3),x_opt_logsslogn_IgEG1_SL_bootstrap(:,4));
    x_opt_logsslogn_IgEG1_SL_bootstrap_linparams(:,3) = mu; 
    x_opt_logsslogn_IgEG1_SL_bootstrap_linparams(:,4) = sigma; 
    logyfit_logsslogn_IgEG1_SL = logsslogn_survival_twodatasets(x_opt_logsslogn_IgEG1_SL,tgrid(1:(nogridpoints-2)));
    logyfit_logsslogn_IgE_SL = logyfit_logsslogn_IgEG1_SL(1:(nogridpoints-2));
    logyfit_logsslogn_IgG1_SL = logyfit_logsslogn_IgEG1_SL((nogridpoints-2)+1:2*(nogridpoints-2));
    y0_opt_logsslogn_IgE_SL = x_opt_logsslogn_IgEG1_SL(1);
    y0_opt_logsslogn_IgG1_SL = x_opt_logsslogn_IgEG1_SL(2);
    m_opt_logsslogn_IgEG1_SL = x_opt_logsslogn_IgEG1_SL(3);
    s_opt_logsslogn_IgEG1_SL = x_opt_logsslogn_IgEG1_SL(4);
    [mu_opt_logsslogn_IgEG1_SL,sigma_opt_logsslogn_IgEG1_SL] = lognmusigma(m_opt_logsslogn_IgEG1_SL,s_opt_logsslogn_IgEG1_SL);
    AIC_opt_logsslogn_IgEG1_SL = aic(length(x_opt_logsslogn_IgEG1_SL),2*nodatapoints,error_x_opt_logsslogn_IgEG1_SL);
    %titlestr_logsslogn_IgE_SL = sprintf('IgE BM: y_{0} = %.1e, m = %.1f, s = %.1f',[y0_opt_logsslogn_IgE_SL,m_opt_logsslogn_IgEG1_SL,s_opt_logsslogn_IgEG1_SL]);
    %titlestr_logsslogn_IgG1_SL = sprintf('IgG1 BM: y_{0} = %.1e, m = %.1f, s = %.1f',[y0_opt_logsslogn_IgG1_SL,m_opt_logsslogn_IgEG1_SL,s_opt_logsslogn_IgEG1_SL]);
    titlestr_logsslogn_IgE_SL = sprintf('IgE SLT: y_{0} = %.1e, \\mu = %.1f, \\sigma = %.1f',[y0_opt_logsslogn_IgE_SL,mu_opt_logsslogn_IgEG1_SL,sigma_opt_logsslogn_IgEG1_SL]);
    titlestr_logsslogn_IgG1_SL = sprintf('IgG1 SLT: y_{0} = %.1e, \\mu = %.1f, \\sigma = %.1f',[y0_opt_logsslogn_IgG1_SL,mu_opt_logsslogn_IgEG1_SL,sigma_opt_logsslogn_IgEG1_SL]);

    error_x_opt_logsslogn_IgEG1 = error_x_opt_logsslogn_IgEG1_BM + error_x_opt_logsslogn_IgEG1_SL;
    AIC_opt_logsslogn_IgEG1 = aic(length(x_opt_logsslogn_IgEG1_BM)+length(x_opt_logsslogn_IgEG1_SL),4*nodatapoints,error_x_opt_logsslogn_IgEG1);
    titlestr_logsslogn_IgEG1 = sprintf('Steady-state lognormal fits (IgG1/E combined): s.s.e. = %.2f, AIC = %.3g',[error_x_opt_logsslogn_IgEG1,AIC_opt_logsslogn_IgEG1]);

%%% Plot Results
    f15 = figure;
    f15.Units = 'inches';
    f15.OuterPosition = [0 0 15 10];
    sgtitle(titlestr_logsslogn_IgEG1,'FontWeight','Bold','FontSize',18)
    f15d = subplot(224);
    errorbar(tdata,logydata_mean_hCD4_IgE_BM,logydata_sem_hCD4_IgE_BM,'bo','LineWidth',2,'MarkerSize',10)
    hold on 
    plot(tgrid(1:(nogridpoints-2))+2,logyfit_logsslogn_IgE_BM,'k--','LineWidth',2,'MarkerSize',10)
    hold off
    title(titlestr_logsslogn_IgE_BM, 'FontWeight','Normal','FontSize',16)
    f15d.TitleHorizontalAlignment = 'left';
    axis([t0 tf 0.5 5.5])
    yticks(gca,[1 2 3 4 5])
    legend('data', 'model fit')
    text(50,5,sprintf('s.s.e. = %.2f\nAIC = %.3g',[error_x_opt_logsslogn_IgEG1_BM,AIC_opt_logsslogn_IgEG1_BM]),'FontSize', 16)
    xlabel('time (days)')
    ylabel('log_{10}(hCD4+)')
    set(gca,'FontSize',16)
    
    f15c = subplot(223);
    errorbar(tdata,logydata_mean_hCD4_IgE_SL,logydata_sem_hCD4_IgE_SL,'bo','LineWidth',2,'MarkerSize',10)
    hold on 
    plot(tgrid(1:(nogridpoints-2))+2,logyfit_logsslogn_IgE_SL,'k--','LineWidth',2,'MarkerSize',10)
    hold off
    title(titlestr_logsslogn_IgE_SL, 'FontWeight','Normal','FontSize',16)
    f15c.TitleHorizontalAlignment = 'left';
    axis([t0 tf 0.5 5.5])
    yticks(gca,[1 2 3 4 5])
    legend('data', 'model fit')
    text(50,5,sprintf('s.s.e. = %.2f\nAIC = %.3g',[error_x_opt_logsslogn_IgEG1_BM,AIC_opt_logsslogn_IgEG1_BM]),'FontSize', 16)
    xlabel('time (days)')
    ylabel('log_{10}(hCD4+)')
    set(gca,'FontSize',16)
    
    f15b = subplot(222);
    errorbar(tdata,logydata_mean_hCD4_IgG1_BM,logydata_sem_hCD4_IgG1_BM,'bo','LineWidth',2,'MarkerSize',10)
    hold on 
    plot(tgrid(1:(nogridpoints-2))+2,logyfit_logsslogn_IgG1_BM,'k--','LineWidth',2,'MarkerSize',10)
    hold off
    title(titlestr_logsslogn_IgG1_BM, 'FontWeight','Normal','FontSize',16)
    f15b.TitleHorizontalAlignment = 'left';
    axis([t0 tf 0.5 5.5])
    yticks(gca,[1 2 3 4 5])
    legend('data', 'model fit')
    text(50,5,sprintf('s.s.e. = %.2f\nAIC = %.3g',[error_x_opt_logsslogn_IgEG1_SL,AIC_opt_logsslogn_IgEG1_SL]),'FontSize', 16)
    xlabel('time (days)')
    ylabel('log_{10}(hCD4+)')
    set(gca,'FontSize',16)
    
    f15a = subplot(221);
    errorbar(tdata,logydata_mean_hCD4_IgG1_SL,logydata_sem_hCD4_IgG1_SL,'bo','LineWidth',2,'MarkerSize',10)
    hold on 
    plot(tgrid(1:(nogridpoints-2))+2,logyfit_logsslogn_IgG1_SL,'k--','LineWidth',2,'MarkerSize',10)
    hold off
    title(titlestr_logsslogn_IgG1_SL, 'FontWeight','Normal','FontSize',16)
    f15a.TitleHorizontalAlignment = 'left';
    axis([t0 tf 0.5 5.5])
    yticks(gca,[1 2 3 4 5])
    legend('data', 'model fit')
    text(50,5,sprintf('s.s.e. = %.2f\nAIC = %.3g',[error_x_opt_logsslogn_IgEG1_SL,AIC_opt_logsslogn_IgEG1_SL]),'FontSize', 16)
    xlabel('time (days)')
    ylabel('log_{10}(hCD4+)')
    set(gca,'FontSize',16)

    %%Fits to all four data sets simultaneously SLT/BM and IgG1/E
    error_x_opt_logsslogn_IgEG1_BMSL = error_x_opt_logsslogn_IgEG1_BMSL_bootstrap(1);
    x_opt_logsslogn_IgEG1_BMSL = x_opt_logsslogn_IgEG1_BMSL_bootstrap(1,:);
    logyfit_logsslogn_IgEG1_BMSL = logsslogn_survival_fourdatasets(x_opt_logsslogn_IgEG1_BMSL,tgrid(1:(nogridpoints-2)));
    x_opt_logsslogn_IgEG1_BMSL_bootstrap_linparams = x_opt_logsslogn_IgEG1_BMSL_bootstrap;
    [mu,sigma] = lognmusigma(x_opt_logsslogn_IgEG1_BMSL_bootstrap(:,5),x_opt_logsslogn_IgEG1_BMSL_bootstrap(:,6));
    x_opt_logsslogn_IgEG1_BMSL_bootstrap_linparams(:,5) = mu; 
    x_opt_logsslogn_IgEG1_BMSL_bootstrap_linparams(:,6) = sigma; 
    logyfit_logsslogn_IgE_BM = logyfit_logsslogn_IgEG1_BMSL(1:(nogridpoints-2));
    logyfit_logsslogn_IgG1_BM = logyfit_logsslogn_IgEG1_BMSL((nogridpoints-2)+1:2*(nogridpoints-2));
    logyfit_logsslogn_IgE_SL = logyfit_logsslogn_IgEG1_BMSL(2*(nogridpoints-2)+1:3*(nogridpoints-2));
    logyfit_logsslogn_IgG1_SL = logyfit_logsslogn_IgEG1_BMSL(3*(nogridpoints-2)+1:4*(nogridpoints-2));
    y0_opt_logsslogn_IgE_BM = x_opt_logsslogn_IgEG1_BMSL(1);
    y0_opt_logsslogn_IgG1_BM = x_opt_logsslogn_IgEG1_BMSL(2);
    y0_opt_logsslogn_IgE_SL = x_opt_logsslogn_IgEG1_BMSL(3);
    y0_opt_logsslogn_IgG1_SL = x_opt_logsslogn_IgEG1_BMSL(4);
    m_opt_logsslogn_IgEG1_BMSL = x_opt_logsslogn_IgEG1_BMSL(5);
    s_opt_logsslogn_IgEG1_BMSL = x_opt_logsslogn_IgEG1_BMSL(6);
    [mu_opt_logsslogn_IgEG1_BMSL,sigma_opt_logsslogn_IgEG1_BMSL] = lognmusigma(m_opt_logsslogn_IgEG1_BMSL,s_opt_logsslogn_IgEG1_BMSL);
    %titlestr_logsslogn_IgE_BM = sprintf('IgE BM: y_{0} = %.1e, m = %.1f, s = %.1f',[y0_opt_logsslogn_IgE_BM,m_opt_logsslogn_IgEG1_BMSL,s_opt_logsslogn_IgEG1_BMSL]);
    %titlestr_logsslogn_IgG1_BM = sprintf('IgG1 BM: y_{0} = %.1e, m = %.1f, s = %.1f',[y0_opt_logsslogn_IgG1_BM,m_opt_logsslogn_IgEG1_BMSL,s_opt_logsslogn_IgEG1_BMSL]);
    %titlestr_logsslogn_IgE_SL = sprintf('IgE SLT: y_{0} = %.1e, m = %.1f, s = %.1f',[y0_opt_logsslogn_IgE_SL,m_opt_logsslogn_IgEG1_BMSL,s_opt_logsslogn_IgEG1_BMSL]);
    %titlestr_logsslogn_IgG1_SL = sprintf('IgG1 SLT: y_{0} = %.1e, m = %.1f, s = %.1f',[y0_opt_logsslogn_IgG1_SL,m_opt_logsslogn_IgEG1_BMSL,s_opt_logsslogn_IgEG1_BMSL]);
    titlestr_logsslogn_IgE_BM = sprintf('IgE BM: y_{0} = %.1e, \\mu = %.1f, \\sigma = %.1f',[y0_opt_logsslogn_IgE_BM,mu_opt_logsslogn_IgEG1_BMSL,sigma_opt_logsslogn_IgEG1_BMSL]);
    titlestr_logsslogn_IgG1_BM = sprintf('IgG1 BM: y_{0} = %.1e, \\mu = %.1f, \\sigma = %.1f',[y0_opt_logsslogn_IgG1_BM,mu_opt_logsslogn_IgEG1_BMSL,sigma_opt_logsslogn_IgEG1_BMSL]);
    titlestr_logsslogn_IgE_SL = sprintf('IgE SLT: y_{0} = %.1e, \\mu = %.1f, \\sigma = %.1f',[y0_opt_logsslogn_IgE_SL,mu_opt_logsslogn_IgEG1_BMSL,sigma_opt_logsslogn_IgEG1_BMSL]);
    titlestr_logsslogn_IgG1_SL = sprintf('IgG1 SLT: y_{0} = %.1e, \\mu = %.1f, \\sigma = %.1f',[y0_opt_logsslogn_IgG1_SL,mu_opt_logsslogn_IgEG1_BMSL,sigma_opt_logsslogn_IgEG1_BMSL]);

    AIC_opt_logsslogn_IgEG1_BMSL = aic(length(x_opt_logsslogn_IgEG1_BMSL),4*nodatapoints,error_x_opt_logsslogn_IgEG1_BMSL);
    titlestr_logsslogn_IgEG1_BMSL = sprintf('Steady-state lognormal fits (SLT/BM and IgG1/E combined): s.s.e. = %.2f, AIC = %.3g',[error_x_opt_logsslogn_IgEG1_BMSL,AIC_opt_logsslogn_IgEG1_BMSL]);

%%% Plot Results
    f16 = figure;
    f16.Units = 'inches';
    f16.OuterPosition = [0 0 15 10];
    sgtitle(titlestr_logsslogn_IgEG1_BMSL,'FontWeight','Bold','FontSize',18)
    f16d = subplot(224);
    errorbar(tdata,logydata_mean_hCD4_IgE_BM,logydata_sem_hCD4_IgE_BM,'bo','LineWidth',2,'MarkerSize',10)
    hold on 
    plot(tgrid(1:(nogridpoints-2))+2,logyfit_logsslogn_IgE_BM,'k--','LineWidth',2,'MarkerSize',10)
    hold off
    title(titlestr_logsslogn_IgE_BM, 'FontWeight','Normal','FontSize',16)
    f16d.TitleHorizontalAlignment = 'left';
    axis([t0 tf 0.5 5.5])
    yticks(gca,[1 2 3 4 5])
    legend('data', 'model fit')
    text(50,5,sprintf('s.s.e. = %.2f\nAIC = %.3g',[error_x_opt_logsslogn_IgEG1_BMSL,AIC_opt_logsslogn_IgEG1_BMSL]),'FontSize', 16)
    xlabel('time (days)')
    ylabel('log_{10}(hCD4+)')
    set(gca,'FontSize',16)
    
    f16c = subplot(223);
    errorbar(tdata,logydata_mean_hCD4_IgE_SL,logydata_sem_hCD4_IgE_SL,'bo','LineWidth',2,'MarkerSize',10)
    hold on 
    plot(tgrid(1:(nogridpoints-2))+2,logyfit_logsslogn_IgE_SL,'k--','LineWidth',2,'MarkerSize',10)
    hold off
    title(titlestr_logsslogn_IgE_SL, 'FontWeight','Normal','FontSize',16)
    f16c.TitleHorizontalAlignment = 'left';
    axis([t0 tf 0.5 5.5])
    yticks(gca,[1 2 3 4 5])
    legend('data', 'model fit')
    text(50,5,sprintf('s.s.e. = %.2f\nAIC = %.3g',[error_x_opt_logsslogn_IgEG1_BMSL,AIC_opt_logsslogn_IgEG1_BMSL]),'FontSize', 16)
    xlabel('time (days)')
    ylabel('log_{10}(hCD4+)')
    set(gca,'FontSize',16)
    
    f16b = subplot(222);
    errorbar(tdata,logydata_mean_hCD4_IgG1_BM,logydata_sem_hCD4_IgG1_BM,'bo','LineWidth',2,'MarkerSize',10)
    hold on 
    plot(tgrid(1:(nogridpoints-2))+2,logyfit_logsslogn_IgG1_BM,'k--','LineWidth',2,'MarkerSize',10)
    hold off
    title(titlestr_logsslogn_IgG1_BM, 'FontWeight','Normal','FontSize',16)
    f16b.TitleHorizontalAlignment = 'left';
    axis([t0 tf 0.5 5.5])
    yticks(gca,[1 2 3 4 5])
    legend('data', 'model fit')
    text(50,5,sprintf('s.s.e. = %.2f\nAIC = %.3g',[error_x_opt_logsslogn_IgEG1_BMSL,AIC_opt_logsslogn_IgEG1_BMSL]),'FontSize', 16)
    xlabel('time (days)')
    ylabel('log_{10}(hCD4+)')
    set(gca,'FontSize',16)
    
    f16a = subplot(221);
    errorbar(tdata,logydata_mean_hCD4_IgG1_SL,logydata_sem_hCD4_IgG1_SL,'bo','LineWidth',2,'MarkerSize',10)
    hold on 
    plot(tgrid(1:(nogridpoints-2))+2,logyfit_logsslogn_IgG1_SL,'k--','LineWidth',2,'MarkerSize',10)
    hold off
    title(titlestr_logsslogn_IgG1_SL, 'FontWeight','Normal','FontSize',16)
    f16a.TitleHorizontalAlignment = 'left';
    axis([t0 tf 0.5 5.5])
    yticks(gca,[1 2 3 4 5])
    legend('data', 'model fit')
    text(50,5,sprintf('s.s.e. = %.2f\nAIC = %.3g',[error_x_opt_logsslogn_IgEG1_BMSL,AIC_opt_logsslogn_IgEG1_BMSL]),'FontSize', 16)
    xlabel('time (days)')
    ylabel('log_{10}(hCD4+)')
    set(gca,'FontSize',16)