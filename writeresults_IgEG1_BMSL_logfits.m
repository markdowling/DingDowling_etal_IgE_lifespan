cd(starttimestr)

%Single exponential model
savefig(f1, strcat('sexp_individual_logfits_',starttimestr))
saveas(f1, strcat('sexp_individual_logfits_',starttimestr,'.svg'))
saveas(f1, strcat('sexp_individual_logfits_',starttimestr,'.png'))
savefig(f2, strcat('sexp_BMSLcombined_logfits_',starttimestr))
saveas(f2, strcat('sexp_BMSLcombined_logfits_',starttimestr,'.svg'))
saveas(f2, strcat('sexp_BMSLcombined_logfits_',starttimestr,'.png'))
savefig(f3, strcat('sexp_IgEG1combined_logfits_',starttimestr))
saveas(f3, strcat('sexp_IgEG1combined_logfits_',starttimestr,'.svg'))
saveas(f3, strcat('sexp_IgEG1combined_logfits_',starttimestr,'.png'))
savefig(f4, strcat('sexp_BMSLIgEG1combined_logfits_',starttimestr))
saveas(f4, strcat('sexp_BMSLIgEG1combined_logfits_',starttimestr,'.svg'))
saveas(f4, strcat('sexp_BMSLIgEG1combined_logfits_',starttimestr,'.png'))

logsexp_params = [x_opt_logsexp_IgE_BM_bootstrap(1,1),quantile(x_opt_logsexp_IgE_BM_bootstrap(:,1),[0.025,0.25,0.5,0.75,0.975]);
    x_opt_logsexp_IgE_BM_bootstrap(1,2),quantile(x_opt_logsexp_IgE_BM_bootstrap(:,2),[0.025,0.25,0.5,0.75,0.975]);
    x_opt_logsexp_IgE_BM_bootstrap_thalf(1,2),quantile(x_opt_logsexp_IgE_BM_bootstrap_thalf(:,2),[0.025,0.25,0.5,0.75,0.975]);
    x_opt_logsexp_IgG1_BM_bootstrap(1,1),quantile(x_opt_logsexp_IgG1_BM_bootstrap(:,1),[0.025,0.25,0.5,0.75,0.975]);
    x_opt_logsexp_IgG1_BM_bootstrap(1,2),quantile(x_opt_logsexp_IgG1_BM_bootstrap(:,2),[0.025,0.25,0.5,0.75,0.975]);
    x_opt_logsexp_IgG1_BM_bootstrap_thalf(1,2),quantile(x_opt_logsexp_IgG1_BM_bootstrap_thalf(:,2),[0.025,0.25,0.5,0.75,0.975]);
    x_opt_logsexp_IgE_SL_bootstrap(1,1),quantile(x_opt_logsexp_IgE_SL_bootstrap(:,1),[0.025,0.25,0.5,0.75,0.975]);
    x_opt_logsexp_IgE_SL_bootstrap(1,2),quantile(x_opt_logsexp_IgE_SL_bootstrap(:,2),[0.025,0.25,0.5,0.75,0.975]);
    x_opt_logsexp_IgE_SL_bootstrap_thalf(1,2),quantile(x_opt_logsexp_IgE_SL_bootstrap_thalf(:,2),[0.025,0.25,0.5,0.75,0.975]);
    x_opt_logsexp_IgG1_SL_bootstrap(1,1),quantile(x_opt_logsexp_IgG1_SL_bootstrap(:,1),[0.025,0.25,0.5,0.75,0.975]);
    x_opt_logsexp_IgG1_SL_bootstrap(1,2),quantile(x_opt_logsexp_IgG1_SL_bootstrap(:,2),[0.025,0.25,0.5,0.75,0.975]);
    x_opt_logsexp_IgG1_SL_bootstrap_thalf(1,2),quantile(x_opt_logsexp_IgG1_SL_bootstrap_thalf(:,2),[0.025,0.25,0.5,0.75,0.975]);
    x_opt_logsexp_IgE_BMSL_bootstrap(1,1),quantile(x_opt_logsexp_IgE_BMSL_bootstrap(:,1),[0.025,0.25,0.5,0.75,0.975]);
    x_opt_logsexp_IgE_BMSL_bootstrap(1,2),quantile(x_opt_logsexp_IgE_BMSL_bootstrap(:,2),[0.025,0.25,0.5,0.75,0.975]);
    x_opt_logsexp_IgE_BMSL_bootstrap(1,3),quantile(x_opt_logsexp_IgE_BMSL_bootstrap(:,3),[0.025,0.25,0.5,0.75,0.975]);
    x_opt_logsexp_IgE_BMSL_bootstrap_thalf(1,3),quantile(x_opt_logsexp_IgE_BMSL_bootstrap_thalf(:,3),[0.025,0.25,0.5,0.75,0.975]);
    x_opt_logsexp_IgG1_BMSL_bootstrap(1,1),quantile(x_opt_logsexp_IgG1_BMSL_bootstrap(:,1),[0.025,0.25,0.5,0.75,0.975]);
    x_opt_logsexp_IgG1_BMSL_bootstrap(1,2),quantile(x_opt_logsexp_IgG1_BMSL_bootstrap(:,2),[0.025,0.25,0.5,0.75,0.975]);
    x_opt_logsexp_IgG1_BMSL_bootstrap(1,3),quantile(x_opt_logsexp_IgG1_BMSL_bootstrap(:,3),[0.025,0.25,0.5,0.75,0.975]);
    x_opt_logsexp_IgG1_BMSL_bootstrap_thalf(1,3),quantile(x_opt_logsexp_IgG1_BMSL_bootstrap_thalf(:,3),[0.025,0.25,0.5,0.75,0.975]);
    x_opt_logsexp_IgEG1_BM_bootstrap(1,1),quantile(x_opt_logsexp_IgEG1_BM_bootstrap(:,1),[0.025,0.25,0.5,0.75,0.975]);
    x_opt_logsexp_IgEG1_BM_bootstrap(1,2),quantile(x_opt_logsexp_IgEG1_BM_bootstrap(:,2),[0.025,0.25,0.5,0.75,0.975]);
    x_opt_logsexp_IgEG1_BM_bootstrap(1,3),quantile(x_opt_logsexp_IgEG1_BM_bootstrap(:,3),[0.025,0.25,0.5,0.75,0.975]);
    x_opt_logsexp_IgEG1_BM_bootstrap_thalf(1,3),quantile(x_opt_logsexp_IgEG1_BM_bootstrap_thalf(:,3),[0.025,0.25,0.5,0.75,0.975]);
    x_opt_logsexp_IgEG1_SL_bootstrap(1,1),quantile(x_opt_logsexp_IgEG1_SL_bootstrap(:,1),[0.025,0.25,0.5,0.75,0.975]);
    x_opt_logsexp_IgEG1_SL_bootstrap(1,2),quantile(x_opt_logsexp_IgEG1_SL_bootstrap(:,2),[0.025,0.25,0.5,0.75,0.975]);
    x_opt_logsexp_IgEG1_SL_bootstrap(1,3),quantile(x_opt_logsexp_IgEG1_SL_bootstrap(:,3),[0.025,0.25,0.5,0.75,0.975]);
    x_opt_logsexp_IgEG1_SL_bootstrap_thalf(1,3),quantile(x_opt_logsexp_IgEG1_SL_bootstrap_thalf(:,3),[0.025,0.25,0.5,0.75,0.975]);
    x_opt_logsexp_IgEG1_BMSL_bootstrap(1,1),quantile(x_opt_logsexp_IgEG1_BMSL_bootstrap(:,1),[0.025,0.25,0.5,0.75,0.975]);
    x_opt_logsexp_IgEG1_BMSL_bootstrap(1,2),quantile(x_opt_logsexp_IgEG1_BMSL_bootstrap(:,2),[0.025,0.25,0.5,0.75,0.975]);
    x_opt_logsexp_IgEG1_BMSL_bootstrap(1,3),quantile(x_opt_logsexp_IgEG1_BMSL_bootstrap(:,3),[0.025,0.25,0.5,0.75,0.975]);
    x_opt_logsexp_IgEG1_BMSL_bootstrap(1,4),quantile(x_opt_logsexp_IgEG1_BMSL_bootstrap(:,4),[0.025,0.25,0.5,0.75,0.975]);
    x_opt_logsexp_IgEG1_BMSL_bootstrap(1,5),quantile(x_opt_logsexp_IgEG1_BMSL_bootstrap(:,5),[0.025,0.25,0.5,0.75,0.975]);
    x_opt_logsexp_IgEG1_BMSL_bootstrap_thalf(1,5),quantile(x_opt_logsexp_IgEG1_BMSL_bootstrap_thalf(:,5),[0.025,0.25,0.5,0.75,0.975])];

