clear all; clc; close all;

set(groot,'DefaultAxesFontSize',35);
set(groot,'DefaultAxesFontWeight','bold');

C_5000 = load("C_5000.mat");
C_500 = load("C_500.mat");
t_c_by_t_s = C_5000.t_c_by_t_s;
t_s_by_sigma = C_5000.t_s_by_sigma;

%% Figures

t_ind = 'abcd';

f1 = figure('WindowState','Maximized');
tiledlayout(1,2);

for i = 1:2
%     close all;
    nexttile;
    % figure('WindowState','Maximized');
    hold on; box on;
    plot(t_c_by_t_s,C_5000.C_HG_mean(i,:),'w','DisplayName','HG10M Mode')
    plot(t_c_by_t_s,C_5000.C_O_mean(i,:),'w','DisplayName','HG10M Mode')
    errorbar(t_c_by_t_s,C_5000.C_HG_mean(i,:),C_5000.e_HG(i,:,1),C_5000.e_HG(i,:,2),'--o','Color','#0072BD','LineWidth',6,'MarkerSize',40)
    errorbar(t_c_by_t_s,C_5000.C_O_mean(i,:),C_5000.e_O(i,:,1),C_5000.e_O(i,:,2),'-+','Color','#0072BD','LineWidth',6,'MarkerSize',40)
    errorbar(t_c_by_t_s,C_500.C_HG_mean(i,:),C_500.e_HG(i,:,1),C_500.e_HG(i,:,2),'--*','Color','#D95319','LineWidth',6,'MarkerSize',40)
    errorbar(t_c_by_t_s,C_500.C_O_mean(i,:),C_500.e_O(i,:,1),C_500.e_O(i,:,2),'-x','Color','#D95319','LineWidth',6,'MarkerSize',40)
    ax = gca;
    ax.PlotBoxAspectRatio = [1 1 1];
    xticks(t_c_by_t_s);
    yticks(0:50:100)
    title(sprintf('(%s) \x03B8_s/\x3C3 = %.2f',t_ind(i),t_s_by_sigma(i)),'FontSize',40,'Fontweight','bold')
    % text(0.75,90,sprintf('\x03B8_s/\x3C3: %.2f',C_5000.t_s_list(i)),'FontSize',30)
    % if i == 1
        [lh, labelhandles] = legend({'HG10','Opt'},'FontSize',30);
        lh.Position = [gca().Position(1)+(0.67*gca().Position(3))   gca().Position(2)+0.64    0.11   0.11];
        labelhandles(1).Position =  [0.35 0.75 0];
        labelhandles(2).Position =  [0.35 0.25 0];
        labelhandles(3).LineStyle = '--';
        labelhandles(3).LineWidth = 4;
        labelhandles(3).Color = '#0072BD';
        labelhandles(3).XData = [0.01    0.35]; labelhandles(3).YData = [0.82 0.82];
        labelhandles(4).LineStyle = '--';
        labelhandles(4).LineWidth = 4;
        labelhandles(4).Color = '#D95319';
        labelhandles(4).XData = [0.01    0.35]; labelhandles(4).YData = [0.68 0.68];
        labelhandles(5).LineStyle = '-';
        labelhandles(5).LineWidth = 4;
        labelhandles(5).Color = '#0072BD';
        labelhandles(5).XData = [0.01    0.3]; labelhandles(5).YData = [0.32;0.32];
        labelhandles(6).LineStyle = '-';
        labelhandles(6).LineWidth = 4;
        labelhandles(6).Color = '#D95319';
        labelhandles(6).XData = [0.01    0.3]; labelhandles(6).YData = [0.18 0.18];
    % end
    if i > 2
        xlabel('\theta_c/\theta_s','FontSize',40,'FontWeight','Bold')
    end
    if mod(i,2) ==1
        ylabel('C(%)','FontSize',30,'FontWeight','Bold')
    end
    xlim([-0.1 1.1])
    xticks(0:0.25:1.00)
    yticks(0:25:100)
    ylim([-10 110])
end

exportgraphics(f1,sprintf('mis_fid%i.png',i/2),'Resolution',300);

f2 = figure('WindowState','Maximized');
tiledlayout(1,2);

