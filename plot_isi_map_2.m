%close all;

t_1=600;        % t first (seconds)
t_2= t_1 +100;
t_3=1000;        % t second (seconds)
t_4= t_3 +100;  
dt_isi=100;     % length of analysis (seconds)
c=3;
f_isi_m_lin=figure; 
f_isi_m_log=figure;

%for c=0:c_num+1
    j=find(cluster_class(:,1)==c);    % indice of each clustered spike in cluster_class
    
    
    ti_1=min(find(cluster_class(j,2) > t_1*1000));  %point numbers corresponding to time
    ti_2=min(find(cluster_class(j,2) > t_2*1000));       %ti_1 +dt_isi;

    ti_3=min(find(cluster_class(j,2) > t_3*1000));
    ti_4=min(find(cluster_class(j,2) > t_4*1000));

        % spike times 
    isi_i_first = j(ti_1:ti_2, 1); 
    isi_i_first = diff(isi_i_first);                % ISI 
    m_l_first=mean(isi_i_first);
    %isi_i_first(end)=[];                            % ISI i+1
    isi_i_1_first=j(ti_1:ti_2, 1);      % spike times 
    isi_i_1_first = diff(isi_i_1_first);            % ISI
    %isi_i_1_first(1)=[];                            % ISI i+1

    isi_i_second = j(ti_3:ti_4, 1);  
    isi_i_second = diff(isi_i_second);
    m_l_second=mean(isi_i_second);
    isi_i_second(end)=[];

    isi_i_1_second=j(ti_3:ti_4, 1); 
    isi_i_1_second = diff(isi_i_1_second);
    isi_i_1_second(1)=[];
    %---- line with slope 1 ----
    max_plot=max([isi_i_first; isi_i_1_first; isi_i_second; isi_i_1_second]);

    %---linear plot------
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

    xlabel('ISI_i (ms)');
    ylabel('ISI_i+1 (ms)');


%end
%---loglog plot------
%{ 
plot(f_isi_m_log,isi_i_first, isi_i_1_first,'o','color','red','linewidth',2);hold on;
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
%}


%xlim([0 100]),ylim([0 100]);