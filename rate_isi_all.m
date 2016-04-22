bin_length=5;     % duration of window to calculate rate (in seconds)
n_bins = round(time_new(end)/bin_length);   % number of windows
rate_a=[];
t_bins = 1:n_bins;    % time point at which rate was calculated
t_bins = t_bins*bin_length;
f_8=figure('OuterPosition',[2600 1000 500 500]);  
    t=cluster_class(:,2);
    t=t';
    t=t*.001;
    isi_b=[];%=zeros(100,n_bins);
    for i= 1:n_bins
        t_i= (i-1)*bin_length +1;
        t_f= i*bin_length;
        isi_bin=find(t < t_f & t > t_i)   ;   % spikes indexes
        %t(isi_bin)   % tiempos de cada peak de interes en el bin
        isi_b(i)=mean(diff(t(isi_bin))) ;  % mean time in seconds
        %isi_bin=find( t > t_i); 
        rate_a(i) = size(isi_bin,2)  ;  
        %disp(i);
    end
    
subplot(211);    
rate_a = rate_a/(bin_length);
isi_b(isnan(isi_b))=0;
%plot((time_new(1)+t_bins), rate_a, 'o-','color','k');
plot(t_bins, rate_a, '-o','color','k');
ylabel('rate (spikes/s)');
xlabel('time (s)');

subplot(212);
plot(t_bins,isi_b,'-o','color','k');
%xlim([time_new(1) t_bins(end)]);
ylabel('ISI (s)');
xlabel('time (s)');