logsexp_params_rownames = {'y0_IgE_BM','k_1_IgE_BM','t_1_IgE_BM','y0_IgG1_BM','k_1_IgG1_BM','t_1_IgG1_BM','y0_IgE_SL','k_1_IgE_SL','t_1_IgE_SL','y0_IgG1_SL','k_1_IgG1_SL','t_1_IgG1_SL','y0_BM_IgE_BMSL','y0_SL_IgE_BMSL','k_1_IgE_BMSL','t_1_IgE_BMSL','y0_BM_IgG1_BMSL','y0_SL_IgG1_BMSL','k_1_IgG1_BMSL','t_1_IgG1_BMSL','y0_IgE_IgEG1_BM','y0_IgG1_IgEG1_BM','k_1_IgEG1_BM','t_1_IgEG1_BM','y0_IgE_IgEG1_SL','y0_IgG1_IgEG1_SL','k_1_IgEG1_SL','t_1_IgEG1_SL','y0_IgE_BM_IgEG1_BMSL','y0_IgG1_BM_IgEG1_BMSL','y0_IgE_SL_IgEG1_BMSL','y0_IgG1_SL_IgEG1_BMSL','k_1_IgEG1_BMSL','t_1_IgEG1_BMSL'};
logsexp_params_variablenames = {'Best fit','2.5th centile','25th centrile','50th centile','75th centile', '97.5th centile'};
logsexp_params = array2table(logsexp_params, 'RowNames', logsexp_params_rownames, 'VariableNames', logsexp_params_variablenames);
writetable(logsexp_params, strcat('logsexp_params_',starttimestr,'.csv'), 'WriteRowNames', true, 'WriteVariableNames', true)

%Single exponential offset model
savefig(f5, strcat('sexpoffset_individual_logfits_',starttimestr))
saveas(f5, strcat('sexpoffset_individual_logfits_',starttimestr,'.svg'))
saveas(f5, strcat('sexpoffset_individual_logfits_',starttimestr,'.png'))
savefig(f6, strcat('sexpoffset_BMSLcombined_logfits_',starttimestr))
saveas(f6, strcat('sexpoffset_BMSLcombined_logfits_',starttimestr,'.svg'))
saveas(f6, strcat('sexpoffset_BMSLcombined_logfits_',starttimestr,'.png'))
savefig(f7, strcat('sexpoffset_IgEG1combined_logfits_',starttimestr))
saveas(f7, strcat('sexpoffset_IgEG1combined_logfits_',starttimestr,'.svg'))
saveas(f7, strcat('sexpoffset_IgEG1combined_logfits_',starttimestr,'.png'))
savefig(f8, strcat('sexpoffset_BMSLIgEG1combined_logfits_',starttimestr))
saveas(f8, strcat('sexpoffset_BMSLIgEG1combined_logfits_',starttimestr,'.svg'))
saveas(f8, strcat('sexpoffset_BMSLIgEG1combined_logfits_',starttimestr,'.png'))

logsexpoffset_params = [x_opt_logsexpoffset_IgE_BM_bootstrap(1,1),quantile(x_opt_logsexpoffset_IgE_BM_bootstrap(:,1),[0.025,0.25,0.5,0.75,0.975]);
    x_opt_logsexpoffset_IgE_BM_bootstrap(1,2),quantile(x_opt_logsexpoffset_IgE_BM_bootstrap(:,2),[0.025,0.25,0.5,0.75,0.975]);
    x_opt_logsexpoffset_IgE_BM_bootstrap(1,3),quantile(x_opt_logsexpoffset_IgE_BM_bootstrap(:,3),[0.025,0.25,0.5,0.75,0.975]);
    x_opt_logsexpoffset_IgE_BM_bootstrap_thalf(1,3),quantile(x_opt_logsexpoffset_IgE_BM_bootstrap_thalf(:,3),[0.025,0.25,0.5,0.75,0.975]);
    x_opt_logsexpoffset_IgG1_BM_bootstrap(1,1),quantile(x_opt_logsexpoffset_IgG1_BM_bootstrap(:,1),[0.025,0.25,0.5,0.75,0.975]);
    x_opt_logsexpoffset_IgG1_BM_bootstrap(1,2),quantile(x_opt_logsexpoffset_IgG1_BM_bootstrap(:,2),[0.025,0.25,0.5,0.75,0.975]);
    x_opt_logsexpoffset_IgG1_BM_bootstrap(1,3),quantile(x_opt_logsexpoffset_IgG1_BM_bootstrap(:,3),[0.025,0.25,0.5,0.75,0.975]);
    x_opt_logsexpoffset_IgG1_BM_bootstrap_thalf(1,3),quantile(x_opt_logsexpoffset_IgG1_BM_bootstrap_thalf(:,3),[0.025,0.25,0.5,0.75,0.975]);
    x_opt_logsexpoffset_IgE_SL_bootstrap(1,1),quantile(x_opt_logsexpoffset_IgE_SL_bootstrap(:,1),[0.025,0.25,0.5,0.75,0.975]);
    x_opt_logsexpoffset_IgE_SL_bootstrap(1,2),quantile(x_opt_logsexpoffset_IgE_SL_bootstrap(:,2),[0.025,0.25,0.5,0.75,0.975]);
    x_opt_logsexpoffset_IgE_SL_bootstrap(1,3),quantile(x_opt_logsexpoffset_IgE_SL_bootstrap(:,3),[0.025,0.25,0.5,0.75,0.975]);
    x_opt_logsexpoffset_IgE_SL_bootstrap_thalf(1,3),quantile(x_opt_logsexpoffset_IgE_SL_bootstrap_thalf(:,3),[0.025,0.25,0.5,0.75,0.975]);
    x_opt_logsexpoffset_IgG1_SL_bootstrap(1,1),quantile(x_opt_logsexpoffset_IgG1_SL_bootstrap(:,1),[0.025,0.25,0.5,0.75,0.975]);
    x_opt_logsexpoffset_IgG1_SL_bootstrap(1,2),quantile(x_opt_logsexpoffset_IgG1_SL_bootstrap(:,2),[0.025,0.25,0.5,0.75,0.975]);
    x_opt_logsexpoffset_IgG1_SL_bootstrap(1,3),quantile(x_opt_logsexpoffset_IgG1_SL_bootstrap(:,3),[0.025,0.25,0.5,0.75,0.975]);
    x_opt_logsexpoffset_IgG1_SL_bootstrap_thalf(1,3),quantile(x_opt_logsexpoffset_IgG1_SL_bootstrap_thalf(:,3),[0.025,0.25,0.5,0.75,0.975]);
    x_opt_logsexpoffset_IgE_BMSL_bootstrap(1,1),quantile(x_opt_logsexpoffset_IgE_BMSL_bootstrap(:,1),[0.025,0.25,0.5,0.75,0.975]);
    x_opt_logsexpoffset_IgE_BMSL_bootstrap(1,2),quantile(x_opt_logsexpoffset_IgE_BMSL_bootstrap(:,2),[0.025,0.25,0.5,0.75,0.975]);
    x_opt_logsexpoffset_IgE_BMSL_bootstrap(1,3),quantile(x_opt_logsexpoffset_IgE_BMSL_bootstrap(:,3),[0.025,0.25,0.5,0.75,0.975]);
    x_opt_logsexpoffset_IgE_BMSL_bootstrap(1,4),quantile(x_opt_logsexpoffset_IgE_BMSL_bootstrap(:,4),[0.025,0.25,0.5,0.75,0.975]);
    x_opt_logsexpoffset_IgE_BMSL_bootstrap(1,5),quantile(x_opt_logsexpoffset_IgE_BMSL_bootstrap(:,5),[0.025,0.25,0.5,0.75,0.975]);
    x_opt_logsexpoffset_IgE_BMSL_bootstrap_thalf(1,5),quantile(x_opt_logsexpoffset_IgE_BMSL_bootstrap_thalf(:,5),[0.025,0.25,0.5,0.75,0.975]);
    x_opt_logsexpoffset_IgG1_BMSL_bootstrap(1,1),quantile(x_opt_logsexpoffset_IgG1_BMSL_bootstrap(:,1),[0.025,0.25,0.5,0.75,0.975]);
    x_opt_logsexpoffset_IgG1_BMSL_bootstrap(1,2),quantile(x_opt_logsexpoffset_IgG1_BMSL_bootstrap(:,2),[0.025,0.25,0.5,0.75,0.975]);
    x_opt_logsexpoffset_IgG1_BMSL_bootstrap(1,3),quantile(x_opt_logsexpoffset_IgG1_BMSL_bootstrap(:,3),[0.025,0.25,0.5,0.75,0.975]);
    x_opt_logsexpoffset_IgG1_BMSL_bootstrap(1,4),quantile(x_opt_logsexpoffset_IgG1_BMSL_bootstrap(:,4),[0.025,0.25,0.5,0.75,0.975]);
    x_opt_logsexpoffset_IgG1_BMSL_bootstrap(1,5),quantile(x_opt_logsexpoffset_IgG1_BMSL_bootstrap(:,5),[0.025,0.25,0.5,0.75,0.975]);
    x_opt_logsexpoffset_IgG1_BMSL_bootstrap_thalf(1,5),quantile(x_opt_logsexpoffset_IgG1_BMSL_bootstrap_thalf(:,5),[0.025,0.25,0.5,0.75,0.975]);
    x_opt_logsexpoffset_IgEG1_BM_bootstrap(1,1),quantile(x_opt_logsexpoffset_IgEG1_BM_bootstrap(:,1),[0.025,0.25,0.5,0.75,0.975]);
    x_opt_logsexpoffset_IgEG1_BM_bootstrap(1,2),quantile(x_opt_logsexpoffset_IgEG1_BM_bootstrap(:,2),[0.025,0.25,0.5,0.75,0.975]);
    x_opt_logsexpoffset_IgEG1_BM_bootstrap(1,3),quantile(x_opt_logsexpoffset_IgEG1_BM_bootstrap(:,3),[0.025,0.25,0.5,0.75,0.975]);
    x_opt_logsexpoffset_IgEG1_BM_bootstrap(1,4),quantile(x_opt_logsexpoffset_IgEG1_BM_bootstrap(:,4),[0.025,0.25,0.5,0.75,0.975]);
    x_opt_logsexpoffset_IgEG1_BM_bootstrap(1,5),quantile(x_opt_logsexpoffset_IgEG1_BM_bootstrap(:,5),[0.025,0.25,0.5,0.75,0.975]);
    x_opt_logsexpoffset_IgEG1_BM_bootstrap_thalf(1,5),quantile(x_opt_logsexpoffset_IgEG1_BM_bootstrap_thalf(:,5),[0.025,0.25,0.5,0.75,0.975]);
    x_opt_logsexpoffset_IgEG1_SL_bootstrap(1,1),quantile(x_opt_logsexpoffset_IgEG1_SL_bootstrap(:,1),[0.025,0.25,0.5,0.75,0.975]);
    x_opt_logsexpoffset_IgEG1_SL_bootstrap(1,2),quantile(x_opt_logsexpoffset_IgEG1_SL_bootstrap(:,2),[0.025,0.25,0.5,0.75,0.975]);
    x_opt_logsexpoffset_IgEG1_SL_bootstrap(1,3),quantile(x_opt_logsexpoffset_IgEG1_SL_bootstrap(:,3),[0.025,0.25,0.5,0.75,0.975]);
    x_opt_logsexpoffset_IgEG1_SL_bootstrap(1,4),quantile(x_opt_logsexpoffset_IgEG1_SL_bootstrap(:,4),[0.025,0.25,0.5,0.75,0.975]);
    x_opt_logsexpoffset_IgEG1_SL_bootstrap(1,5),quantile(x_opt_logsexpoffset_IgEG1_SL_bootstrap(:,5),[0.025,0.25,0.5,0.75,0.975]);
    x_opt_logsexpoffset_IgEG1_SL_bootstrap_thalf(1,5),quantile(x_opt_logsexpoffset_IgEG1_SL_bootstrap_thalf(:,5),[0.025,0.25,0.5,0.75,0.975]);
    x_opt_logsexpoffset_IgEG1_BMSL_bootstrap(1,1),quantile(x_opt_logsexpoffset_IgEG1_BMSL_bootstrap(:,1),[0.025,0.25,0.5,0.75,0.975]);
    x_opt_logsexpoffset_IgEG1_BMSL_bootstrap(1,2),quantile(x_opt_logsexpoffset_IgEG1_BMSL_bootstrap(:,2),[0.025,0.25,0.5,0.75,0.975]);
    x_opt_logsexpoffset_IgEG1_BMSL_bootstrap(1,3),quantile(x_opt_logsexpoffset_IgEG1_BMSL_bootstrap(:,3),[0.025,0.25,0.5,0.75,0.975]);
    x_opt_logsexpoffset_IgEG1_BMSL_bootstrap(1,4),quantile(x_opt_logsexpoffset_IgEG1_BMSL_bootstrap(:,4),[0.025,0.25,0.5,0.75,0.975]);
    x_opt_logsexpoffset_IgEG1_BMSL_bootstrap(1,5),quantile(x_opt_logsexpoffset_IgEG1_BMSL_bootstrap(:,5),[0.025,0.25,0.5,0.75,0.975]);
    x_opt_logsexpoffset_IgEG1_BMSL_bootstrap(1,6),quantile(x_opt_logsexpoffset_IgEG1_BMSL_bootstrap(:,6),[0.025,0.25,0.5,0.75,0.975]);
    x_opt_logsexpoffset_IgEG1_BMSL_bootstrap(1,7),quantile(x_opt_logsexpoffset_IgEG1_BMSL_bootstrap(:,7),[0.025,0.25,0.5,0.75,0.975]);
    x_opt_logsexpoffset_IgEG1_BMSL_bootstrap(1,8),quantile(x_opt_logsexpoffset_IgEG1_BMSL_bootstrap(:,8),[0.025,0.25,0.5,0.75,0.975]);
    x_opt_logsexpoffset_IgEG1_BMSL_bootstrap(1,9),quantile(x_opt_logsexpoffset_IgEG1_BMSL_bootstrap(:,9),[0.025,0.25,0.5,0.75,0.975]);
    x_opt_logsexpoffset_IgEG1_BMSL_bootstrap_thalf(1,9),quantile(x_opt_logsexpoffset_IgEG1_BMSL_bootstrap_thalf(:,9),[0.025,0.25,0.5,0.75,0.975])];

