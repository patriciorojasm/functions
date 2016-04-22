%{
spikes_original=spikes;

V_prohibit =1.5;
j=find(cluster_class(:,1)==0);  % vector with point numbers
for i=1:size(j,1)
    if max(spikes(i,:)) < V_prohibit
        spikes(i,:)=[];
    end
end
%}
figure('OuterPosition',[2850 200 300 1000]); 
c=0;
%-------------------------------------------------------------
% plot one figure per cluster with all traces in that cluster
%-------------------------------------------------------------
for c=0:c_num    % loop through clusters
j=find(cluster_class(:,1)==c);  % vector with point numbers
si=size(j,1);   % number of spikes in cluster c
subplot(c_num+1,1,c+1);
% plot all spikes in cluster c
for i1=1:si 
    plot(spikes(j(i1),:))%,'color',cc(c+1,:));
    hold on;
end

tit = strcat('CLUSTER',{' '},num2str(c),{' '},'|',{'    '},...
    num2str(si(1,1)), {' '}, 'spikes found');
title(tit);
end