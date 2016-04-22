%-------------------------------------------------------------------------
% figure made with 
% /home/pato/DISK/PATO/DATA/Marcelo/trazos/Mouse/Epi PHBT 20012016/EXP 2
%-------------------------------------------------------------------------
plot_isi_map;
figure;
subplot(4,4,[1 2]);
plot(time_new,data,'color','black');
xlim([400 410]);
ylim([-1.5 1.5]);

subplot(4,4,3);
hist(isi_i_first,1000);
h1=findobj(gca,'type','patch');
set(h1,'facecolor','k','edgecolor','k');
xlim([0 300])
xlabel('ISI (ms)');ylabel('Number of events');

subplot(4,4,[5 6]);
plot(time_new,data,'color','black');
xlim([1000 1010]);
ylim([-1.5 1.5]);

subplot(4,4,7);
hist(isi_i_second,1000,'black');xlim([0 300]);
h2=findobj(gca,'type','patch');
set(h2,'facecolor','k','edgecolor','k');
xlabel('ISI (ms)');ylabel('Number of events');

t_1=4e5;        % t first (seconds)
t_2= t_1 +.1e6;
t_3=14e5;        % t second (seconds)
t_4= t_3 +.1e6;  
dt_isi=.1e6;     % length of analysis (seconds)
c=0;

    c=1;
    %j=find(cluster_class(:,1)==c);    % indice of each clustered spike in cluster_class
    %t=cluster_class(j,2);
    t=cluster_class(:,2);
    
    ti_1=min(find(t > t_1));  %point numbers corresponding to time
    ti_2=min(find(t > t_2));       %ti_1 +dt_isi;
    ti_3=min(find(t > t_3));
    ti_4=min(find(t > t_4));
        % spike times 
    isi_i_first = t(ti_1:ti_2); 
    isi_i_first = diff(isi_i_first);                % ISI 
    m_l_first=mean(isi_i_first);
    isi_i_first(end)=[];                            % ISI i+1
    isi_i_1_first= t(ti_1:ti_2);     % spike times 
    isi_i_1_first = diff(isi_i_1_first);            % ISI
    isi_i_1_first(1)=[];                            % ISI i+1
    isi_i_second = t(ti_3:ti_4);  
    isi_i_second = diff(isi_i_second);
    m_l_second=mean(isi_i_second);
    isi_i_second(end)=[];
    isi_i_1_second=t(ti_3:ti_4); 
    isi_i_1_second = diff(isi_i_1_second);
    isi_i_1_second(1)=[];
    %---- line with slope 1 ----
    max_plot= 300;% max(isi_i_first);%; isi_i_second; isi_i_1_second]);
    %---linear plot-----
    subplot(4,4,4);
    plot(isi_i_first, isi_i_1_first,'o','color','black','linewidth',1,'markersize',4);hold on;
    plot(1:100:400,1:100:400, '--','color','black');hold on
    %--- plot M_L -----
    plot([m_l_first; m_l_first],[0; max_plot],'--','color','black');
    plot([0; max_plot],[m_l_first; m_l_first],'--','color','black');
    
    %plot([0; max_plot],[m_l_second; m_l_second],'--','color','blue');
    xlim([0 300]);ylim([0 300]);
    %set(gca,'xscale','log'); set(gca,'yscale','log');
    %tit = strcat('CLUSTER',{' '},num2str(c));
    %title(tit);
    xlabel('ISI_i (ms)');    ylabel('ISI_{i+1} (ms)');
    
    subplot(4,4,8);
    plot(isi_i_second, isi_i_1_second,'o','color','black','linewidth',1,'markersize',4);hold on
    plot(1:100:400,1:100:400, '--','color','black');hold on
    plot([m_l_second; m_l_second],[0; max_plot],'--','color','black');
    plot([0; max_plot],[m_l_second; m_l_second],'--','color','black');
    xlim([0 300]);ylim([0 300]);
    xlabel('ISI_i (ms)');    ylabel('ISI_{i+1} (ms)');
   %-----------    
   %{ 
   c=2;
    j=find(cluster_class(:,1)==c);    % indice of each clustered spike in cluster_class
    t=cluster_class(j,2);
    %t=cluster_class(:,2);
    ti_1=min(find(t > t_1));  %point numbers corresponding to time
    ti_2=min(find(t > t_2));       %ti_1 +dt_isi;
    ti_3=min(find(t > t_3));
    ti_4=min(find(t > t_4));
        % spike times 
    isi_i_first = t(ti_1:ti_2); 
    isi_i_first = diff(isi_i_first);                % ISI 
    m_l_first=mean(isi_i_first);
    isi_i_first(end)=[];                            % ISI i+1    
    isi_i_1_first= t(ti_1:ti_2);     % spike times 
    isi_i_1_first = diff(isi_i_1_first);            % ISI
    isi_i_1_first(1)=[];                            % ISI i+1
    isi_i_second = t(ti_3:ti_4);  
    isi_i_second = diff(isi_i_second);
    m_l_second=mean(isi_i_second);
    isi_i_second(end)=[];
    isi_i_1_second=t(ti_3:ti_4); 
    isi_i_1_second = diff(isi_i_1_second);
    isi_i_1_second(1)=[];    
    %---- line with slope 1 ----
    max_plot=max([isi_i_first; isi_i_1_first]);%; isi_i_second; isi_i_1_second]); 
    %---linear plot-----
    subplot(4,4,8);
    plot(isi_i_first, isi_i_1_first,'o','color','red','linewidth',2);hold on;
    plot(isi_i_second, isi_i_1_second,'o','color','blue');hold on
    plot(1:100:max_plot,1:100:max_plot, '--','color','black');hold on
    %--- plot M_L -----
    plot([m_l_first; m_l_first],[0; max_plot],'--','color','red');
    plot([0; max_plot],[m_l_first; m_l_first],'--','color','red');
    plot([m_l_second; m_l_second],[0; max_plot],'--','color','blue');
    plot([0; max_plot],[m_l_second; m_l_second],'--','color','blue');
    xlim([0 1000]);ylim([0 700]);
    %set(gca,'xscale','log'); set(gca,'yscale','log');
    tit = strcat('CLUSTER',{' '},num2str(c));
    title(tit);
    xlabel('ISI_i (ms)');
    ylabel('ISI_{i+1} (ms)');
   %}
  