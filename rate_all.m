bin_length=5;     % duration of window to calculate rate (in seconds)
n_bins = round(time_new(end)/bin_length);   % number of windows
rate_a=[];
t_bins = 1:n_bins;    % time point at which rate was calculated
t_bins = t_bins*bin_length;
f_8=figure('OuterPosition',[2600 1000 500 500]);  
%for k=0:c_num
  
   % t=cluster_class(:,2);  % spike time
    
    for i= 1:n_bins
        t_i= (i-1)*bin_length +1;
        t_f= i*bin_length;
    
        %isi_bin=find(tiempo(locs) < t_f);      % cumulative # of spikes
        %isi_bin=find(t+time_window(1) < t_f);      % cumulative # of spikes
        isi_bin=find(t < t_f);      % cumulative # of spikes
        rate_a(i) = size(isi_bin,2);      
    end
rate_a = (diff(rate_a))/(bin_length);  % rate
rate_a = [rate_1 rate_a];
%rate_cluster{k+1}=rate_a;     % add isi of each cluster to cell array
%subplot(c_num+1,1,k+1);
%----- for concat no resample -------
%plot(t_bins, rate_a, 'o-','color','k');
%----- for concat time window -------
plot((time_new(1)+t_bins), rate_a, 'o-','color','k');
xlim([time_new(1) t_bins(end)+time_new(1)]);
%ylim([0 100]);
ylabel('rate (spikes/s)');
xlabel('time (s)');
%end

