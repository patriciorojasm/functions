% plotea rasters para find_spikes.mat

%------------------------------------
% for use with find_spikes_brain.m
%------------------------------------

% plot raster with several colours 
figure; subplot(212);
%data=data';
plot(time_new, data);
xlim([time_new(1) time_new(end)]);
i=1;
c=0;
hold all;
c_num =max(cluster_class(:,1));
%cc=hsv(12);
cc=lines(c_num+2);
%subplot(c_num,1,c);
subplot(211);
for c=0:c_num+1;
    j=find(cluster_class(:,1)==c);
    %disp( size(cluster_class))
    t=cluster_class(:,2);
    t=t';
    t=t*.01/2;
    plot([t(j);t(j)],[ones(size(t(j)));zeros(size(t(j)))], 'k', 'color',cc(c+1,:));    %'color',rand(1,3));
    hold all;
    %xlim([time_new(1) time_new(end)]);
end

% plot rasters individually
i=1;
c=0;
f1 =figure;  hold all;
c_num =max(cluster_class(:,1));
%subplot(c_num,1,c); 
for c=0:c_num
    j=find(cluster_class(:,1)==c);
     
    subplot(c_num+1 ,1,c+1);
    t=cluster_class(:,2);
    t=0.01*.5*t';
    plot([t(j);t(j)],[ones(size(t(j)));zeros(size(t(j)))], 'color',cc(c+1,:));     % 'k');
    i=i+1;
    %xlim([time_new(1) time_new(end)]);
end
