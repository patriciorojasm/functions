% Find spikes usando f_Get_spikes_1 y Do_clustering

%------------------------------------
%  Create matrices for WaveClus
%------------------------------------
out = out';
save('time.mat', 'time_new', '-v7.3')
data=[];
data = out(2,:);
save('ch2.mat', 'data', '-v7.3');
data = out(1,:);
save('ch1.mat', 'data', '-v7.3');

clear
%------------------------------------
%   Find peaks
%------------------------------------
%f_Get_spikes_1('ch1.mat', 10000, 1)
% f_Get_spikes_1  has parameters used for limpets
f_Get_spikes_2('ch1.mat', 10000, 1)    % This files has default filtering values
load('ch1.mat_spikes.mat')

%------------------------------------
%   Clustering
%------------------------------------
Do_clustering
load('times_ch1.mat_spikes.mat')
load('time.mat')
load('ch1.mat')
find_clusters

rasters_2
%rasters
%xlim([0 50])
%ylim([-.7 .2])

% !!!
%rasters
%print('-dpsc2','all_figures');

%{
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
%}
