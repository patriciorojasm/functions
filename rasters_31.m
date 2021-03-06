%------------------------------------
% for use with concat_traces_marcelo_no_resample.m
%------------------------------------
%load('time.mat'); 
%time_window = time_window/10000;
%time_window(1)
%--- fix problem with ploting rates ------ 
c_num =max(cluster_class(:,1));
cc=lines(c_num+2);
for c=0:c_num
    j=find(cluster_class(:,1)==c);  % indice
    t=cluster_class(:,2);           % column with times
    t=.001*t';
end
%{
%---------------------------------------------------
% plot lines circles on each peak  
f_0=figure('OuterPosition',[50 200 1800 600]);  
plot(time_new, data);
c=0;
hold all;
c_num =max(cluster_class(:,1));
cc=lines(c_num+2);
for c=0:c_num+1;
    j=find(cluster_class(:,1)==c);    % indice of each clustered spike in cluster_class
    t=cluster_class(:,2);  % spike's time 
    t=.001*t';
   
    %plot( [t(j)+time_window(1);t(j)+time_window(1)],[ones(size(t(j)));zeros(size(t(j)))], 'k', 'color',cc(c+1,:));    %'color',rand(1,3));
    plot( [t(j);t(j)],[40*ones(size(t(j)));zeros(size(t(j)))], 'k', 'color',cc(c+1,:));    %'color',rand(1,3)); 
end
%xlim([time_new(1) time_new(end)]);
%ylim([-1 1]);
%---------------------------------------------------
%
% plot rasters individually
i=1;
c=0;
f_1 =figure('OuterPosition',[1800 400 400 400]);  hold all;
hold all;
c_num =max(cluster_class(:,1));
%subplot(c_num,1,c); 
%
for c=0:c_num
    j=find(cluster_class(:,1)==c);  % indice
     
    subplot(c_num+1 ,1,c+1);
    t=cluster_class(:,2);           % column with times
    %t=0.01*.5*t';
    t=.001*t';
    %plot([t(j)+time_window(1);t(j)+time_window(1)],[ones(size(t(j)));zeros(size(t(j)))], 'color',cc(c+1,:));     % 'k');
    plot([t(j);t(j)],[ones(size(t(j)));zeros(size(t(j)))], 'color',cc(c+1,:)); 
    i=i+1;
    %xlim([time_new(1) time_new(end)]);
    %xlim([0 time_new(end)])
end
%}
%--------------------
% rates calculation
%--------------------
bin_length=5;     % duration of window to calculate rate (in seconds)
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


%t_bins(end)=[];                   
%title('rate');