logsexpoffset_params_rownames = {'y0_IgE_BM','f_IgE_BM','k_1_IgE_BM','t_1_IgE_BM','y0_IgG1_BM','f_IgG1_BM','k_1_IgG1_BM','t_1_IgG1_BM','y0_IgE_SL','f_IgE_SL','k_1_IgE_SL','t_1_IgE_SL','y0_IgG1_SL','f_IgG1_SL','k_1_IgG1_SL','t_1_IgG1_SL','y0_BM_IgE_BMSL','y0_SL_IgE_BMSL','f_BM_IgE_BMSL','f_SL_IgE_BMSL','k_1_IgE_BMSL','t_1_IgE_BMSL','y0_BM_IgG1_BMSL','y0_SL_IgG1_BMSL','f_BM_IgG1_BMSL','f_SL_IgG1_BMSL','k_1_IgG1_BMSL','t_1_IgG1_BMSL','y0_IgE_IgEG1_BM','y0_IgG1_IgEG1_BM','f_IgE_IgEG1_BM','f_IgG1_IgEG1_BM','k_1_IgEG1_BM','t_1_IgEG1_BM','y0_IgE_IgEG1_SL','y0_IgG1_IgEG1_SL','f_IgE_IgEG1_SL','f_IgG1_IgEG1_SL','k_1_IgEG1_SL','t_1_IgEG1_SL','y0_IgE_BM_IgEG1_BMSL','y0_IgG1_BM_IgEG1_BMSL','y0_IgE_SL_IgEG1_BMSL','y0_IgG1_SL_IgEG1_BMSL','f_IgE_BM_IgEG1_BMSL','f_IgG1_BM_IgEG1_BMSL','f_IgE_SL_IgEG1_BMSL','f_IgG1_SL_IgEG1_BMSL','k_1_IgEG1_BMSL','t_1_IgEG1_BMSL'};
logsexpoffset_params_variablenames = {'Best fit','2.5th centile','25th centrile','50th centile','75th centile', '97.5th centile'};
logsexpoffset_params = array2table(logsexpoffset_params, 'RowNames', logsexpoffset_params_rownames, 'VariableNames', logsexpoffset_params_variablenames);
writetable(logsexpoffset_params, strcat('logsexpoffset_params_',starttimestr,'.csv'), 'WriteRowNames', true, 'WriteVariableNames', true)

%Double exponential model
savefig(f9, strcat('dexp_individual_logfits_',starttimestr))
saveas(f9, strcat('dexp_individual_logfits_',starttimestr,'.svg'))
saveas(f9, strcat('dexp_individual_logfits_',starttimestr,'.png'))
savefig(f10, strcat('dexp_BMSLcombined_logfits_',starttimestr))
saveas(f10, strcat('dexp_BMSLcombined_logfits_',starttimestr,'.svg'))
saveas(f10, strcat('dexp_BMSLcombined_logfits_',starttimestr,'.png'))
savefig(f11, strcat('dexp_IgEG1combined_logfits_',starttimestr))
saveas(f11, strcat('dexp_IgEG1combined_logfits_',starttimestr,'.svg'))
saveas(f11, strcat('dexp_IgEG1combined_logfits_',starttimestr,'.png'))
savefig(f12, strcat('dexp_BMSLIgEG1combined_logfits_',starttimestr))
saveas(f12, strcat('dexp_BMSLIgEG1combined_logfits_',starttimestr,'.svg'))
saveas(f12, strcat('dexp_BMSLIgEG1combined_logfits_',starttimestr,'.png'))

