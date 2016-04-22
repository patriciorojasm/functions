%----------------------------------------------------
% make figure with data from 150203_002[1-477].mat
%----------------------------------------------------
%
f_left=figure('outerposition',[100,300,600,1000]);
t=2;
%--------------------
% plot raw trace
%--------------------
%subplot(6,1,[1 2]);
%subplot(411);
subplot(6,4,[2 4]);
plot(time_new,data,'k');
hold all;
%plot(bar1(:,1),bar1(:,2),'k','linewidth',8); % MUSC application
% ---- scale bar ----
axis off;

xlim([0 250]); % 30 seconds
ylim([9 11]);
box off;

c=3;
%jj=[[6:8] [10:12] [14:16]]
%for c =2:4
subplot(6,4,[6:8]);
    bar(t_bins, rate_cluster{2},'k');
    xlim([0 250]);
    box off;set(gca,'TickDir','out');set(gca, 'FontName', 'arial');
    set(gca, 'fontsize', 8, 'linewidth', 2,'FontWeight', 'bold');ylabel('Firing Rate (Hz)');
    %set(gca,'Xtick',linspace(0,100,10));
    %set(gca,'xticklabel',{'0';'';'20';'';'40';'';'60';'';'80';'';'100'});
    xlabel('time (sec)')  %,'fontsize',12);
subplot(6,4,[10:12]);
    bar(t_bins, rate_cluster{3},'k');
    xlim([0 250]);
    box off;set(gca,'TickDir','out');set(gca, 'FontName', 'arial');
    set(gca, 'fontsize', 8, 'linewidth', 2,'FontWeight', 'bold');ylabel('Firing Rate (Hz)');
    %set(gca,'xticklabel',{'0';'';'20';'';'40';'';'60';'';'80';'';'100'});
    xlabel('time (sec)')  %,'fontsize',12);
subplot(6,4,[14:16]);
    bar(t_bins, rate_cluster{4},'k');
    xlim([0 250]);
    box off;set(gca,'TickDir','out');set(gca, 'FontName', 'arial');
    set(gca, 'fontsize', 8, 'linewidth', 2,'FontWeight', 'bold');ylabel('Firing Rate (Hz)');
    %set(gca,'xticklabel',{'0';'';'20';'';'40';'';'60';'';'80';'';'100'});
    xlabel('time (sec)')  %,'fontsize',12);
subplot(6,4,[18:20]);
    bar(t_bins, rate_cluster{5},'k');
    xlim([0 250]);
    box off;set(gca,'TickDir','out');set(gca, 'FontName', 'arial');
    set(gca, 'fontsize', 8, 'linewidth', 2,'FontWeight', 'bold');ylabel('Firing Rate (Hz)');
    %set(gca,'xticklabel',{'0';'';'20';'';'40';'';'60';'';'80';'';'100'});
    xlabel('time (sec)')  %,'fontsize',12);
subplot(6,4,[22:24]);
    bar(t_bins, rate_cluster{6},'k');
    xlim([0 250]);
    box off;set(gca,'TickDir','out');set(gca, 'FontName', 'arial');
    set(gca, 'fontsize', 8, 'linewidth', 2,'FontWeight', 'bold');ylabel('Firing Rate (Hz)');
    %set(gca,'xticklabel',{'0';'';'20';'';'40';'';'60';'';'80';'';'100'});
    xlabel('time (sec)')  %,'fontsize',12);

subplot(6,4,5);
m1=mean(spikes(s.uno(1:100),:));
m2=mean(spikes(s.uno(end-30:end-10),:));
er1=std(spikes(s.uno(1:100),:))/sqrt(length(spikes(s.uno(1:100))));
er2=std(spikes(s.uno(end-30:end-10),:))/sqrt(length(spikes(s.uno(end-30:end-10))));
errorbar(m1(1:50),er1(1:50),'k','linewidth',2);hold all;
errorbar(m2(1:50),er2(1:50),'r','linewidth',2);
%xlim([0 60]); %ylim([9 11]); 
box off; axis off;
plot([35; 35], [-.2; -.1], '-k',  [35; 45], [-.2; -.2], '-k', 'LineWidth', 2)

subplot(6,4,9);
m1=mean(spikes(s.dos(10:100),:));
m2=mean(spikes(s.dos(end-20:end),:));
er1=std(spikes(s.dos(1:100),:))/sqrt(length(spikes(s.dos(1:100))));
er2=std(spikes(s.dos(end-20:end),:))/sqrt(length(spikes(s.dos(end-20:end))));
errorbar(m1(1:50),er1(1:50),'k','linewidth',2);hold all;
errorbar(m2(1:50),er2(1:50),'r','linewidth',2);
%xlim([0 60]); %ylim([-20 30]);  
box off; axis off;
plot([35; 35], [-.2; -.1], '-k',  [35; 45], [-.2; -.2], '-k', 'LineWidth', 2)

subplot(6,4,13);
m1=mean(spikes(s.tres(10:20),:));
m2=mean(spikes(s.tres(82:87),:));
er1=std(spikes(s.tres(10:20),:))/sqrt(length(spikes(s.tres(10:20))));
er2=std(spikes(s.tres(82:87),:))/sqrt(length(spikes(s.tres(82:87))));
errorbar(m1(1:50),er1(1:50),'k','linewidth',2);hold all;
errorbar(m2(1:50),er2(1:50),'r','linewidth',2);
%xlim([0 60]);%ylim([-30 30]);  
box off; axis off;
plot([35; 35], [-.2; -.1], '-k',  [35; 45], [-.2; -.2], '-k', 'LineWidth', 2)

subplot(6,4,17);
m1=mean(spikes(s.cuatro(10:100),:));
m2=mean(spikes(s.cuatro(end-20:end),:));
er1=std(spikes(s.cuatro(1:100),:))/sqrt(length(spikes(s.cuatro(1:100))));
er2=std(spikes(s.cuatro(end-20:end),:))/sqrt(length(spikes(s.cuatro(end-20:end))));
errorbar(m1(1:50),er1(1:50),'k','linewidth',2);hold all;
errorbar(m2(1:50),er2(1:50),'r','linewidth',2);
%xlim([0 60]); %ylim([-20 30]);  
box off; axis off;
plot([35; 35], [-.2; -.1], '-k',  [35; 45], [-.2; -.2], '-k', 'LineWidth', 2)

subplot(6,4,21);
m1=mean(spikes(s.cinco(10:100),:));
m2=mean(spikes(s.cinco(end-20:end),:));
er1=std(spikes(s.cinco(1:100),:))/sqrt(length(spikes(s.cinco(1:100))));
er2=std(spikes(s.cinco(end-20:end),:))/sqrt(length(spikes(s.cinco(end-20:end))));
errorbar(m1(1:50),er1(1:50),'k','linewidth',2);hold all;
errorbar(m2(1:50),er2(1:50),'r','linewidth',2);
%xlim([0 60]); %ylim([-20 30]);  
box off; axis off;
plot([35; 35], [-.2; -.1], '-k',  [35; 45], [-.2; -.2], '-k', 'LineWidth', 2)

% ---- scale bar ----
%plot([35; 35], [-30; -10], '-k',  [25; 35], [-30; -30], '-k', 'LineWidth', 2)
%{
print(f_left, '-dpdf', '-r300');
%}
%{
for c=2:3
    set(ax(c),'xticklabel','');
end

set(gca,'xticklabel',{'0';'';'20';'';'40';'';'60';'';'80';'';'100'});
    %'fontsize',12);
xlabel('time (sec)')  %,'fontsize',12);
%}