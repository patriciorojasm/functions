%------------------------------------
% for use sfter concat_traces_time_window.m
%------------------------------------

%------------------------------------
% for use with ampdetect2.m
%------------------------------------

load('time_window.mat'); 
time_window = time_window/10000;


%---------------------------------------------------
% plot lines circles on each peak  
figure('OuterPosition',[50 200 1800 600]);  
plot(time_new, data);
%c=0;
%hold all;
%c_num =max(cluster_class(:,1));
%cc=lines(c_num+2);
%for c=0:c_num+1;
 %   j=find(cluster_class(:,1)==c);    % indice of each clustered spike in cluster_class
     %j=t(spikes_s);
    %disp( size(cluster_class))
    %t=spikes_s(1,:);  % spike's time 
    %t=.001*t';
    %for k=1:size(j,2) 
     %   t_p(k,c+1)=find(time_new ==time_new(j(k))); %tiempo de la k-esima espiga del cluster 
    %end
    %plot(t(j) +time_window(1), data(t_p(:,c+1))  ,'k','color',cc(c+1,:));    %
    %plot( [t(j)+time_window(1);t(j)+time_window(1)],[ones(size(t(j)));zeros(size(t(j)))], 'r');    %'color',rand(1,3));
    plot(time_new(index_s), 'or');
%end
xlim([time_new(1) time_new(end)]);
ylim([-1 1]);
%---------------------------------------------------
%{
%--------------------
% rates calculation
%--------------------
bin_length=.5;     % duration of window to calculate rate (in seconds)
n_bins = round(time_new(end)/bin_length);   % number of windows
rate=[];
t_bins = 1:n_bins;    % time point at which rate was calculated
t_bins = t_bins*bin_length;
figure('OuterPosition',[2200 500 700 800]);  
%for k=0:c_num
    %j=find(cluster_class(:,1)==k);  % indice
    %for i= 1:n_bins
        t_i= (i-1)*bin_length +1;
        t_f= i*bin_length;
    
        %isi_bin=find(tiempo(locs) < t_f);      % cumulative # of spikes
        isi_bin=find(t(j)+time_window(1) < t_f);      % cumulative # of spikes
        rate(i) = size(isi_bin,2);      
    %end
rate_1 = rate(1);
rate = (diff(rate))/(bin_length);  % rate
rate = [rate_1 rate];
rate_cluster{k+1}=rate;     % add isi of each cluster to cell array
subplot(c_num+1,1,k+1);
plot(t_bins, rate, 'o-','color',cc(k+1,:));
xlim([time_new(1) t_bins(end)]);
%ylim([0 100]);
ylabel('rate (spikes/s)');
xlabel('time (s)');
%end


%t_bins(end)=[];
%title('rate');

%}