logdexp_params = [x_opt_logdexp_IgE_BM_bootstrap(1,1),quantile(x_opt_logdexp_IgE_BM_bootstrap(:,1),[0.025,0.25,0.5,0.75,0.975]);
    x_opt_logdexp_IgE_BM_bootstrap(1,2),quantile(x_opt_logdexp_IgE_BM_bootstrap(:,2),[0.025,0.25,0.5,0.75,0.975]);
    x_opt_logdexp_IgE_BM_bootstrap(1,3),quantile(x_opt_logdexp_IgE_BM_bootstrap(:,3),[0.025,0.25,0.5,0.75,0.975]);
    x_opt_logdexp_IgE_BM_bootstrap_thalf(1,3),quantile(x_opt_logdexp_IgE_BM_bootstrap_thalf(:,3),[0.025,0.25,0.5,0.75,0.975]);
    x_opt_logdexp_IgE_BM_bootstrap(1,4),quantile(x_opt_logdexp_IgE_BM_bootstrap(:,4),[0.025,0.25,0.5,0.75,0.975]);
    x_opt_logdexp_IgE_BM_bootstrap_thalf(1,4),quantile(x_opt_logdexp_IgE_BM_bootstrap_thalf(:,4),[0.025,0.25,0.5,0.75,0.975]);
    x_opt_logdexp_IgG1_BM_bootstrap(1,1),quantile(x_opt_logdexp_IgG1_BM_bootstrap(:,1),[0.025,0.25,0.5,0.75,0.975]);
    x_opt_logdexp_IgG1_BM_bootstrap(1,2),quantile(x_opt_logdexp_IgG1_BM_bootstrap(:,2),[0.025,0.25,0.5,0.75,0.975]);
    x_opt_logdexp_IgG1_BM_bootstrap(1,3),quantile(x_opt_logdexp_IgG1_BM_bootstrap(:,3),[0.025,0.25,0.5,0.75,0.975]);
    x_opt_logdexp_IgG1_BM_bootstrap_thalf(1,3),quantile(x_opt_logdexp_IgG1_BM_bootstrap_thalf(:,3),[0.025,0.25,0.5,0.75,0.975]);
    x_opt_logdexp_IgG1_BM_bootstrap(1,4),quantile(x_opt_logdexp_IgG1_BM_bootstrap(:,4),[0.025,0.25,0.5,0.75,0.975]);
    x_opt_logdexp_IgG1_BM_bootstrap_thalf(1,4),quantile(x_opt_logdexp_IgG1_BM_bootstrap_thalf(:,4),[0.025,0.25,0.5,0.75,0.975]);
    x_opt_logdexp_IgE_SL_bootstrap(1,1),quantile(x_opt_logdexp_IgE_SL_bootstrap(:,1),[0.025,0.25,0.5,0.75,0.975]);
    x_opt_logdexp_IgE_SL_bootstrap(1,2),quantile(x_opt_logdexp_IgE_SL_bootstrap(:,2),[0.025,0.25,0.5,0.75,0.975]);
    x_opt_logdexp_IgE_SL_bootstrap(1,3),quantile(x_opt_logdexp_IgE_SL_bootstrap(:,3),[0.025,0.25,0.5,0.75,0.975]);
    x_opt_logdexp_IgE_SL_bootstrap_thalf(1,3),quantile(x_opt_logdexp_IgE_SL_bootstrap_thalf(:,3),[0.025,0.25,0.5,0.75,0.975]);
    x_opt_logdexp_IgE_SL_bootstrap(1,4),quantile(x_opt_logdexp_IgE_SL_bootstrap(:,4),[0.025,0.25,0.5,0.75,0.975]);
    x_opt_logdexp_IgE_SL_bootstrap_thalf(1,4),quantile(x_opt_logdexp_IgE_SL_bootstrap_thalf(:,4),[0.025,0.25,0.5,0.75,0.975]);
    x_opt_logdexp_IgG1_SL_bootstrap(1,1),quantile(x_opt_logdexp_IgG1_SL_bootstrap(:,1),[0.025,0.25,0.5,0.75,0.975]);
    x_opt_logdexp_IgG1_SL_bootstrap(1,2),quantile(x_opt_logdexp_IgG1_SL_bootstrap(:,2),[0.025,0.25,0.5,0.75,0.975]);
    x_opt_logdexp_IgG1_SL_bootstrap(1,3),quantile(x_opt_logdexp_IgG1_SL_bootstrap(:,3),[0.025,0.25,0.5,0.75,0.975]);
    x_opt_logdexp_IgG1_SL_bootstrap_thalf(1,3),quantile(x_opt_logdexp_IgG1_SL_bootstrap_thalf(:,3),[0.025,0.25,0.5,0.75,0.975]);
    x_opt_logdexp_IgG1_SL_bootstrap(1,4),quantile(x_opt_logdexp_IgG1_SL_bootstrap(:,4),[0.025,0.25,0.5,0.75,0.975]);
    x_opt_logdexp_IgG1_SL_bootstrap_thalf(1,4),quantile(x_opt_logdexp_IgG1_SL_bootstrap_thalf(:,4),[0.025,0.25,0.5,0.75,0.975]);
    x_opt_logdexp_IgE_BMSL_bootstrap(1,1),quantile(x_opt_logdexp_IgE_BMSL_bootstrap(:,1),[0.025,0.25,0.5,0.75,0.975]);
    x_opt_logdexp_IgE_BMSL_bootstrap(1,2),quantile(x_opt_logdexp_IgE_BMSL_bootstrap(:,2),[0.025,0.25,0.5,0.75,0.975]);
    x_opt_logdexp_IgE_BMSL_bootstrap(1,3),quantile(x_opt_logdexp_IgE_BMSL_bootstrap(:,3),[0.025,0.25,0.5,0.75,0.975]);
    x_opt_logdexp_IgE_BMSL_bootstrap(1,4),quantile(x_opt_logdexp_IgE_BMSL_bootstrap(:,4),[0.025,0.25,0.5,0.75,0.975]);
    x_opt_logdexp_IgE_BMSL_bootstrap(1,5),quantile(x_opt_logdexp_IgE_BMSL_bootstrap(:,5),[0.025,0.25,0.5,0.75,0.975]);
    x_opt_logdexp_IgE_BMSL_bootstrap_thalf(1,5),quantile(x_opt_logdexp_IgE_BMSL_bootstrap_thalf(:,5),[0.025,0.25,0.5,0.75,0.975]);
    x_opt_logdexp_IgE_BMSL_bootstrap(1,6),quantile(x_opt_logdexp_IgE_BMSL_bootstrap(:,6),[0.025,0.25,0.5,0.75,0.975]);
    x_opt_logdexp_IgE_BMSL_bootstrap_thalf(1,6),quantile(x_opt_logdexp_IgE_BMSL_bootstrap_thalf(:,6),[0.025,0.25,0.5,0.75,0.975]);
    x_opt_logdexp_IgG1_BMSL_bootstrap(1,1),quantile(x_opt_logdexp_IgG1_BMSL_bootstrap(:,1),[0.025,0.25,0.5,0.75,0.975]);
    x_opt_logdexp_IgG1_BMSL_bootstrap(1,2),quantile(x_opt_logdexp_IgG1_BMSL_bootstrap(:,2),[0.025,0.25,0.5,0.75,0.975]);
    x_opt_logdexp_IgG1_BMSL_bootstrap(1,3),quantile(x_opt_logdexp_IgG1_BMSL_bootstrap(:,3),[0.025,0.25,0.5,0.75,0.975]);
    x_opt_logdexp_IgG1_BMSL_bootstrap(1,4),quantile(x_opt_logdexp_IgG1_BMSL_bootstrap(:,4),[0.025,0.25,0.5,0.75,0.975]);
    x_opt_logdexp_IgG1_BMSL_bootstrap(1,5),quantile(x_opt_logdexp_IgG1_BMSL_bootstrap(:,5),[0.025,0.25,0.5,0.75,0.975]);
    x_opt_logdexp_IgG1_BMSL_bootstrap_thalf(1,5),quantile(x_opt_logdexp_IgG1_BMSL_bootstrap_thalf(:,5),[0.025,0.25,0.5,0.75,0.975]);
    x_opt_logdexp_IgG1_BMSL_bootstrap(1,6),quantile(x_opt_logdexp_IgG1_BMSL_bootstrap(:,6),[0.025,0.25,0.5,0.75,0.975]);
    x_opt_logdexp_IgG1_BMSL_bootstrap_thalf(1,6),quantile(x_opt_logdexp_IgG1_BMSL_bootstrap_thalf(:,6),[0.025,0.25,0.5,0.75,0.975]);
    x_opt_logdexp_IgEG1_BM_bootstrap(1,1),quantile(x_opt_logdexp_IgEG1_BM_bootstrap(:,1),[0.025,0.25,0.5,0.75,0.975]);
    x_opt_logdexp_IgEG1_BM_bootstrap(1,2),quantile(x_opt_logdexp_IgEG1_BM_bootstrap(:,2),[0.025,0.25,0.5,0.75,0.975]);
    x_opt_logdexp_IgEG1_BM_bootstrap(1,3),quantile(x_opt_logdexp_IgEG1_BM_bootstrap(:,3),[0.025,0.25,0.5,0.75,0.975]);
    x_opt_logdexp_IgEG1_BM_bootstrap(1,4),quantile(x_opt_logdexp_IgEG1_BM_bootstrap(:,4),[0.025,0.25,0.5,0.75,0.975]);
    x_opt_logdexp_IgEG1_BM_bootstrap(1,5),quantile(x_opt_logdexp_IgEG1_BM_bootstrap(:,5),[0.025,0.25,0.5,0.75,0.975]);
    x_opt_logdexp_IgEG1_BM_bootstrap_thalf(1,5),quantile(x_opt_logdexp_IgEG1_BM_bootstrap_thalf(:,5),[0.025,0.25,0.5,0.75,0.975]);
    x_opt_logdexp_IgEG1_BM_bootstrap(1,6),quantile(x_opt_logdexp_IgEG1_BM_bootstrap(:,6),[0.025,0.25,0.5,0.75,0.975]);
    x_opt_logdexp_IgEG1_BM_bootstrap_thalf(1,6),quantile(x_opt_logdexp_IgEG1_BM_bootstrap_thalf(:,6),[0.025,0.25,0.5,0.75,0.975]);
    x_opt_logdexp_IgEG1_SL_bootstrap(1,1),quantile(x_opt_logdexp_IgEG1_SL_bootstrap(:,1),[0.025,0.25,0.5,0.75,0.975]);
    x_opt_logdexp_IgEG1_SL_bootstrap(1,2),quantile(x_opt_logdexp_IgEG1_SL_bootstrap(:,2),[0.025,0.25,0.5,0.75,0.975]);
    x_opt_logdexp_IgEG1_SL_bootstrap(1,3),quantile(x_opt_logdexp_IgEG1_SL_bootstrap(:,3),[0.025,0.25,0.5,0.75,0.975]);
    x_opt_logdexp_IgEG1_SL_bootstrap(1,4),quantile(x_opt_logdexp_IgEG1_SL_bootstrap(:,4),[0.025,0.25,0.5,0.75,0.975]);
    x_opt_logdexp_IgEG1_SL_bootstrap(1,5),quantile(x_opt_logdexp_IgEG1_SL_bootstrap(:,5),[0.025,0.25,0.5,0.75,0.975]);
    x_opt_logdexp_IgEG1_SL_bootstrap_thalf(1,5),quantile(x_opt_logdexp_IgEG1_SL_bootstrap_thalf(:,5),[0.025,0.25,0.5,0.75,0.975]);
    x_opt_logdexp_IgEG1_SL_bootstrap(1,6),quantile(x_opt_logdexp_IgEG1_SL_bootstrap(:,6),[0.025,0.25,0.5,0.75,0.975]);
    x_opt_logdexp_IgEG1_SL_bootstrap_thalf(1,6),quantile(x_opt_logdexp_IgEG1_SL_bootstrap_thalf(:,6),[0.025,0.25,0.5,0.75,0.975]);
    x_opt_logdexp_IgEG1_BMSL_bootstrap(1,1),quantile(x_opt_logdexp_IgEG1_BMSL_bootstrap(:,1),[0.025,0.25,0.5,0.75,0.975]);
    x_opt_logdexp_IgEG1_BMSL_bootstrap(1,2),quantile(x_opt_logdexp_IgEG1_BMSL_bootstrap(:,2),[0.025,0.25,0.5,0.75,0.975]);
    x_opt_logdexp_IgEG1_BMSL_bootstrap(1,3),quantile(x_opt_logdexp_IgEG1_BMSL_bootstrap(:,3),[0.025,0.25,0.5,0.75,0.975]);
    x_opt_logdexp_IgEG1_BMSL_bootstrap(1,4),quantile(x_opt_logdexp_IgEG1_BMSL_bootstrap(:,4),[0.025,0.25,0.5,0.75,0.975]);
    x_opt_logdexp_IgEG1_BMSL_bootstrap(1,5),quantile(x_opt_logdexp_IgEG1_BMSL_bootstrap(:,5),[0.025,0.25,0.5,0.75,0.975]);
    x_opt_logdexp_IgEG1_BMSL_bootstrap(1,6),quantile(x_opt_logdexp_IgEG1_BMSL_bootstrap(:,6),[0.025,0.25,0.5,0.75,0.975]);
    x_opt_logdexp_IgEG1_BMSL_bootstrap(1,7),quantile(x_opt_logdexp_IgEG1_BMSL_bootstrap(:,7),[0.025,0.25,0.5,0.75,0.975]);
    x_opt_logdexp_IgEG1_BMSL_bootstrap(1,8),quantile(x_opt_logdexp_IgEG1_BMSL_bootstrap(:,8),[0.025,0.25,0.5,0.75,0.975]);
    x_opt_logdexp_IgEG1_BMSL_bootstrap(1,9),quantile(x_opt_logdexp_IgEG1_BMSL_bootstrap(:,9),[0.025,0.25,0.5,0.75,0.975]);
    x_opt_logdexp_IgEG1_BMSL_bootstrap_thalf(1,9),quantile(x_opt_logdexp_IgEG1_BMSL_bootstrap_thalf(:,9),[0.025,0.25,0.5,0.75,0.975]);
    x_opt_logdexp_IgEG1_BMSL_bootstrap(1,10),quantile(x_opt_logdexp_IgEG1_BMSL_bootstrap(:,10),[0.025,0.25,0.5,0.75,0.975]);
    x_opt_logdexp_IgEG1_BMSL_bootstrap_thalf(1,10),quantile(x_opt_logdexp_IgEG1_BMSL_bootstrap_thalf(:,10),[0.025,0.25,0.5,0.75,0.975])];

