%load('analyzed_160128_ch2.mat')

figure;


% trace baseline
subplot(3,6,[1 3]);
x1=400;
t_1=x1;%*1000;
x2=450;%410;
t_2=x2;%*1000;
x1=min(find(time_new> x1)); 
x2=min(find(time_new > x2));
plot(time_new(x1:x2), data(x1:x2),'color','black')
xlim([time_new(x1) time_new(x2)]);
ylim([-1 1]);
box off; axis off;

% trace Bum
subplot(3,6,[7 9] );
x3=700;
t_3=x3;%*1000;
x4=750;%710;
t_4=x4;%*1000;
x3=min(find(time_new > x3));
x4=min(find(time_new > x4));
plot(time_new(x3:x4), data(x3:x4),'color','black')
xlim([time_new(x3) time_new(x4)]);
ylim([-1 1]);
box off; axis off;

%---color map----
g=gray(16);

% cluster 1 baseline
%f_6=figure('OuterPosition',[3250 500 500 500 ]);  
subplot(3,6,4);
c=1;
j=find(cluster_class(:,1)==c);  % vector with point numbers
t=cluster_class(j,2);           % vector with times
%time_int_1 =find(cluster_class(j,2)+1000 > t_1  & cluster_class(j,2)+time_window(1)+1000 < t_2)
mi =min(find(t  > 400*1000+1000)  );
ma =min(find(t  > 500*1000+1000));
%errorbar(mean(spikes(time_int_1,:)),std(spikes(time_int_1,:)), 'color',cc(c+1,:));
length(spikes(1:ma,:));
errorbar(mean(spikes(j(mi:ma),:)),std(spikes(j(mi:ma),:)), 'color',g(1,:),'linewidth',2);hold on
hold on;
ylim([-1 .5]);%hold on;
box off; axis off;

% cluster 2 baseline
%subplot(3,4,4);
c=2;
j=find(cluster_class(:,1)==c);  % vector with point numbers
t=cluster_class(j,2); 
mi_3 =min(find(t > 400*1000 +1000));  % t+1000 > 600*1000
ma_3 =max(find(t < 500*1000 +1000));
%time_int_1 =find(cluster_class(j,2) > t_1 & cluster_class(j,2) < t_2);
length(spikes(1:ma_3,:));
errorbar(mean(spikes(j(mi_3:ma_3),:)),std(spikes(j(mi_3:ma_3),:)), 'color',g(11,:),'linewidth',2);
ylim([-1 .5]);%hold on;
box off; axis off;
%


% cluster 1 Bum
subplot(3,6,10);
c=1;
j=find(cluster_class(:,1)==c);  % vector with point numbers
%time_int_2 =find(cluster_class(j,2) > t_3-1000 & cluster_class(j,2)+time_window(1) < t_4-1000);
mi_2 =min(find(t  > 700*1000 +1000));
ma_2 =max(find(t  < 800*1000 +1000));

errorbar(mean(spikes(j(mi_2:ma_2),:)),std(spikes(j(mi_2:ma_2),:)), 'color',g(1,:),'linewidth',2);
ylim([-1 .6]);%hold on;
hold on
box off; axis off;

% cluster 2 Bum
%subplot(3,4,8);
c=2;
j=find(cluster_class(:,1)==c);  % vector with point numbers
mi_4 =max(find(t < 700*1000 +1000));
ma_4 =max(find(t < 800*1000 +1000));
%time_int_2 =find(cluster_class(j,2) > t_3 & cluster_class(j,2) < t_4);
errorbar(mean(spikes(j(mi_4:ma_4),:)),std(spikes(j(mi_4:ma_4),:)), 'color', g(11,:),'linewidth',2);
ylim([-1 .6]);%hold on;
box off; axis off;

subplot(3,6,5);
isi.uno = tim.uno;
isi.uno= diff(isi.uno);
x_axis = tim.uno;
x_axis(end) = [];
semilogy(x_axis, isi.uno ,'o', 'color',g(1,:)); 
xlim([.5e4 1.5e4]);
title('Cluster 1');
xlabel('time (ms)'); ylabel('ISI (s)');

subplot(3,6,11);
isi.dos = tim.dos;
isi.dos= diff(isi.dos);
x_axis = tim.dos;
x_axis(end) = [];
semilogy(x_axis, isi.dos ,'o', 'color',g(11,:));    
xlim([.5e4 1.5e4]);
title('Cluster 2');
xlabel('time (ms)'); ylabel('ISI (s)');


%{
% ISI map cluster 1
subplot(3,4,4);

    c=1;
    j=find(cluster_class(:,1)==c);  % vector with point numbers
    t=cluster_class(j,2); 
    %t=cluster_class(:,2);
    t=t/1000;
    % ----correction for spike times----
    t_1=400;%time_new(x1)-1000;
    t_2=500;%time_new(x2)-1000;
    t_3=700;%time_new(x3)-1000;
    t_4=800;%time_new(x4)-1000;
    
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
subplot(3,4,8);

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

%--------------------------------------
subplot(3,6,6);

j=find(cluster_class(:,1)==1); 
x11=find(tim.uno > 5e3 , 1, 'first');
x12=find(tim.uno > 10e3 , 1, 'first');
[count1, bincenter1]=hist(diff(isi.uno(x11:x12)),1000);%,'facecolor','blue');
plot(bincenter1,count1,'color',g(1,:),'linewidth',2);
hold on

j=find(cluster_class(:,1)==1); 
x13=find(tim.uno > 15e3 , 1, 'first');
x14=find(tim.uno > 20e3 , 1, 'first');
[count2, bincenter2]=hist( diff(isi.uno(x13:x14)),1000);%,'facecolor','red');
plot(bincenter2,count2,'color',g(6,:),'linewidth',2);
xlim([0 10])
title('Cluster 1');
xlabel('ISI_i (ms)');
ylabel('Events');

%--- inset ----
axes('Position',[.84 .825 .06 .1])
plot(bincenter1,count1,'color',g(1,:),'linewidth',2);hold on
plot(bincenter2,count2,'color',g(6,:),'linewidth',2);
xlim([0 2])

%--------------------------------
subplot(3,6,12);
j=find(cluster_class(:,1)==2); 
x11=find(tim.dos > 5e3 , 1, 'first');
x12=find(tim.dos > 10e3 , 1, 'first');
[count1, bincenter1]=hist(diff(isi.dos(x11:x12)),400);%,'facecolor','blue');
plot(bincenter1,count1,'color',g(11,:),'linewidth',2);
hold on

j=find(cluster_class(:,1)==2); 
x13=find(tim.dos > 15e3 , 1, 'first');
x14=find(tim.dos > 20e3 , 1, 'first');
[count2, bincenter2]=hist( diff(isi.dos(x13:x14)),400);%,'facecolor','red');
plot(bincenter2,count2,'color',g(13,:),'linewidth',2);
xlim([0 30])
title('Cluster 2');
xlabel('ISI_i (ms)');
ylabel('Events');

%--- inset ----
axes('Position',[.84 .525 .06 .1])
plot(bincenter1,count1,'color',g(11,:),'linewidth',2);hold on
plot(bincenter2,count2,'color',g(13,:),'linewidth',2);
xlim([0 5])


%{
h1 = findobj(gca,'Type','patch');
set(h1(1),'FaceColor',cc(2,:),'EdgeColor','w');%,'facealpha',0.5);
set(h1(2),'FaceColor',cc(3,:),'EdgeColor','w');%,'facealpha',0.8);
%}

