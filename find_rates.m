time=time_new;
%[peaks,locs] = findpeaks( -out(:,1) ,'MinPeakHeight', .2 );
[peaks,locs] = findpeaks( -data ,'MinPeakHeight', .2 );
f1 = figure;
subplot(311);
%plot(time,out);
plot(time,data);
hold all;
plot( time(locs), -peaks, 'ro');
xlim([0 time(end)]);

d_locs = time(diff(locs));   % ISI  (not the most elegant calculation
%d_locs= 1./d_locs;
subplot(312);
time_t = time(locs);  % time point of each spike
time_t(end) =[];
plot(time_t, d_locs);
xlim([0 time(end)]);
%ylim([0 .2]);
%title('ISIs');
ylabel('ISI (s)');
xlabel('time (s)');

bin_length=2;     % duration of window to calculate rate (in seconds)
n_bins = round(time(end)/bin_length);   % number of windows
rate=[];
for i= 1:n_bins
    t_i= (i-1)*bin_length +1;
    t_f= i*bin_length;
    
    isi_bin=find( time(locs) < t_f);      % cumulative # of spikes
    rate(i) = size(isi_bin,1);      
end
rate_1 = rate(1);
rate = (diff(rate))/(bin_length);  % rate
rate = [rate_1 rate];
t_bins = 1:n_bins;    % time point at which rate was calculated
t_bins = t_bins*bin_length;
subplot(313);
%t_bins(end)=[];
plot(t_bins, rate, 'o-');
xlim([0 t_bins(end)]);
%title('rate');
ylabel('rate (spikes/s)');
xlabel('time (s)');

% -------------------
%{
figure;
splot_n =10;
for j=1:splot_n
    subplot(splot_n, 1, j);
    plot(time,out); hold all;
    plot( time(locs), peaks, 'ro');
    ti = (j-1)*time(end)/splot_n;
    tf = j*time(end)/splot_n ;
    xlim([ti tf]);
end
%}
%---------------------

saveas(f1, 'firing', 'fig');
saveas(f1, 'firing', 'png');
saveas(f1, 'firing', 'tiff');
%{
figure;
%plot(time,out); hold all;
plot(time,data); hold all;
plot( time(locs), peaks, 'ro');
xlim([0 20]);
%}