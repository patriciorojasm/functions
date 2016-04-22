%load('analyzed_160128_ch2.mat')

figure;
subplot(3,8,[1 8]);
%plot(t_bins,(rate_cluster{1}+rate_cluster{2}),'color','black');hold on
%xlim([1000 t_bins(end)]);

x= t_bins -time_window(1);
for k=1:c_num
plot(x, rate_cluster{k+1}, 'o-','color',cc(k+1,:));hold on
ylabel('rate (spikes/s)');
xlabel('time (s)');
end
xlim([0 1300]);
ylim([0 40]);
box off;

% trace baseline
subplot(3,8,[9 12]);
x1=1600;
t_1=x1;%*1000;
x2=1610;
t_2=x2;%*1000;
x1=min(find(time_new> x1)); 
x2=min(find(time_new > x2));
plot(time_new(x1:x2), data(x1:x2),'color','black')
xlim([time_new(x1) time_new(x2)]);
ylim([-1 .5]);
box off; axis off;

% trace Bum
subplot(3,8,[17 20]);
x3=2010;
t_3=x3;%*1000;
x4=2020;
t_4=x4;%*1000;
x3=min(find(time_new > x3));
x4=min(find(time_new > x4));
plot(time_new(x3:x4), data(x3:x4),'color','black')
xlim([time_new(x3) time_new(x4)]);
ylim([-1 .5]);
box off; axis off;

% cluster 1 baseline
%f_6=figure('OuterPosition',[3250 500 500 500 ]);  
subplot(3,8,13);
c=1;
j=find(cluster_class(:,1)==c);  % vector with point numbers
t=cluster_class(j,2);           % vector with times
%time_int_1 =find(cluster_class(j,2)+1000 > t_1  & cluster_class(j,2)+time_window(1)+1000 < t_2)
mi =min(find(t  > 600*1000+1000)  );
ma =min(find(t  > 700*1000+1000));
%errorbar(mean(spikes(time_int_1,:)),std(spikes(time_int_1,:)), 'color',cc(c+1,:));
length(spikes(1:ma,:));
errorbar(mean(spikes(j(mi:ma),:)),std(spikes(j(mi:ma),:)), 'color',cc(c+1,:));hold on
ylim([-1 .5]);%hold on;
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

% cluster 1 Bum
subplot(3,8,21);
c=1;
j=find(cluster_class(:,1)==c);  % vector with point numbers
%time_int_2 =find(cluster_class(j,2) > t_3-1000 & cluster_class(j,2)+time_window(1) < t_4-1000);
mi_2 =min(find(t  > 1010*1000 +1000));
ma_2 =max(find(t  < 1110*1000 +1000));

errorbar(mean(spikes(j(mi_2:ma_2),:)),std(spikes(j(mi_2:ma_2),:)), 'color',cc(c+1,:));
ylim([-1 .5]);%hold on;
box off; axis off;

% cluster 2 baseline
subplot(3,8,14);
c=2;
j=find(cluster_class(:,1)==c);  % vector with point numbers
t=cluster_class(j,2); 
mi_3 =min(find(t > 600*1000 +1000));  % t+1000 > 600*1000
ma_3 =max(find(t < 700*1000 +1000));
%time_int_1 =find(cluster_class(j,2) > t_1 & cluster_class(j,2) < t_2);
length(spikes(1:ma_3,:));
errorbar(mean(spikes(j(mi_3:ma_3),:)),std(spikes(j(mi_3:ma_3),:)), 'color',cc(c+1,:));
ylim([-1 .5]);%hold on;
box off; axis off;
%

% cluster 2 Bum
subplot(3,8,22);
c=2;
j=find(cluster_class(:,1)==c);  % vector with point numbers
mi_4 =max(find(t < 1010*1000 +1000));
ma_4 =max(find(t < 1110*1000 +1000));
%time_int_2 =find(cluster_class(j,2) > t_3 & cluster_class(j,2) < t_4);
errorbar(mean(spikes(j(mi_4:ma_4),:)),std(spikes(j(mi_4:ma_4),:)), 'color', cc(c+1,:));
ylim([-1 .5]);%hold on;
box off; axis off;

% ISI map cluster 1
subplot(3,8,15);

    c=1;
    j=find(cluster_class(:,1)==c);  % vector with point numbers
    t=cluster_class(j,2); 
    %t=cluster_class(:,2);
    t=t/1000;
    % ----correction for spike times----
    t_1=1600;%time_new(x1)-1000;
    t_2=1800;%time_new(x2)-1000;
    t_3=2000;%time_new(x3)-1000;
    t_4=2200;%time_new(x4)-1000;
    
    %---calculates isi first----
    isi_i_first = t(round(t_1):round(t_2));    
    isi_i_first = diff(isi_i_first) ;               % ISI 
    isi_i_1_first = isi_i_first;
    %m_l_first=mean(isi_i_first
    isi_i_first(end)=[];
    isi_i_1_first(1)=[];          
    %{
    plot(isi_i_first,isi_i_1_first, 'o','color',cc(2,:));hold on;
    hist(isi_i_first);hold on;
    h = findobj(gca,'Type','patch');
    set(h,'FaceColor',cc(2,:),'EdgeColor','w')
    %}
    h=cdfplot(isi_i_first);
    set(h,'Color','k');hold on
    
    %---calculates isi second----
    isi_i_second = t(round(t_3):round(t_4));    
    isi_i_second = diff(isi_i_second) ;               % ISI 
    isi_i_1_second = isi_i_second;
    %m_l_first=mean(isi_i_first
    isi_i_second(end)=[];
    isi_i_1_second(1)=[];          
    %plot(isi_i_second,isi_i_1_second, 'x','color',cc(2,:));hold on;
    %{
    hist(isi_i_second,100);
    h1 = findobj(gca,'Type','patch');
    set(h1,'FaceColor',cc(3,:),'EdgeColor','w')
    %}
    h1=cdfplot(isi_i_second);
    set(h1,'Color','blue');hold on
    xlim([0 .3]); %ylim([0 .3]);
    title('Cluster 1');
    xlabel('ISI_i (s)');
    %ylabel('ISI_{i+1} (ms)');
    
% ISI map cluster 2
subplot(3,8,16);

    c=2;
    j=find(cluster_class(:,1)==c);  % vector with point numbers
    t=cluster_class(j,2); 
    %t=cluster_class(:,2);
    t=t/1000;
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
    %plot(isi_i_first,isi_i_1_first, '^','color','red');hold on
    %xlim([0 10]); ylim([0 10]);
    h=cdfplot(isi_i_first);
    set(h,'Color','black');hold on
    %xlim([0 .3]); ylim([0 .3]);
    
    
    %---calculates isi second----
    isi_i_second = t(round(t_3):round(t_4));    
    isi_i_second = diff(isi_i_second) ;               % ISI 
    isi_i_1_second = isi_i_second;
    %m_l_first=mean(isi_i_first
    isi_i_second(end)=[];
    isi_i_1_second(1)=[];          
    %plot(isi_i_second,isi_i_1_second, 's','color','red');hold on;
    h1=cdfplot(isi_i_second);
    set(h1,'Color','blue');hold on
    %xlim([0 .3]); ylim([0 .3]);
    
    
    xlim([0 1]); %ylim([0 10]);
    
    %xlim([1e-3 5]); ylim([1e-3 5]);
    title('Cluster 2');
    xlabel('ISI_i (s)');
    ylabel('ISI_{i+1} (s)');
%}
%plot(isi_i_first, isi_i_1_first,'o','color','red','linewidth',2);hold on;
