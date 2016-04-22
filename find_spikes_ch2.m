% Find spikes usando f_Get_spikes_1 y Do_clustering

clear
f_Get_spikes_1('ch2.mat', 10000, 1)
load('ch2.mat_spikes.mat')
%plo_spikes
Do_clustering
load('times_ch2.mat_spikes.mat')
load('time.mat')
load('ch2.mat')
find_clusters
rasters_1
ylim([-.2 .2])
xlim([0 20])

rasters
print('-dpsc2','all_figures');

plot_trace_raster
print('-dpsc2','-append','all_figures');

plot_isi_circles
print('-dpsc2','-append','all_figures');


plot_clusters
print('-dpsc2','-append','all_figures');

saveas(f1, 'raster', 'fig');
saveas(f1, 'raster', 'png');

saveas(f2, 'trace_raster', 'fig');
saveas(f2, 'trace_raster', 'png');

saveas(f6, 'trace_raster', 'fig');
saveas(f6, 'trace_raster', 'png');