clear ss tom;
c=0;
c_num =max(cluster_class(:,1));
%m= zeros(30, c_num);
%names={'zero' 'uno' 'dos' 'tres' 'cuatro' 'cinco' 'seis' 'siete' 'ocho'};

%load('ch1.mat');
for c=0:c_num+1
    j=find(cluster_class(:,1)==c); % index of spike's cluster
    t=cluster_class(:,2);          % spike's time (from ALL spikes)
    t=t';
    %t=t*.001;                      % time in seconds
    ss{c+1}=j;                     % cell array with all spike's clusters
    tom{c+1}= t(j);                % cell array times 
end