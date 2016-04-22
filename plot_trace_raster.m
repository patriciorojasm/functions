% plotea rasters para find_spikes.mat
f2=figure;
subplot(6,1,1);
t_total=max(time);
k=1;
for k=1:6
subplot(6,1,k); 
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


ylim([-.3 .3]);
%ylim([min(data)   max(data)]);
xlim([(k-1)*t_total/6  k*t_total/6]);
hold all;
end