logdexp_params_rownames = {'y0_IgE_BM','f_IgE_BM','k_1_IgE_BM','t_1_IgE_BM','k_2_IgE_BM','t_2_IgE_BM','y0_IgG1_BM','f_IgG1_BM','k_1_IgG1_BM','t_1_IgG1_BM','k_2_IgG1_BM','t_2_IgG1_BM','y0_IgE_SL','f_IgE_SL','k_1_IgE_SL','t_1_IgE_SL','k_2_IgE_SL','t_2_IgE_SL','y0_IgG1_SL','f_IgG1_SL','k_1_IgG1_SL','t_1_IgG1_SL','k_2_IgG1_SL','t_2_IgG1_SL','y0_BM_IgE_BMSL','y0_SL_IgE_BMSL','f_BM_IgE_BMSL','f_SL_IgE_BMSL','k_1_IgE_BMSL','t_1_IgE_BMSL','k_2_IgE_BMSL','t_2_IgE_BMSL','y0_BM_IgG1_BMSL','y0_SL_IgG1_BMSL','f_BM_IgG1_BMSL','f_SL_IgG1_BMSL','k_1_IgG1_BMSL','t_1_IgG1_BMSL','k_2_IgG1_BMSL','t_2_IgG1_BMSL','y0_IgE_IgEG1_BM','y0_IgG1_IgEG1_BM','f_IgE_IgEG1_BM','f_IgG1_IgEG1_BM','k_1_IgEG1_BM','t_1_IgEG1_BM','k_2_IgEG1_BM','t_2_IgEG1_BM','y0_IgE_IgEG1_SL','y0_IgG1_IgEG1_SL','f_IgE_IgEG1_SL','f_IgG1_IgEG1_SL','k_1_IgEG1_SL','t_1_IgEG1_SL','k_2_IgEG1_SL','t_2_IgEG1_SL','y0_IgE_BM_IgEG1_BMSL','y0_IgG1_BM_IgEG1_BMSL','y0_IgE_SL_IgEG1_BMSL','y0_IgG1_SL_IgEG1_BMSL','f_IgE_BM_IgEG1_BMSL','f_IgG1_BM_IgEG1_BMSL','f_IgE_SL_IgEG1_BMSL','f_IgG1_SL_IgEG1_BMSL','k_1_IgEG1_BMSL','t_1_IgEG1_BMSL','k_2_IgEG1_BMSL','t_2_IgEG1_BMSL'};
logdexp_params_variablenames = {'Best fit','2.5th centile','25th centrile','50th centile','75th centile', '97.5th centile'};
logdexp_params = array2table(logdexp_params, 'RowNames', logdexp_params_rownames, 'VariableNames', logdexp_params_variablenames);
writetable(logdexp_params, strcat('logdexp_params_',starttimestr,'.csv'), 'WriteRowNames', true, 'WriteVariableNames', true)

