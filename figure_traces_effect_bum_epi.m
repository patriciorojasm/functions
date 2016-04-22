%load('analyzed_160220.mat')  Expto  02092015_002 data_all

figure;
subplot(3,8,[1 8]);
%plot(t_bins,(rate_cluster{1}+rate_cluster{2}),'color','black');hold on
%xlim([1000 t_bins(end)]);

for k=1:c_num
plot(t_bins, rate_cluster{k+1}, 'o-','color',cc(k+1,:));hold on
ylabel('rate (spikes/s)');
xlabel('time (s)');
end
xlim([0 t_bins(end)]);ylim([0 40]);
box off;

subplot(3,8,[9 12]);
x1=400;
t_1=x1*1000;
x2=405;
t_2=x2*1000;
x1=min(find(time_new> x1)); 
x2=min(find(time_new > x2));
plot(time_new(x1:x2), data(x1:x2),'color','black')
xlim([time_new(x1) time_new(x2)]);
ylim([-1 1]);
box off; axis off;

subplot(3,8,[17 20]);
x3=700;
t_3=x3*705;
x4=705;
t_4=x4*1000;
x3=min(find(time_new > x3));
x4=min(find(time_new > x4));
plot(time_new(x3:x4), data(x3:x4),'color','black')
xlim([time_new(x3) time_new(x4)]);
ylim([-1 1]);
box off; axis off;

%f_6=figure('OuterPosition',[3250 500 500 500]);  
subplot(3,8,13);
c=1;
j=find(cluster_class(:,1)==c);  % vector with point numbers
t=cluster_class(j,2);           % vector with times
%time_int_1 =find(cluster_class(j,2)+1000 > t_1  & cluster_class(j,2)+time_window(1)+1000 < t_2)
mi =min(find(t > t_1));
ma =max(find(t < t_2));
%errorbar(mean(spikes(time_int_1,:)),std(spikes(time_int_1,:)), 'color',cc(c+1,:));
%length(spikes(1:ma,:));
errorbar(mean(spikes(j(mi:ma),:)),std(spikes(j(mi:ma),:)), 'color',cc(c+1,:));hold on
ylim([-1 1]);
box off; axis off;

%{
----
c=2;
j=find(cluster_class(:,1)==c);  % vector with point numbers
t=cluster_class(j,2); 
mi_3 =min(find(t+1000 > t_1));
ma_3 =max(find(t+1000 < t_2));
%time_int_1 =find(cluster_class(j,2) > t_1 & cluster_class(j,2) < t_2);
length(spikes(1:ma_3,:));
errorbar(mean(spikes(j(1:ma_3),:)),std(spikes(j(1:ma_3),:)), 'color',cc(c+1,:));
ylim([-.7 .2]);%hold on;
xlim([-10 80]);
box off; axis off;
%}

subplot(3,8,21);
c=1;
j=find(cluster_class(:,1)==c);  % vector with point numbers
t=cluster_class(j,2); 
%time_int_2 =find(cluster_class(j,2) > t_3-1000 & cluster_class(j,2)+time_window(1) < t_4-1000);
mi_2 =min(find(t > t_3));
ma_2 =max(find(t < t_4));
errorbar(mean(spikes(j(mi_2:ma_2),:)),std(spikes(j(mi_2:ma_2),:)), 'color',cc(c+1,:));
ylim([-1 1]);%hold on;
box off; axis off;

%
subplot(3,8,14);
c=2;
j=find(cluster_class(:,1)==c);  % vector with point numbers
t=cluster_class(j,2); 
mi_3 =min(find(t > t_1));
ma_3 =max(find(t < t_2));
%time_int_1 =find(cluster_class(j,2) > t_1 & cluster_class(j,2) < t_2);
%length(spikes(1:ma_3,:));
errorbar(mean(spikes(j(mi_3:ma_3),:)),std(spikes(j(mi_3:ma_3),:)), 'color',cc(c+1,:));
ylim([-1 1]);%hold on;
box off; axis off;
%

subplot(3,8,22);
c=2;
j=find(cluster_class(:,1)==c);  % vector with point numbers
t=cluster_class(j,2); 
mi_4 =max(find(t < t_3));
ma_4 =max(find(t < t_4));
%time_int_2 =find(cluster_class(j,2) > t_3 & cluster_class(j,2) < t_4);
errorbar(mean(spikes(j(mi_4:ma_4),:)),std(spikes(j(mi_4:ma_4),:)), 'color', cc(c+1,:));
ylim([-1 1]);%hold on;
box off; axis off;

subplot(3,8,15);

    c=1;
    j=find(cluster_class(:,1)==c);  % vector with point numbers
    t=cluster_class(j,2); 
    %t=cluster_class(:,2);
    %t=t/1000;
    % ----correction for spike times----
    t_1=300;%time_new(x1)-1000;
    t_2=400;%time_new(x2)-1000;
    t_3=700;%time_new(x3)-1000;
    t_4=800;%time_new(x4)-1000;
    
    %---calculates isi first----
    isi_i_first = t(round(t_1):round(t_2));    
    isi_i_first = diff(isi_i_first) ;               % ISI 
    isi_i_1_first = isi_i_first;
    %m_l_first=mean(isi_i_first
    isi_i_first(end)=[];
    isi_i_1_first(1)=[];          
    plot(isi_i_first,isi_i_1_first, 'o','color','black');hold on;
    
    %---calculates isi second----
    isi_i_second = t(round(t_3):round(t_4));    
    isi_i_second = diff(isi_i_second) ;               % ISI 
    isi_i_1_second = isi_i_second;
    %m_l_first=mean(isi_i_first
    isi_i_second(end)=[];
    isi_i_1_second(1)=[];          
    plot(isi_i_second,isi_i_1_second, 'o','color','blue');hold on;
    
    %xlim([0 .3]); ylim([0 .3]);
    title('Cluster 1');
    xlabel('ISI_i (ms)');
    ylabel('ISI_{i+1} (ms)');
    
subplot(3,8,23)%16);

    c=2;
    j=find(cluster_class(:,1)==c);  % vector with point numbers
    t=cluster_class(j,2); 
    %t=cluster_class(:,2);
    %t=t/1000;
    % ----correction for spike times----
    %t_1=1600,%time_new(x1)-1000;
    %t_2=1700,%time_new(x2)-1000;
    %t_3=2000;%time_new(x3)-1000;
    %t_4=2100;%time_new(x4)-1000;
    
    %---calculates isi first----
    isi_i_first = t(round(t_1):round(t_2));    
    isi_i_first = diff(isi_i_first) ;               % ISI 
    isi_i_1_first = isi_i_first;
    %m_l_first=mean(isi_i_first
    isi_i_first(end)=[];
    isi_i_1_first(1)=[];          
    plot(isi_i_first,isi_i_1_first, 'o','color','black');hold on;
    
    %---calculates isi second----
    isi_i_second = t(round(t_3):round(t_4));    
    isi_i_second = diff(isi_i_second) ;               % ISI 
    isi_i_1_second = isi_i_second;
    %m_l_first=mean(isi_i_first
    isi_i_second(end)=[];
    isi_i_1_second(1)=[];          
    plot(isi_i_second,isi_i_1_second, 'o','color','blue');hold on;
    
    %xlim([1e-3 5]); ylim([1e-3 5]);
    title('Cluster 2');
    xlabel('ISI_i (ms)');
    ylabel('ISI_{i+1} (ms)');
%}
%plot(isi_i_first, isi_i_1_first,'o','color','red','linewidth',2);hold on;
