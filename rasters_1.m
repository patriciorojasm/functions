% plotea rasters para find_spikes.mat
figure;
plot(time, data);
i=1;
c=0;
hold all;
c_num =max(cluster_class(:,1));
%cc=hsv(12);
cc=lines(c_num+2);
%subplot(c_num,1,c); 
for c=0:c_num+1;
    j=find(cluster_class(:,1)==c);
    %disp( size(cluster_class))
    t=cluster_class(:,2);
    t=t';
    t=t*.01;
    plot([t(j);t(j)],[ones(size(t(j)));zeros(size(t(j)))], 'k', 'color',cc(c+1,:));    %'color',rand(1,3));
    hold all;
end