
v_discard= -.7;
j=find(cluster_class(:,1)==0);  % indice


for i=1:length(j)
    if data(j) > v_discard
        cluster_class( j,1)=1;
    elseif data(j) > v_discard
        cluster_class( j,1)=2;
    end
end

v_discard= -.99;
j=find(cluster_class(:,1)==2);
for i=1:length(j)
    if data(j) > v_discard
        cluster_class( j,1)=2;
    elseif data(j) > v_discard
        cluster_class( j,1)=3;
    end
end