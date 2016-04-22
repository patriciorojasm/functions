
c=0;
c_num =max(cluster_class(:,1));
%m= zeros(30, c_num);
names={'zero' 'uno' 'dos' 'tres' 'cuatro' 'cinco' 'seis' 'siete' 'ocho'};

%{ 
eliminate spikes closer than 0.2 ms
c_class = cluster_class;   % original matrix is c_class
d_class = diff(c_class(:,2));
del_index=find(d_class < 2);  % search for deltas < 2 ms (20)
del_index = del_index +1;  %correction 
cluster_class(del_index,:)=[];
%} 
%---------
%load('ch1.mat');
for c=0:c_num+1
    j=find(cluster_class(:,1)==c);
    t=cluster_class(:,2);
    t=t';
    t=t*.01;
    % plot([t(j);t(j)],[ones(size(t(j)));zeros(size(t(j)))], 'k', 'color',cc(c,:));  
    %'color',rand(1,3));
    hold all;
    %clus_matrix = ['cluster_',num2str(c) ]
    s.(names{c+1})=j;
    tim.(names{c+1})= t(j);
end