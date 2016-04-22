close all;
data1=data(4000000:6000000);
data2=data(11000000:13000000);

dt=diff(time_new(1:2));
size_out=size(data1,2);
time_new_1 = linspace(0, dt*size_out, size_out );
size_out=size(data2,2);
time_new_2 = linspace(0, dt*size_out, size_out );

time1=time_new_1;
%[peaks,locs] = findpeaks( -out(:,1) ,'MinPeakHeight', .2 );
[peaks,locs] = findpeaks( data1 ,'MinPeakHeight', 5 );
f1 = figure;

subplot(211);
%plot(time,out);
plot(time1,data1);
title('Original');
hold all;
plot( time1(locs), peaks, 'ro');
xlim([0 time1(end)]);
ylim([-80 50]);

d_locs = time1(diff(locs));   % ISI  (not the most elegant calculation
%d_locs= 1./d_locs;
subplot(212);
time_t = time1(locs);  % time point of each spike
time_t(end) =[];
plot(time_t, d_locs);
xlim([0 time1(end)]);
ylim([0 3]);
%title('ISIs');
ylabel('ISI (s)');
xlabel('time (s)');
m_c=mean(d_locs)
sd_c=std(d_locs)

%{
bin_length=2;     % duration of window to calculate rate (in seconds)
n_bins = round(time(end)/bin_length);   % number of windows
rate=[];
for i= 1:n_bins
    t_i= (i-1)*bin_length +1;
    t_f= i*bin_length;
    
    isi_bin=find( time1(locs) < t_f);      % cumulative # of spikes
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
%}

% -------------------
% MUSC
% -------------------
time2=time_new_2;
[peaks,locs_m] = findpeaks( data2 ,'MinPeakHeight', 5 );

figure;
%subplot(121)
hist(diff(time1(locs)));hold on;
%ylim([0 5000])
%xlim([0 .25])
%subplot(122)
hist(diff(time2(locs_m)));
%ylim([0 5000])
%xlim([0 .25])
%xlim([.0001 .004])

h = findobj(gca,'Type','patch');
set(h(1),'Facecolor',[1 0 0],'EdgeColor','k');
set(h(2),'Facecolor',[0 0 1],'EdgeColor','k');
%legend();

f2 = figure;

subplot(211);
%plot(time2,out);
plot(time2,data2);
title('Original + Muscimol');
hold all;
plot( time2(locs_m), peaks, 'ro');
xlim([0 time2(end)]);
ylim([-80 50]);

d_locs = time2(diff(locs_m));   % ISI  (not the most elegant calculation
%d_locs= 1./d_locs;
subplot(212);
time_t = time2(locs_m);  % time point of each spike
time_t(end) =[];
plot(time_t, d_locs);
%xlim([0 time2(end)]);
%ylim([0 .2]);
ylim([0 3]);
%title('ISIs');
ylabel('ISI (s)');
xlabel('time (s)');

m_m=mean(d_locs)
sd_m=std(d_locs)
%{
bin_length=2;     % duration of window to calculate rate (in seconds)
n_bins = round(time(end)/bin_length);   % number of windows
rate=[];
for i= 1:n_bins
    t_i= (i-1)*bin_length +1;
    t_f= i*bin_length;
    
    isi_bin=find( time(locs_m) < t_f);      % cumulative # of spikes
    rate(i) = size(isi_bin,1);      
end
rate_1 = rate(1);
rate = (diff(rate))/(bin_length);  % rate
rate = [rate_1 rate];
t_bins = 1:n_bins;    % time point at which rate was calculated
t_bins = t_bins*bin_length;
%subplot(313);
%t_bins(end)=[];
%plot(t_bins, rate, 'o-');
%xlim([0 t_bins(end)]);
%title('rate');
%ylabel('rate (spikes/s)');
%xlabel('time (s)');
%}


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
%
%---------------------

saveas(f1, 'firing', 'fig');
saveas(f1, 'firing', 'png');
saveas(f1, 'firing', 'tiff');
%
figure;
%plot(time,out); hold all;
plot(time,data); hold all;
plot( time(locs), peaks, 'ro');
xlim([0 20]);
%}