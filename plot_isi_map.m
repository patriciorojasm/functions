%close all;

t_1=600;        % t first (seconds)
t_2= t_1 +100;
t_3=1500;        % t second (seconds)
t_4= t_3 +100;  
dt_isi=100;     % length of analysis (seconds)
ti_1=max(find(cluster_class(:,2) < t_1*1000));  %point numbers corresponding to time
ti_2=max(find(cluster_class(:,2) < t_2*1000));       %ti_1 +dt_isi;


ti_3=max(find(cluster_class(:,2) < t_3*1000));
ti_4=max(find(cluster_class(:,2) < t_4*1000));

isi_i_first = cluster_class(ti_1:ti_2, 2);      % spike times 
isi_i_first = diff(isi_i_first);                % ISI 
m_l_first=mean(isi_i_first);
isi_i_first(end)=[];                            % ISI i

isi_i_1_first=cluster_class(ti_1:ti_2, 2);      % spike times 
isi_i_1_first = diff(isi_i_1_first);            % ISI
isi_i_1_first(1)=[];                            % ISI i+1

isi_i_second = cluster_class(ti_3:ti_4, 2);  
isi_i_second = diff(isi_i_second);
m_l_second=mean(isi_i_second);
isi_i_second(end)=[];

isi_i_1_second=cluster_class(ti_3:ti_4, 2); 
isi_i_1_second = diff(isi_i_1_second);
isi_i_1_second(1)=[];
%---- line with slope 1 ----
max_plot=max([isi_i_first; isi_i_1_first; isi_i_second; isi_i_1_second]);

%---linear plot------
figure; 
plot(isi_i_first, isi_i_1_first,'o','color','red','linewidth',2);hold on;
%plot(1:100:max_plot,1:100:max_plot, '--','color','black');
%figure; 
plot(isi_i_second, isi_i_1_second,'o','color','blue');hold on
plot(1:100:max_plot,1:100:max_plot, '--','color','black');hold on
%--- plot M_L -----
plot([m_l_first; m_l_first],[0; max_plot],'--','color','red');
plot([0; max_plot],[m_l_first; m_l_first],'--','color','red');
plot([m_l_second; m_l_second],[0; max_plot],'--','color','blue');
plot([0; max_plot],[m_l_second; m_l_second],'--','color','blue');

xlabel('ISI_i (ms)');
ylabel('ISI_i+1 (ms)');
descr_1 = strcat(num2str(t_1),{' '},'to',{' '}, strcat(num2str(t_2)));
descr_2 = strcat(num2str(t_3),{' '},'to',{' '}, strcat(num2str(t_4)));
legend([descr_1 descr_2]);

saveas(gcf,'f_isi_map_lin.fig','fig');
saveas(gcf,'f_isi_map_lin.jpg','jpg');

%---loglog plot------
figure; 
loglog(isi_i_first, isi_i_1_first,'o','color','red','linewidth',2);hold on;
%plot(1:100:max_plot,1:100:max_plot, '--','color','black');
%figure; 
loglog(isi_i_second, isi_i_1_second,'o','color','blue');hold on
loglog(1:100:max_plot,1:100:max_plot, '--','color','black');hold on
%--- plot M_L -----
loglog([m_l_first; m_l_first],[1; max_plot],'--','color','red');
loglog([1; max_plot],[m_l_first; m_l_first],'--','color','red');
loglog([m_l_second; m_l_second],[1; max_plot],'--','color','blue');
loglog([1; max_plot],[m_l_second; m_l_second],'--','color','blue');

xlabel('ISI_i (ms)');
ylabel('ISI_i+1 (ms)');

descr_1 = strcat(num2str(t_1),{' '},'to',{' '}, strcat(num2str(t_2)));
descr_2 = strcat(num2str(t_3),{' '},'to',{' '}, strcat(num2str(t_4)));
legend([descr_1 descr_2]);

saveas(gcf,'f_isi_map_log.fig','fig');
saveas(gcf,'f_isi_map_log.fig','jpg');

%---histogram------
figure;
subplot(211);hist(isi_i_first,1000);hold on;%xlim([0 200])
h1=findobj(gca,'type','patch');
set(h1,'facecolor','r','edgecolor','r');
subplot(212);hist(isi_i_second,1000,'blue');%xlim([0 200])
h2=findobj(gca,'type','patch');
set(h2,'facecolor','r','edgecolor','r');
