%tic;
f_4=figure('OuterPosition',[2850 200 300 1000]); 
c=0;
%-------------------------------------------------------------
% plot one figure per cluster with all traces in that cluster
%-------------------------------------------------------------
for c=0:c_num    % loop through clusters
j=find(cluster_class(:,1)==c);  % vector with point numbers
%si=size(j);   % number of spikes in cluster c
subplot(c_num+1,1,c+1);
% plot all spikes in cluster c
%for i1=1:si 
    plot(1:1:size(spikes,2), spikes(j,:),'color',cc(c+1,:));
    hold on;
%end

tit = strcat('CLUSTER',{' '},num2str(c),{' '},'|',{'    '},...
    num2str(length(spikes(j))), {' '}, 'spikes found');
title(tit);
end
%toc;
%------------------------------------------------------------
% plot all traces with a color corresponding to the cluster
%------------------------------------------------------------
%tic;
f_5=figure('OuterPosition',[3150 100 500 500]);  
for c=0:c_num
    j=find(cluster_class(:,1)==c);  % vector with point numbers
    %si=size(j);   % number of spikes in cluster c
    %for i1=1:si 
        plot(1:1:size(spikes,2), spikes(j,:),'color',cc(c+1,:));
        hold on;
    %end
end
%toc;
%f_6=figure
%for c=1:c_num
%    m1=mean(cluster_class(:,1)==c
%end

%------------------------------------------------------------
% plot average of each cluster
%------------------------------------------------------------
f_6=figure('OuterPosition',[3250 500 500 500]);  
for c=1:c_num
    j=find(cluster_class(:,1)==c);  % vector with point numbers
    si=size(j);   % number of spikes in cluster c
    %for i1=1:si 
        %sem=std(spikes(j,:))/sqrt(length(spikes(j,:)));
        %plot(mean(spikes(j,:)),'color',cc(c+1,:));
        errorbar(mean(spikes(j,:)),std(spikes(j,:)), 'color',cc(c+1,:));
        hold on;
    %end
end



%{
 f6=figure; 
 for c=0:c_num 
 j=find(cluster_class(:,1)==c);
 t_p = (cluster_class(j,2));
 c_p = ones(size(t_p,1),1); 
 c_p= c_p*c;
 hold all;
 subplot(211), plot(t_p, c_p ,'o','color',cc(c+1,:));
 end
 hold off;
 subplot(212), plot(time,data);
%}