% Find spikes usando f_Get_spikes_1 y Do_clustering

%clear
f_Get_spikes_1('ch1.mat', 10000, 1)
load('ch1.mat_spikes.mat')
%plo_spikes
Do_clustering
load('times_ch1.mat_spikes.mat')
load('time.mat')
load('ch1.mat')
find_clusters
%time=linspace(0,1520.024, 1519012);
rasters_1
xlim([0 50])
ylim([-.7 .2])

% !!!
rasters
print('-dpsc2','all_figures');

plot_trace_raster
print('-dpsc2','-append','all_figures');

plot_isi_circles
print('-dpsc2','-append','all_figures');

plot_clusters
print('-dpsc2','-append','all_figures');

temp_segments
print('-dpsc2','-append','all_figures');

saveas(f1, 'raster', 'fig');
saveas(f1, 'raster', 'png');

saveas(f2, 'trace_raster', 'fig');
saveas(f2, 'trace_raster', 'png');

%saveas(f3, 'trace_clusters', 'fig');
%saveas(f3, 'trace_clusters', 'png');

saveas(f4, 'trace_clusters_all', 'fig');
saveas(f4, 'trace_clusters_all', 'png');

%saveas(f6, 'trace_circles_raster', 'fig');
%saveas(f6, 'trace_circles_raster', 'png');

saveas(fc, 'isi_circles', 'fig');
saveas(fc, 'isi_circles', 'png');

saveas(f7, 'temp_segments', 'fig');
saveas(f7, 'temp_segments', 'png');