%Lognormal steady-state model
savefig(f13, strcat('sslogn_individual_logfits_',starttimestr))
saveas(f13, strcat('sslogn_individual_logfits_',starttimestr,'.svg'))
saveas(f13, strcat('sslogn_individual_logfits_',starttimestr,'.png'))
savefig(f14, strcat('sslogn_BMSLcombined_logfits_',starttimestr))
saveas(f14, strcat('sslogn_BMSLcombined_logfits_',starttimestr,'.svg'))
saveas(f14, strcat('sslogn_BMSLcombined_logfits_',starttimestr,'.png'))
savefig(f15, strcat('sslogn_IgEG1combined_logfits_',starttimestr))
saveas(f15, strcat('sslogn_IgEG1combined_logfits_',starttimestr,'.svg'))
saveas(f15, strcat('sslogn_IgEG1combined_logfits_',starttimestr,'.png'))
savefig(f16, strcat('sslogn_BMSLIgEG1combined_logfits_',starttimestr))
saveas(f16, strcat('sslogn_BMSLIgEG1combined_logfits_',starttimestr,'.svg'))
saveas(f16, strcat('sslogn_BMSLIgEG1combined_logfits_',starttimestr,'.png'))

logsslogn_params = [x_opt_logsslogn_IgE_BM_bootstrap(1,1),quantile(x_opt_logsslogn_IgE_BM_bootstrap(:,1),[0.025,0.25,0.5,0.75,0.975]);
    x_opt_logsslogn_IgE_BM_bootstrap_linparams(1,2),quantile(x_opt_logsslogn_IgE_BM_bootstrap_linparams(:,2),[0.025,0.25,0.5,0.75,0.975]);
    x_opt_logsslogn_IgE_BM_bootstrap_linparams(1,3),quantile(x_opt_logsslogn_IgE_BM_bootstrap_linparams(:,3),[0.025,0.25,0.5,0.75,0.975]);
    x_opt_logsslogn_IgE_BM_bootstrap(1,2),quantile(x_opt_logsslogn_IgE_BM_bootstrap(:,2),[0.025,0.25,0.5,0.75,0.975]);
    x_opt_logsslogn_IgE_BM_bootstrap(1,3),quantile(x_opt_logsslogn_IgE_BM_bootstrap(:,3),[0.025,0.25,0.5,0.75,0.975]);
    x_opt_logsslogn_IgG1_BM_bootstrap(1,1),quantile(x_opt_logsslogn_IgG1_BM_bootstrap(:,1),[0.025,0.25,0.5,0.75,0.975]);
    x_opt_logsslogn_IgG1_BM_bootstrap_linparams(1,2),quantile(x_opt_logsslogn_IgG1_BM_bootstrap_linparams(:,2),[0.025,0.25,0.5,0.75,0.975]);
    x_opt_logsslogn_IgG1_BM_bootstrap_linparams(1,3),quantile(x_opt_logsslogn_IgG1_BM_bootstrap_linparams(:,3),[0.025,0.25,0.5,0.75,0.975]);
    x_opt_logsslogn_IgG1_BM_bootstrap(1,2),quantile(x_opt_logsslogn_IgG1_BM_bootstrap(:,2),[0.025,0.25,0.5,0.75,0.975]);
    x_opt_logsslogn_IgG1_BM_bootstrap(1,3),quantile(x_opt_logsslogn_IgG1_BM_bootstrap(:,3),[0.025,0.25,0.5,0.75,0.975]);
    x_opt_logsslogn_IgE_SL_bootstrap(1,1),quantile(x_opt_logsslogn_IgE_SL_bootstrap(:,1),[0.025,0.25,0.5,0.75,0.975]);
    x_opt_logsslogn_IgE_SL_bootstrap_linparams(1,2),quantile(x_opt_logsslogn_IgE_SL_bootstrap_linparams(:,2),[0.025,0.25,0.5,0.75,0.975]);
    x_opt_logsslogn_IgE_SL_bootstrap_linparams(1,3),quantile(x_opt_logsslogn_IgE_SL_bootstrap_linparams(:,3),[0.025,0.25,0.5,0.75,0.975]);
    x_opt_logsslogn_IgE_SL_bootstrap(1,2),quantile(x_opt_logsslogn_IgE_SL_bootstrap(:,2),[0.025,0.25,0.5,0.75,0.975]);
    x_opt_logsslogn_IgE_SL_bootstrap(1,3),quantile(x_opt_logsslogn_IgE_SL_bootstrap(:,3),[0.025,0.25,0.5,0.75,0.975]);
    x_opt_logsslogn_IgG1_SL_bootstrap(1,1),quantile(x_opt_logsslogn_IgG1_SL_bootstrap(:,1),[0.025,0.25,0.5,0.75,0.975]);
    x_opt_logsslogn_IgG1_SL_bootstrap_linparams(1,2),quantile(x_opt_logsslogn_IgG1_SL_bootstrap_linparams(:,2),[0.025,0.25,0.5,0.75,0.975]);
    x_opt_logsslogn_IgG1_SL_bootstrap_linparams(1,3),quantile(x_opt_logsslogn_IgG1_SL_bootstrap_linparams(:,3),[0.025,0.25,0.5,0.75,0.975]);
    x_opt_logsslogn_IgG1_SL_bootstrap(1,2),quantile(x_opt_logsslogn_IgG1_SL_bootstrap(:,2),[0.025,0.25,0.5,0.75,0.975]);
    x_opt_logsslogn_IgG1_SL_bootstrap(1,3),quantile(x_opt_logsslogn_IgG1_SL_bootstrap(:,3),[0.025,0.25,0.5,0.75,0.975]);
    x_opt_logsslogn_IgE_BMSL_bootstrap(1,1),quantile(x_opt_logsslogn_IgE_BMSL_bootstrap(:,1),[0.025,0.25,0.5,0.75,0.975]);
    x_opt_logsslogn_IgE_BMSL_bootstrap(1,2),quantile(x_opt_logsslogn_IgE_BMSL_bootstrap(:,2),[0.025,0.25,0.5,0.75,0.975]);
    x_opt_logsslogn_IgE_BMSL_bootstrap_linparams(1,3),quantile(x_opt_logsslogn_IgE_BMSL_bootstrap_linparams(:,3),[0.025,0.25,0.5,0.75,0.975]);
    x_opt_logsslogn_IgE_BMSL_bootstrap_linparams(1,4),quantile(x_opt_logsslogn_IgE_BMSL_bootstrap_linparams(:,4),[0.025,0.25,0.5,0.75,0.975]);
    x_opt_logsslogn_IgE_BMSL_bootstrap(1,3),quantile(x_opt_logsslogn_IgE_BMSL_bootstrap(:,3),[0.025,0.25,0.5,0.75,0.975]);
    x_opt_logsslogn_IgE_BMSL_bootstrap(1,4),quantile(x_opt_logsslogn_IgE_BMSL_bootstrap(:,4),[0.025,0.25,0.5,0.75,0.975]);
    x_opt_logsslogn_IgG1_BMSL_bootstrap(1,1),quantile(x_opt_logsslogn_IgG1_BMSL_bootstrap(:,1),[0.025,0.25,0.5,0.75,0.975]);
    x_opt_logsslogn_IgG1_BMSL_bootstrap(1,2),quantile(x_opt_logsslogn_IgG1_BMSL_bootstrap(:,2),[0.025,0.25,0.5,0.75,0.975]);
    x_opt_logsslogn_IgG1_BMSL_bootstrap_linparams(1,3),quantile(x_opt_logsslogn_IgG1_BMSL_bootstrap_linparams(:,3),[0.025,0.25,0.5,0.75,0.975]);
    x_opt_logsslogn_IgG1_BMSL_bootstrap_linparams(1,4),quantile(x_opt_logsslogn_IgG1_BMSL_bootstrap_linparams(:,4),[0.025,0.25,0.5,0.75,0.975]);
    x_opt_logsslogn_IgG1_BMSL_bootstrap(1,3),quantile(x_opt_logsslogn_IgG1_BMSL_bootstrap(:,3),[0.025,0.25,0.5,0.75,0.975]);
    x_opt_logsslogn_IgG1_BMSL_bootstrap(1,4),quantile(x_opt_logsslogn_IgG1_BMSL_bootstrap(:,4),[0.025,0.25,0.5,0.75,0.975]);
    x_opt_logsslogn_IgEG1_BM_bootstrap(1,1),quantile(x_opt_logsslogn_IgEG1_BM_bootstrap(:,1),[0.025,0.25,0.5,0.75,0.975]);
    x_opt_logsslogn_IgEG1_BM_bootstrap(1,2),quantile(x_opt_logsslogn_IgEG1_BM_bootstrap(:,2),[0.025,0.25,0.5,0.75,0.975]);
    x_opt_logsslogn_IgEG1_BM_bootstrap_linparams(1,3),quantile(x_opt_logsslogn_IgEG1_BM_bootstrap_linparams(:,3),[0.025,0.25,0.5,0.75,0.975]);
    x_opt_logsslogn_IgEG1_BM_bootstrap_linparams(1,4),quantile(x_opt_logsslogn_IgEG1_BM_bootstrap_linparams(:,4),[0.025,0.25,0.5,0.75,0.975]);
    x_opt_logsslogn_IgEG1_BM_bootstrap(1,3),quantile(x_opt_logsslogn_IgEG1_BM_bootstrap(:,3),[0.025,0.25,0.5,0.75,0.975]);
    x_opt_logsslogn_IgEG1_BM_bootstrap(1,4),quantile(x_opt_logsslogn_IgEG1_BM_bootstrap(:,4),[0.025,0.25,0.5,0.75,0.975]);
    x_opt_logsslogn_IgEG1_SL_bootstrap(1,1),quantile(x_opt_logsslogn_IgEG1_SL_bootstrap(:,1),[0.025,0.25,0.5,0.75,0.975]);
    x_opt_logsslogn_IgEG1_SL_bootstrap(1,2),quantile(x_opt_logsslogn_IgEG1_SL_bootstrap(:,2),[0.025,0.25,0.5,0.75,0.975]);
    x_opt_logsslogn_IgEG1_SL_bootstrap_linparams(1,3),quantile(x_opt_logsslogn_IgEG1_SL_bootstrap_linparams(:,3),[0.025,0.25,0.5,0.75,0.975]);
    x_opt_logsslogn_IgEG1_SL_bootstrap_linparams(1,4),quantile(x_opt_logsslogn_IgEG1_SL_bootstrap_linparams(:,4),[0.025,0.25,0.5,0.75,0.975]);
    x_opt_logsslogn_IgEG1_SL_bootstrap(1,3),quantile(x_opt_logsslogn_IgEG1_SL_bootstrap(:,3),[0.025,0.25,0.5,0.75,0.975]);
    x_opt_logsslogn_IgEG1_SL_bootstrap(1,4),quantile(x_opt_logsslogn_IgEG1_SL_bootstrap(:,4),[0.025,0.25,0.5,0.75,0.975]);
    x_opt_logsslogn_IgEG1_BMSL_bootstrap(1,1),quantile(x_opt_logsslogn_IgEG1_BMSL_bootstrap(:,1),[0.025,0.25,0.5,0.75,0.975]);
    x_opt_logsslogn_IgEG1_BMSL_bootstrap(1,2),quantile(x_opt_logsslogn_IgEG1_BMSL_bootstrap(:,2),[0.025,0.25,0.5,0.75,0.975]);
    x_opt_logsslogn_IgEG1_BMSL_bootstrap(1,3),quantile(x_opt_logsslogn_IgEG1_BMSL_bootstrap(:,3),[0.025,0.25,0.5,0.75,0.975]);
    x_opt_logsslogn_IgEG1_BMSL_bootstrap(1,4),quantile(x_opt_logsslogn_IgEG1_BMSL_bootstrap(:,4),[0.025,0.25,0.5,0.75,0.975]);
    x_opt_logsslogn_IgEG1_BMSL_bootstrap_linparams(1,5),quantile(x_opt_logsslogn_IgEG1_BMSL_bootstrap_linparams(:,5),[0.025,0.25,0.5,0.75,0.975]);
    x_opt_logsslogn_IgEG1_BMSL_bootstrap_linparams(1,6),quantile(x_opt_logsslogn_IgEG1_BMSL_bootstrap_linparams(:,6),[0.025,0.25,0.5,0.75,0.975]);
    x_opt_logsslogn_IgEG1_BMSL_bootstrap(1,5),quantile(x_opt_logsslogn_IgEG1_BMSL_bootstrap(:,5),[0.025,0.25,0.5,0.75,0.975]);
    x_opt_logsslogn_IgEG1_BMSL_bootstrap(1,6),quantile(x_opt_logsslogn_IgEG1_BMSL_bootstrap(:,6),[0.025,0.25,0.5,0.75,0.975])];

