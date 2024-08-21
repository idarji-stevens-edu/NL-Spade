clc; clear all; close all;

% Initialize zero confidence intervals in memory
C_HG = zeros(10,4,4); %(index of experimental run, source separation, relative brightness)
C_O = zeros(10,4,4);

for i = 1:10 % Index of experimental run
    load(sprintf("%s.mat",num2str(i)));
    
    for j = 1:length(t_s_by_sigma) % Relative source separation
        for k = 1:length(eps) % Relative brightness
            % Ratios for HG10 modes
            R_A_HG = squeeze(data.N_HG_A(j,k,:)./data.N_G_A(j,k,:));
            R_B_HG = squeeze(data.N_HG_B(j,k,:)./data.N_G_B(j,k,:));

            % Threshold ratio for HG10 mode
            dR_A_HG = R_A_HG.*squeeze(sqrt((data.N_HG_A(j,k,:)+data.N_G_A(j,k,:))./(data.N_HG_A(j,k,:).*data.N_G_A(j,k,:))));
            dR_B_HG = R_B_HG.*squeeze(sqrt((data.N_HG_B(j,k,:)+data.N_G_B(j,k,:))./(data.N_HG_B(j,k,:).*data.N_G_B(j,k,:))));
            delta_r_hg = mean(R_B_HG - R_A_HG);
            R_T_HG = (R_A_HG  + R_B_HG + dR_A_HG - dR_B_HG)/2;
            threshold_hg = nanmean(R_T_HG,1); 

            % Fidelity for HG10 mode
            C_HG(i,j,k) = sum((R_A_HG<threshold_hg).*(R_B_HG>threshold_hg),1);
            
            % Ratios for optimized modes
            R_A_O = squeeze(data.N_O_A(j,k,:)./data.N_G_A(j,k,:));
            R_B_O = squeeze(data.N_O_B(j,k,:)./data.N_G_B(j,k,:));

            % Threshold ratio for optimized mode
            dR_A_O = R_A_O.*squeeze(sqrt((data.N_O_A(j,k,:)+data.N_G_A(j,k,:))./(data.N_O_A(j,k,:).*data.N_G_A(j,k,:))));
            dR_B_O = R_B_O.*squeeze(sqrt((data.N_O_B(j,k,:)+data.N_G_B(j,k,:))./(data.N_O_B(j,k,:).*data.N_G_B(j,k,:))));
            delta_r_o = mean(R_B_O - R_A_O);
            R_T_O = (R_A_O  + R_B_O + dR_A_O - dR_B_O)/2;
            threshold_o = nanmean(R_T_O,1); 

            % Fidelity for optimized mode
            C_O(i,j,k) = sum((R_A_O<threshold_o).*(R_B_O>threshold_o),1);
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

t_ind = 'abcd';

tiledlayout(2,2);
for i = 1:4
    nexttile;
    hold on; box on;
    errorbar(eps,C_HG_mean(i,:),C_HG_mean(i,:)-C_HG_min(i,:),C_HG_max(i,:)-C_HG_mean(i,:),'--*','LineWidth',6,'MarkerSize',40)
    errorbar(eps,C_O_mean(i,:),C_O_mean(i,:)-C_O_min(i,:),C_O_max(i,:)-C_O_mean(i,:),'-o','LineWidth',6,'MarkerSize',40)
    xticks(eps);
    xlim([0.5 0.8]);
    title(sprintf('(%s) \x03B8_s/\x3C3 = %.2f',t_ind(i),t_s_by_sigma(i)),'FontSize',40,'FontWeight','Bold')
    % text(0.05,0.2,sprintf('\x03B8_s/\x3C3: %.2f',t_s_by_sigma(i)),'Units','Normalized','FontSize',30)
    xlim([0.48 0.82]);
    xticks(0.5:0.1:0.8)

    if i == 1
        ylim([40 100.5])
        yticks(40:20:100)
    end
    if i == 2
        ylim([80 100.5])
        yticks(80:5:100)
    end
    if i == 3
        ylim([85 100.5])
        yticks(85:5:100)
    end
    if i == 4
        ylim([85 100.5])
        yticks(85:5:100)
    end

    leg = legend('HG10','Opt','Location','Southwest','FontSize',30);

    if i/2 > 1
        xlabel('\epsilon','FontSize',50,'FontWeight','Bold')
    end
    if rem(i,2) ~= 0
        ylabel('C(%)','FontSize',30,'FontWeight','Bold')
    end
end