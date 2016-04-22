
isi_all= diff(cluster_class(:,2));
x_axis = cluster_class(:,2);
x_axis(end) = [];
t=cluster_class(:,2);
t(end) = [];
%{
figure;
for c=0:c_num
    j=find(cluster_class(:,1)==c); 
    semilogy(x_axis(j), isi_all(j),'o', 'color',cc(c+1,:));hold on;
    %semilogy(x_axis, isi_all,'o');%, 'color',cc(c+1,:));hold on;
    xlabel('time (ms)'); ylabel('ISI (ms)');
end
%}
figure;
for c=0:c_num
    subplot(c_num+1,1,c+1);
    j=find(cluster_class(:,1)==c);    % indice of each clustered spike in cluster_class
    semilogy(t(j(1:end-1)), diff( tim.(names{c+1})),'oc','color',cc(c+1,:));    
    hold on;
   
end

%segmentlength=20000;%round(numel(data)/4.5);
%over=1000;%round(80/100*segmentlength/5);
%figure;
%spectrogram(filtrado, segmentlength ,over,[],20000,'yaxis');
%ylim([0 500]);

%{

figure;
for c=1:c_num
    subplot(c_num,1,c);
    hist(diff( tim.(names{c+1})),2000);
    xlim([0 30]);
    set(gca,'xscale','log');
end
%}
    
    
    