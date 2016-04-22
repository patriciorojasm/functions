

figure('OuterPosition',[2200 500 700 500]);  
for k=1:c_num+1
    plot(t_bins, rate_cluster{k}, 'o-','color',cc(k,:));
    hold all;
end 
xlim([time_new(1) t_bins(end)]);
%ylim([0 20]);
ylabel('rate (spikes/s)');
xlabel('time (s)');


