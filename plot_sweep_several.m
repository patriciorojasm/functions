% plot sweep "sweep"
% uses data from concat_traces>marcelo_2.m

figure, 
subplot(311);
plot( time_new, out(:,1))
sweep_dur=time_new(49920/5);  % time of one sweep
sweep_i = 80;
sweep_f = 170;

x1=(sweep_i-1)*sweep_dur;
%x2=x1+sweep_dur;
x2=(sweep_f-1)*sweep_dur +sweep_dur;

xlim([x1 x2]);
ylim([-1 1]);
hold all;
%--------------------------------------
% copied and modified from find_rates.m
%--------------------------------------
time=time_new;
[peaks,locs] = findpeaks( -out(:,1) ,'MinPeakHeight', .08);%, 'threshold', .05 );

subplot(311);
%plot(time,out);
%hold all;
plot( time(locs), -peaks, 'ro');
%xlim([0 time(end)]);

d_locs = time(diff(locs));   % ISI  (not the most elegant calculation
d_locs= 1./d_locs;
subplot(312);
time_t = time(locs);  % time point of each spike
time_t(end) =[];
plot(time_t, d_locs);
%xlim([0 time(end)]);
%ylim([0 .2]);
%title('ISIs');
xlim([x1 x2]);
ylabel('ISI (ms)');
xlabel('time (s)');

bin_length=5;     % duration of window to calculate rate (in seconds)
n_bins = round(time(end)/bin_length);   % number of windows
rate=[];
for i= 1:n_bins
    t_i= (i-1)*bin_length;% +1;
    t_f= i*bin_length;
    
    isi_bin=find( time(locs) < t_f);      % cumulative # of spikes
    rate(i) = size(isi_bin,1);    
    %disp(rate(i))
end
rate_1 = rate(1);
rate = (diff(rate))/(bin_length);  % rate
rate = [rate_1 rate];
t_bins = 1:n_bins;    % time point at which rate was calculated
t_bins = t_bins*bin_length;
subplot(313);
%t_bins(end)=[];
plot(t_bins, rate, 'o-');
%r=1./d_locs;                      
%plot(r);
xlim([x1 x2]);
%ylim([0 1]);
%xlim([0 t_bins(end)]);
%title('rate');
ylabel('rate (spikes/s)');
xlabel('time (s)');
