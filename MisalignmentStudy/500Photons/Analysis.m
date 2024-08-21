clc; clear all; close all;

% Initialize zero confidence intervals in memory
C_HG = zeros(10,5,4); %(index of experimental run, source separation, relative misalignment)
C_O = zeros(10,5,4);

for i = 1:10 % index of experimental run
    load(sprintf("%s.mat",num2str(i)));

    for j = 1:length(t_s_by_sigma) % Relative source separation
        for k = 1:length(t_c_by_t_s) % Relative misalignment
            % Ratios for HG10 modes
            R_A_HG = squeeze(data.N_HG_A(j,k,:)./data.N_G_A(j,k,:));
            R_B_HG = squeeze(data.N_HG_B(j,k,:)./data.N_G_B(j,k,:));

            % Threshold ratio for HG10 mode
            dR_A_HG = R_A_HG.*squeeze(sqrt((data.N_HG_A(j,k,:)+data.N_G_A(j,k,:))./(data.N_HG_A(j,k,:).*data.N_G_A(j,k,:))));
            dR_B_HG = R_B_HG.*squeeze(sqrt((data.N_HG_B(j,k,:)+data.N_G_B(j,k,:))./(data.N_HG_B(j,k,:).*data.N_G_B(j,k,:))));
            delta_r_hg = mean(R_B_HG - R_A_HG);
            rt_hg = (R_A_HG  + R_B_HG + dR_A_HG - dR_B_HG)/2;
            threshold_hg = nanmean(rt_hg,1); 

            % Fidelity for HG10 mode
            C_HG(i,j,k) = sum((R_A_HG<threshold_hg).*(R_B_HG>threshold_hg),1)*100/meas_nums_set;
            
            % Ratios for optimized modes
            R_A_O = squeeze(data.N_O_A(j,k,:)./data.N_G_A(j,k,:));
            R_B_O = squeeze(data.N_O_B(j,k,:)./data.N_G_B(j,k,:));

            % Threshold ratio for optimized mode
            dR_A_O = R_A_O.*squeeze(sqrt((data.N_O_A(j,k,:)+data.N_G_A(j,k,:))./(data.N_O_A(j,k,:).*data.N_G_A(j,k,:))));
            dR_B_O = R_B_O.*squeeze(sqrt((data.N_O_B(j,k,:)+data.N_G_B(j,k,:))./(data.N_O_B(j,k,:).*data.N_G_B(j,k,:))));
            delta_r_o = mean(R_B_O - R_A_O);
            rt_o = (R_A_O  + R_B_O + dR_A_O - dR_B_O)/2;
            threshold_o = nanmean(rt_o,1);

            % Fidelity for optimized mode
            C_O(i,j,k) = sum((R_A_O<threshold_o).*(R_B_O>threshold_o),1)*100/meas_nums_set;
        end
    end

end

C_HG_mean = squeeze(mean(C_HG,1));
C_HG_min = squeeze(min(C_HG,[],1));
C_HG_max = squeeze(max(C_HG,[],1));

C_O_mean = squeeze(mean(C_O,1));
C_O_min = squeeze(min(C_O,[],1));
C_O_max = squeeze(max(C_O,[],1));

%% Plot Results

close all;

fig = figure('WindowState','maximized');

tiledlayout(2,2);

for i = 1:length(t_s_by_sigma)
    nexttile;
    hold on; box on;
    errorbar(t_c_by_t_s,C_HG_mean(i,:),C_HG_mean(i,:)-C_HG_min(i,:),C_HG_max(i,:)-C_HG_mean(i,:),'--*','LineWidth',4,'MarkerSize',20)
    errorbar(t_c_by_t_s,C_O_mean(i,:),C_O_mean(i,:)-C_O_min(i,:),C_O_max(i,:)-C_O_mean(i,:),'-o','LineWidth',4,'MarkerSize',20)
    xticks(t_c_by_t_s);
    leg = legend('HG10 Mode','Optimized Mode','Location','SouthWest','FontSize',20);
    if i/2 > 1
        xlabel('\theta_c/\theta_s','FontSize',30,'FontWeight','Bold')
    end
    if rem(i,2) ~= 0
        ylabel('C(%)','FontSize',30,'FontWeight','Bold')
    end
    xlim([0 1])
end