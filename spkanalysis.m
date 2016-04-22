load analyzed_20141028;

maxclu=max(cluster_class(:,1));

TRIALS=[];
SPK=[];
cc={'r','b'};

% Build the raster and the histogram
for i=1:maxclu-1
    indx=cluster_class(:,1)==i;
    trial=i*ones(sum(indx),1);
    TRIALS=cat(1,TRIALS,trial);
    spk=cluster_class(indx,2)./1000; % seconds
    [counts, values] = hist(spk, 80);
    hold on
    bar(values, counts,cc{i});
    SPK=cat(1,SPK,spk);
end


bottom=min(SPK);
top=max(SPK);
rasterplot(TRIALS,SPK,[bottom top]);

% build the firing rate using optimization of the kernel density function 
% and recover the firing rate using the area of the histogram
figure;

for i=1:maxclu-1
    indx=cluster_class(:,1)==i;
    trial=i*ones(sum(indx),1);
    TRIALS=cat(1,TRIALS,trial);
    spk=cluster_class(indx,2)./1000; % seconds
    [f,xi,w] = ksdensity(spk);
    area = sum(hts) * (ctrs(2)-ctrs(1));
    plot(xi,f*area./w,cc{i},'LineWidth',2);
    hold on;
end