logsslogn_params_rownames = {'y0_IgE_BM','mu_IgE_BM','sigma_IgE_BM','m_IgE_BM','s_IgE_BM','y0_IgG1_BM','mu_IgG1_BM','sigma_IgG1_BM','m_IgG1_BM','s_IgG1_BM','y0_IgE_SL','mu_IgE_SL','sigma_IgE_SL','m_IgE_SL','s_IgE_SL','y0_IgG1_SL','mu_IgG1_SL','sigma_IgG1_SL','m_IgG1_SL','s_IgG1_SL','y0_BM_IgE_BMSL','y0_SL_IgE_BMSL','mu_IgE_BMSL','sigma_IgE_BMSL','m_IgE_BMSL','s_IgE_BMSL','y0_BM_IgG1_BMSL','y0_SL_IgG1_BMSL','mu_IgG1_BMSL','sigma_IgG1_BMSL','m_IgG1_BMSL','s_IgG1_BMSL','y0_IgE_IgEG1_BM','y0_IgG1_IgEG1_BM','mu_IgEG1_BM','sigma_IgEG1_BM','m_IgEG1_BM','s_IgEG1_BM','y0_IgE_IgEG1_SL','y0_IgG1_IgEG1_SL','mu_IgEG1_SL','sigma_IgEG1_SL','m_IgEG1_SL','s_IgEG1_SL','y0_IgE_BM_IgEG1_BMSL','y0_IgG1_BM_IgEG1_BMSL','y0_IgE_SL_IgEG1_BMSL','y0_IgG1_SL_IgEG1_BMSL','mu_IgEG1_BMSL','sigma_IgEG1_BMSL','m_IgEG1_BMSL','s_IgEG1_BMSL'};
logsslogn_params_variablenames = {'Best fit','2.5th centile','25th centrile','50th centile','75th centile', '97.5th centile'};
logsslogn_params = array2table(logsslogn_params, 'RowNames', logsslogn_params_rownames, 'VariableNames', logsslogn_params_variablenames);
writetable(logsslogn_params, strcat('logsslogn_params_',starttimestr,'.csv'), 'WriteRowNames', true, 'WriteVariableNames', true)

