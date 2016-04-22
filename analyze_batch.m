clear

files=dir;
files(1:2) =[];
dirFlags= [files.isdir];
subFolders=files(dirFlags);

disp('Analyzing......');
for k=1:length(subFolders)  
	cd (subFolders(k).name); 
    
    f_Get_spikes_1('ch2.mat', 10000, 1)    % This files has default filtering values
    load('ch2.mat_spikes.mat')
    
    c=0;
    c_num =max(cluster_class(:,1));
    names={'zero' 'uno' 'dos' 'tres' 'cuatro' 'cinco' 'seis' 'siete' 'ocho'};

    for c=0:c_num+1
        j=find(cluster_class(:,1)==c);
        t=cluster_class(:,2);
        t=t';
        t=t*.01;
        s.(names{c+1})=j;
        tim.(names{c+1})= t(j);
    end
    
    %------------------------------------
    %   Clustering
    %------------------------------------
    Do_clustering
    load('times_ch2.mat_spikes.mat')
    load('time.mat')
    load('ch2.mat')
    %-------------------
    %   find_clusters
    %-------------------
    
    % plot lines  on each peak  
    figure('OuterPosition',[50 200 1800 600]);  
    plot(time_new, data);
    c=0;
    hold all;
    c_num =max(cluster_class(:,1));
    cc=lines(c_num+2);
    for c=0:c_num+1;
        j=find(cluster_class(:,1)==c);    % indice of each clustered spike in cluster_class
        t=cluster_class(:,2);  % spike's time 
        t=.001*t';
        plot( [t(j);t(j)],[40*ones(size(t(j)));zeros(size(t(j)))], 'k', 'color',cc(c+1,:));    %'color',rand(1,3)); 
    end

    % plot rasters individually
    i=1;
    c=0;
    f1 =figure('OuterPosition',[1800 400 400 400]);  hold all;
    hold all;
    c_num =max(cluster_class(:,1));
    %subplot(c_num,1,c); 
    for c=0:c_num
        j=find(cluster_class(:,1)==c);  % indice
     
        subplot(c_num+1 ,1,c+1);
        t=cluster_class(:,2);           % column with times
        t=.001*t';
        plot([t(j);t(j)],[ones(size(t(j)));zeros(size(t(j)))], 'color',cc(c+1,:)); 
        i=i+1;
        %xlim([time_new(1) time_new(end)]);
        %xlim([0 time_new(end)])
    end

    %--------------------
    % rates calculation
    %--------------------
    bin_length=2;     % duration of window to calculate rate (in seconds)
    n_bins = round(time_new(end)/bin_length);   % number of windows
    rate=[];
    t_bins = 1:n_bins;    % time point at which rate was calculated
    t_bins = t_bins*bin_length;
    figure('OuterPosition',[2200 500 700 800]);  
    for k=0:c_num
    
        j=find(cluster_class(:,1)==k);  % indice
        for i= 1:n_bins
            t_i= (i-1)*bin_length +1;
            t_f= i*bin_length;
            %isi_bin=find(tiempo(locs) < t_f);      % cumulative # of spikes
            %isi_bin=find(t(j)+time_window(1) < t_f);      % cumulative # of spikes
            isi_bin=find(t(j) < t_f);      % cumulative # of spikes
            rate(i) = size(isi_bin,2);      
        end
    rate_1 = rate(1);
    rate = diff(rate)/bin_length;  % rate
    rate = [rate_1 rate];
    rate_cluster{k+1}=rate;     % add isi of each cluster to cell array
    subplot(c_num+1,1,k+1);
    plot(t_bins, rate, 'o-','color',cc(k+1,:));
    %xlim([time_new(1) t_bins(end)]);
    %ylim([0 100]);
    ylabel('rate (spikes/s)');
    xlabel('time (s)');
    end

    
    
    
    
    rasters_31
        saveas(f0, 'f0', 'fig');
        saveas(f0, 'f0', 'jpg');
        saveas(f1, 'f1', 'fig');
        saveas(f1, 'f1', 'jpg');
        saveas(f2, 'f2', 'fig');
        saveas(f2, 'f2', 'jpg');
    plot_clusters
        saveas(f_4, 'f4', 'fig');
        saveas(f_4, 'f4', 'jpg');
        saveas(f_5, 'f5', 'fig');
        saveas(f_5, 'f5', 'jpg');
    rate_all
        saveas(f_8, 'f8', 'fig');
        saveas(f_8, 'f8', 'jpg');
    spike_properties_epi_1
        saveas(f_6, 'f6', 'fig');
        saveas(f_6, 'f6', 'jpg');
        saveas(f_7, 'f7', 'fig');
        saveas(f_7, 'f7', 'jpg');
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




