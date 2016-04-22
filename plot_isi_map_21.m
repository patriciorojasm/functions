%-----------------------------------------------------
% Calculate ISI map for all pointin each cluster
%-----------------------------------------------------

%close all;

t_1=.8e4;        % t first (seconds)
t_2= t_1 +.2e4;
t_3=1.8e4;        % t second (seconds)
t_4= t_3 +.2e4;  
dt_isi=.1e6;     % length of analysis (seconds)
c=0;
%f_hist=figure; 
f_isi=figure('OuterPosition',[2850 200 300 1000]);
for c=1:c_num
    j=find(cluster_class(:,1)==c);    % indice of each clustered spike in cluster_class
    t=cluster_class(j,2);
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
    
    %--------------------------
    % calculate IBI
    %--------------------------
    %IBI_first = find(isi_i_first > m_l_first & isi_i_1_first > m_l_first );
    %IBI_first(c) = isi_i_first(IBI_first);
    
    
    
    %---- line with slope 1 ----
    max_plot=max([isi_i_first; isi_i_1_first]);%; isi_i_second; isi_i_1_second]);
 
    %---linear plot------
    %figure(f_isi);
    subplot(c_num+1,1,c+1);
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
    %axis normal;
    
    tit = strcat('CLUSTER',{' '},num2str(c));
    title(tit);
    xlabel('ISI_i (ms)');
    ylabel('ISI_{i+1} (ms)');
    
    %---legend------
    descr_1 = strcat(num2str(t_1),{' '},'to',{' '}, strcat(num2str(t_2)));
    descr_2 = strcat(num2str(t_3),{' '},'to',{' '}, strcat(num2str(t_4)));
    legend([descr_1 descr_2]);
    
   %figure(f_hist);
   %subplot(c_num,1,c);
   % histogram(isi_i_first);hold on;
    %set(gca,'FaceColor','r','EdgeColor','w')
   % histogram(isi_i_second);

end
saveas(gcf,'isi_map_lin_cluster.fig','fig');

%---loglog plot------
copyobj(gcf,0);
for c=1:c_num+1
    subplot(c_num+1,1,c);
    set(gca,'xscale','log');
    set(gca,'yscale','log');
    %axis normal;
end
saveas(gcf,'isi_map_log_cluster.fig','fig');
save2pdf('isi_map_log_cluster',gcf,150);
