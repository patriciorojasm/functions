figure;
subplot(6,1,[1 2]);
plot(time_new,data,'k');
box off
subplot(6,1,3);

for c=3:c_num+3
    j=find(cluster_class(:,1)==c);  % indice
     
    subplot(c_num+1 ,1,c+1);
    t=cluster_class(:,2);           % column with times
    %t=0.01*.5*t';
    t=.001*t';
    plot([t(j)+time_window(1);t(j)+time_window(1)],[ones(size(t(j)));zeros(size(t(j)))], 'color',cc(c+1,:));     % 'k');
    i=i+1;
    xlim([time_new(1) time_new(end)]);
    %xlim([0 time_new(end)])
end