for i = 3:4
%     close all;
    nexttile;
    % figure('WindowState','Maximized');
    hold on; box on;
    plot(t_c_by_t_s,C_5000.C_HG_mean(i,:),'w','DisplayName','HG10M Mode')
    plot(t_c_by_t_s,C_5000.C_O_mean(i,:),'w','DisplayName','HG10M Mode')
    errorbar(t_c_by_t_s,C_5000.C_HG_mean(i,:),C_5000.e_HG(i,:,1),C_5000.e_HG(i,:,2),'--o','Color','#0072BD','LineWidth',6,'MarkerSize',40)
    errorbar(t_c_by_t_s,C_5000.C_O_mean(i,:),C_5000.e_O(i,:,1),C_5000.e_O(i,:,2),'-+','Color','#0072BD','LineWidth',6,'MarkerSize',40)
    errorbar(t_c_by_t_s,C_500.C_HG_mean(i,:),C_500.e_HG(i,:,1),C_500.e_HG(i,:,2),'--*','Color','#D95319','LineWidth',6,'MarkerSize',40)
    errorbar(t_c_by_t_s,C_500.C_O_mean(i,:),C_500.e_O(i,:,1),C_500.e_O(i,:,2),'-x','Color','#D95319','LineWidth',6,'MarkerSize',40)
    ax = gca;
    ax.PlotBoxAspectRatio = [1 1 1];
    xticks(t_c_by_t_s);
    yticks(0:50:100)
    title(sprintf('(%s) \x03B8_s/\x3C3 = %.2f',t_ind(i),t_s_by_sigma(i)),'FontSize',40,'Fontweight','bold')
    % text(0.75,90,sprintf('\x03B8_s/\x3C3: %.2f',C_5000.t_s_list(i)),'FontSize',30)
    % if i == 1
        [lh, labelhandles] = legend({'HG10','Opt'},'FontSize',30);
        lh.Position = [gca().Position(1)+(0.67*gca().Position(3))   0.75   0.11   0.11];
        labelhandles(1).Position =  [0.35 0.75 0];
        labelhandles(2).Position =  [0.35 0.25 0];
        labelhandles(3).LineStyle = '--';
        labelhandles(3).LineWidth = 4;
        labelhandles(3).Color = '#0072BD';
        labelhandles(3).XData = [0.01    0.35]; labelhandles(3).YData = [0.82 0.82];
        labelhandles(4).LineStyle = '--';
        labelhandles(4).LineWidth = 4;
        labelhandles(4).Color = '#D95319';
        labelhandles(4).XData = [0.01    0.35]; labelhandles(4).YData = [0.68 0.68];
        labelhandles(5).LineStyle = '-';
        labelhandles(5).LineWidth = 4;
        labelhandles(5).Color = '#0072BD';
        labelhandles(5).XData = [0.01    0.3]; labelhandles(5).YData = [0.32;0.32];
        labelhandles(6).LineStyle = '-';
        labelhandles(6).LineWidth = 4;
        labelhandles(6).Color = '#D95319';
        labelhandles(6).XData = [0.01    0.3]; labelhandles(6).YData = [0.18 0.18];
    % end
    if i > 2
        xlabel('\theta_c/\theta_s','FontSize',40,'FontWeight','Bold')
    end
    if mod(i,2) ==1
        ylabel('C(%)','FontSize',30,'FontWeight','Bold')
    end
    xlim([-0.1 1.1])
    xticks(0:0.25:1.00)
    yticks(0:25:100)
    ylim([-10 110])
end

exportgraphics(f2,sprintf('mis_fid%i.png',i/2),'Resolution',300)

%% Combined figures

i1 = imread("mis_fid1.png");
i2 = imread("mis_fid2.png");

i1 = padarray(i1,[ceil((3000-size(i1,1))/2) ceil((5500-size(i1,2))/2) 0],255);
i2 = padarray(i2,[ceil((3000-size(i2,1))/2) ceil((5500-size(i2,2))/2) 0],255);

i = cat(1,i1(1:3000,1:5500,:),i2(1:3000,1:5500,:));
close all;

imwrite(i,'mis_fid.png')