% logsslogn_params = [x_opt_logsslogn_IgE_BM_bootstrap(1,1),quantile(x_opt_logsslogn_IgE_BM_bootstrap(:,1),[0.025,0.25,0.5,0.75,0.975]);
%     x_opt_logsslogn_IgE_BM_bootstrap(1,2),quantile(x_opt_logsslogn_IgE_BM_bootstrap(:,2),[0.025,0.25,0.5,0.75,0.975]);
%     x_opt_logsslogn_IgE_BM_bootstrap(1,3),quantile(x_opt_logsslogn_IgE_BM_bootstrap(:,3),[0.025,0.25,0.5,0.75,0.975]);
%     x_opt_logsslogn_IgE_BM_bootstrap_logparams(1,2),quantile(x_opt_logsslogn_IgE_BM_bootstrap_logparams(:,2),[0.025,0.25,0.5,0.75,0.975]);
%     x_opt_logsslogn_IgE_BM_bootstrap_logparams(1,3),quantile(x_opt_logsslogn_IgE_BM_bootstrap_logparams(:,3),[0.025,0.25,0.5,0.75,0.975]);
%     x_opt_logsslogn_IgG1_BM_bootstrap(1,1),quantile(x_opt_logsslogn_IgG1_BM_bootstrap(:,1),[0.025,0.25,0.5,0.75,0.975]);
%     x_opt_logsslogn_IgG1_BM_bootstrap(1,2),quantile(x_opt_logsslogn_IgG1_BM_bootstrap(:,2),[0.025,0.25,0.5,0.75,0.975]);
%     x_opt_logsslogn_IgG1_BM_bootstrap(1,3),quantile(x_opt_logsslogn_IgG1_BM_bootstrap(:,3),[0.025,0.25,0.5,0.75,0.975]);
%     x_opt_logsslogn_IgG1_BM_bootstrap_logparams(1,2),quantile(x_opt_logsslogn_IgG1_BM_bootstrap_logparams(:,2),[0.025,0.25,0.5,0.75,0.975]);
%     x_opt_logsslogn_IgG1_BM_bootstrap_logparams(1,3),quantile(x_opt_logsslogn_IgG1_BM_bootstrap_logparams(:,3),[0.025,0.25,0.5,0.75,0.975]);
%     x_opt_logsslogn_IgE_SL_bootstrap(1,1),quantile(x_opt_logsslogn_IgE_SL_bootstrap(:,1),[0.025,0.25,0.5,0.75,0.975]);
%     x_opt_logsslogn_IgE_SL_bootstrap(1,2),quantile(x_opt_logsslogn_IgE_SL_bootstrap(:,2),[0.025,0.25,0.5,0.75,0.975]);
%     x_opt_logsslogn_IgE_SL_bootstrap(1,3),quantile(x_opt_logsslogn_IgE_SL_bootstrap(:,3),[0.025,0.25,0.5,0.75,0.975]);
%     x_opt_logsslogn_IgE_SL_bootstrap_logparams(1,2),quantile(x_opt_logsslogn_IgE_SL_bootstrap_logparams(:,2),[0.025,0.25,0.5,0.75,0.975]);
%     x_opt_logsslogn_IgE_SL_bootstrap_logparams(1,3),quantile(x_opt_logsslogn_IgE_SL_bootstrap_logparams(:,3),[0.025,0.25,0.5,0.75,0.975]);
%     x_opt_logsslogn_IgG1_SL_bootstrap(1,1),quantile(x_opt_logsslogn_IgG1_SL_bootstrap(:,1),[0.025,0.25,0.5,0.75,0.975]);
%     x_opt_logsslogn_IgG1_SL_bootstrap(1,2),quantile(x_opt_logsslogn_IgG1_SL_bootstrap(:,2),[0.025,0.25,0.5,0.75,0.975]);
%     x_opt_logsslogn_IgG1_SL_bootstrap(1,3),quantile(x_opt_logsslogn_IgG1_SL_bootstrap(:,3),[0.025,0.25,0.5,0.75,0.975]);
%     x_opt_logsslogn_IgG1_SL_bootstrap_logparams(1,2),quantile(x_opt_logsslogn_IgG1_SL_bootstrap_logparams(:,2),[0.025,0.25,0.5,0.75,0.975]);
%     x_opt_logsslogn_IgG1_SL_bootstrap_logparams(1,3),quantile(x_opt_logsslogn_IgG1_SL_bootstrap_logparams(:,3),[0.025,0.25,0.5,0.75,0.975]);
%     x_opt_logsslogn_IgE_BMSL_bootstrap(1,1),quantile(x_opt_logsslogn_IgE_BMSL_bootstrap(:,1),[0.025,0.25,0.5,0.75,0.975]);
%     x_opt_logsslogn_IgE_BMSL_bootstrap(1,2),quantile(x_opt_logsslogn_IgE_BMSL_bootstrap(:,2),[0.025,0.25,0.5,0.75,0.975]);
%     x_opt_logsslogn_IgE_BMSL_bootstrap(1,3),quantile(x_opt_logsslogn_IgE_BMSL_bootstrap(:,3),[0.025,0.25,0.5,0.75,0.975]);
%     x_opt_logsslogn_IgE_BMSL_bootstrap(1,4),quantile(x_opt_logsslogn_IgE_BMSL_bootstrap(:,4),[0.025,0.25,0.5,0.75,0.975]);
%     x_opt_logsslogn_IgE_BMSL_bootstrap_logparams(1,3),quantile(x_opt_logsslogn_IgE_BMSL_bootstrap_logparams(:,3),[0.025,0.25,0.5,0.75,0.975]);
%     x_opt_logsslogn_IgE_BMSL_bootstrap_logparams(1,4),quantile(x_opt_logsslogn_IgE_BMSL_bootstrap_logparams(:,4),[0.025,0.25,0.5,0.75,0.975]);
%     x_opt_logsslogn_IgG1_BMSL_bootstrap(1,1),quantile(x_opt_logsslogn_IgG1_BMSL_bootstrap(:,1),[0.025,0.25,0.5,0.75,0.975]);
%     x_opt_logsslogn_IgG1_BMSL_bootstrap(1,2),quantile(x_opt_logsslogn_IgG1_BMSL_bootstrap(:,2),[0.025,0.25,0.5,0.75,0.975]);
%     x_opt_logsslogn_IgG1_BMSL_bootstrap(1,3),quantile(x_opt_logsslogn_IgG1_BMSL_bootstrap(:,3),[0.025,0.25,0.5,0.75,0.975]);
%     x_opt_logsslogn_IgG1_BMSL_bootstrap(1,4),quantile(x_opt_logsslogn_IgG1_BMSL_bootstrap(:,4),[0.025,0.25,0.5,0.75,0.975]);
%     x_opt_logsslogn_IgG1_BMSL_bootstrap_logparams(1,3),quantile(x_opt_logsslogn_IgG1_BMSL_bootstrap_logparams(:,3),[0.025,0.25,0.5,0.75,0.975]);
%     x_opt_logsslogn_IgG1_BMSL_bootstrap_logparams(1,4),quantile(x_opt_logsslogn_IgG1_BMSL_bootstrap_logparams(:,4),[0.025,0.25,0.5,0.75,0.975]);
%     x_opt_logsslogn_IgEG1_BM_bootstrap(1,1),quantile(x_opt_logsslogn_IgEG1_BM_bootstrap(:,1),[0.025,0.25,0.5,0.75,0.975]);
%     x_opt_logsslogn_IgEG1_BM_bootstrap(1,2),quantile(x_opt_logsslogn_IgEG1_BM_bootstrap(:,2),[0.025,0.25,0.5,0.75,0.975]);
%     x_opt_logsslogn_IgEG1_BM_bootstrap(1,3),quantile(x_opt_logsslogn_IgEG1_BM_bootstrap(:,3),[0.025,0.25,0.5,0.75,0.975]);
%     x_opt_logsslogn_IgEG1_BM_bootstrap(1,4),quantile(x_opt_logsslogn_IgEG1_BM_bootstrap(:,4),[0.025,0.25,0.5,0.75,0.975]);
%     x_opt_logsslogn_IgEG1_BM_bootstrap_logparams(1,3),quantile(x_opt_logsslogn_IgEG1_BM_bootstrap_logparams(:,3),[0.025,0.25,0.5,0.75,0.975]);
%     x_opt_logsslogn_IgEG1_BM_bootstrap_logparams(1,4),quantile(x_opt_logsslogn_IgEG1_BM_bootstrap_logparams(:,4),[0.025,0.25,0.5,0.75,0.975]);
%     x_opt_logsslogn_IgEG1_SL_bootstrap(1,1),quantile(x_opt_logsslogn_IgEG1_SL_bootstrap(:,1),[0.025,0.25,0.5,0.75,0.975]);
%     x_opt_logsslogn_IgEG1_SL_bootstrap(1,2),quantile(x_opt_logsslogn_IgEG1_SL_bootstrap(:,2),[0.025,0.25,0.5,0.75,0.975]);
%     x_opt_logsslogn_IgEG1_SL_bootstrap(1,3),quantile(x_opt_logsslogn_IgEG1_SL_bootstrap(:,3),[0.025,0.25,0.5,0.75,0.975]);
%     x_opt_logsslogn_IgEG1_SL_bootstrap(1,4),quantile(x_opt_logsslogn_IgEG1_SL_bootstrap(:,4),[0.025,0.25,0.5,0.75,0.975]);
%     x_opt_logsslogn_IgEG1_SL_bootstrap_logparams(1,3),quantile(x_opt_logsslogn_IgEG1_SL_bootstrap_logparams(:,3),[0.025,0.25,0.5,0.75,0.975]);
%     x_opt_logsslogn_IgEG1_SL_bootstrap_logparams(1,4),quantile(x_opt_logsslogn_IgEG1_SL_bootstrap_logparams(:,4),[0.025,0.25,0.5,0.75,0.975]);
%     x_opt_logsslogn_IgEG1_BMSL_bootstrap(1,1),quantile(x_opt_logsslogn_IgEG1_BMSL_bootstrap(:,1),[0.025,0.25,0.5,0.75,0.975]);
%     x_opt_logsslogn_IgEG1_BMSL_bootstrap(1,2),quantile(x_opt_logsslogn_IgEG1_BMSL_bootstrap(:,2),[0.025,0.25,0.5,0.75,0.975]);
%     x_opt_logsslogn_IgEG1_BMSL_bootstrap(1,3),quantile(x_opt_logsslogn_IgEG1_BMSL_bootstrap(:,3),[0.025,0.25,0.5,0.75,0.975]);
%     x_opt_logsslogn_IgEG1_BMSL_bootstrap(1,4),quantile(x_opt_logsslogn_IgEG1_BMSL_bootstrap(:,4),[0.025,0.25,0.5,0.75,0.975]);
%     x_opt_logsslogn_IgEG1_BMSL_bootstrap(1,5),quantile(x_opt_logsslogn_IgEG1_BMSL_bootstrap(:,5),[0.025,0.25,0.5,0.75,0.975]);
%     x_opt_logsslogn_IgEG1_BMSL_bootstrap(1,6),quantile(x_opt_logsslogn_IgEG1_BMSL_bootstrap(:,6),[0.025,0.25,0.5,0.75,0.975]);
%     x_opt_logsslogn_IgEG1_BMSL_bootstrap_logparams(1,5),quantile(x_opt_logsslogn_IgEG1_BMSL_bootstrap_logparams(:,5),[0.025,0.25,0.5,0.75,0.975]);
%     x_opt_logsslogn_IgEG1_BMSL_bootstrap_logparams(1,6),quantile(x_opt_logsslogn_IgEG1_BMSL_bootstrap_logparams(:,6),[0.025,0.25,0.5,0.75,0.975])];

close all;
save(strcat('hCD4_homeo_IgEG1_BMSL_logfits_',starttimestr,'.mat'))

cd ..
