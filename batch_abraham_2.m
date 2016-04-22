clear

files=dir;
files(1:2) =[];
dirFlags= [files.isdir];
subFolders=files(dirFlags);
%for k=1:length(subFolders)
%    fprintf('#%d=%s\n', k,subFolders(k).name);
%end
disp('Analyzing......');
for k=1:length(subFolders)  
	cd (subFolders(k).name); 
    
	
    f_Get_spikes_1('ch2.mat', 10000, 1)    % This files has default filtering values
    load('ch2.mat_spikes.mat')
    %------------------------------------
    %   Clustering
    %------------------------------------
    Do_clustering
    load('times_ch2.mat_spikes.mat')
    load('time.mat')
    load('ch2.mat')
    find_clusters
    rasters_31
        saveas(f_0, 'f0', 'fig');
        saveas(f_0, 'f0', 'jpg');
        saveas(f_1, 'f1', 'fig');
        saveas(f_1, 'f1', 'jpg');
        saveas(f_2, 'f2', 'fig');
        saveas(f_2, 'f2', 'jpg');
    plot_clusters
        saveas(f_4, 'f4', 'fig');
        saveas(f_4, 'f4', 'jpg');
        saveas(f_5, 'f5', 'fig');
        saveas(f_5, 'f5', 'jpg');
        saveas(f_6, 'f6', 'fig');
        saveas(f_6, 'f6', 'jpg');
    rate_all
        saveas(f_8, 'f8', 'fig');
        saveas(f_8, 'f8', 'jpg');
    spike_properties_epi_1
        saveas(f_6, 'f6', 'fig');
        saveas(f_6, 'f6', 'jpg');
        saveas(f_7, 'f7', 'fig');
        saveas(f_7, 'f7', 'jpg');
        
    isi_all= diff(cluster_class(:,2));
    x_axis = cluster_class(:,2);
    x_axis(end) = [];
    %----plot ISI---------
    f_isi_lin = figure;
    plot(x_axis, isi_all,'o', 'color','black');
    xlabel('time (ms)'); ylabel('ISI (ms)');
    %---log plot ISI------
    f_isi_log=figure;
    semilogy(x_axis, isi_all,'o', 'color','black');
    xlabel('time (ms)'); ylabel('ISI (ms)');

    saveas(f_isi_lin, 'f_isi_lin', 'fig');
    saveas(f_isi_lin, 'f_isi_lin', 'jpg');
    saveas(f_isi_log, 'f_isi_log', 'fig');
    saveas(f_isi_log, 'f_isi_log', 'jpg');
       
        
        
    save analyzed_160126.mat;
    close all;
	clear  c_num cluster_class data i i1 index inspk ipermut isi_bin j rate rate_1
    clear rate_cluster s si spikes t t_bins tim tim_new tit
	n=length(subFolders);
    str = strcat('analyzed ',{' '},num2str(k),{' '},'out of',{' '},num2str(n));
	disp(str);
	cd ..
end
disp('END of fun');




