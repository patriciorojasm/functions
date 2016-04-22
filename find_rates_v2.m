tic
time=time_new;
%filtrado=filtrado(1,:);
%[peaks,locs] = findpeaks( filtrado ,'MinPeakHeight', .1 );
[peaks,locs] = findpeaks( data ,'MinPeakHeight', .1 );
f1 = figure;
%---raster---
%subplot(411);
%plot(tiempo,out(:,1));  % not part of raster
%for ii=1:size(locs,1)
%    plot([locs(ii) ;locs(ii)],[0 1], 'k');
%    hold on;
%end

%------------------
%subplot(311);
%plot(tiempo,filtrado);
%hold all;
%plot( tiempo(locs), peaks, 'ro');
%xlim([0 tiempo(end)]);
%ylim([-.3 .3]);
%------------------

d_locs = tiempo(diff(locs));   % ISI  (not the most elegant calculation
%d_locs= 1./d_locs;
%subplot(312);
time_t = tiempo(locs);  % time point of each spike
time_t(end) =[];
%plot(time_t, d_locs);
xlim([0 tiempo(end)]);
ylim([0 10]);
%title('ISIs');
ylabel('ISI (s)');
xlabel('time (s)');

bin_length=1;     % duration of window to calculate rate (in seconds)
n_bins = round(tiempo(end)/bin_length);   % number of windows
rate=[];
for i= 1:n_bins
    t_i= (i-1)*bin_length +1;
    t_f= i*bin_length;
    
    isi_bin=find(tiempo(locs) < t_f);      % cumulative # of spikes
    rate(i) = size(isi_bin,1);      
end
rate_1 = rate(1);
rate = (diff(rate))/(bin_length);  % rate
rate = [rate_1 rate];
t_bins = 1:n_bins;    % time point at which rate was calculated
t_bins = t_bins*bin_length;
%subplot(313);
%t_bins(end)=[];
plot(t_bins, rate, 'o-');
xlim([0 t_bins(end)]);
ylim([0 100]);
%title('rate');
ylabel('rate (spikes/s)');
xlabel('time (s)');
toc

% -------------------

%{
saveas(f1, 'firing_rate0', 'fig');
%saveas(f1, 'firing', 'png');
%saveas(f1, 'firing', 'tiff');


%---------------------------
% plot windows for zoom
%---------------------------
figure;
ex=1;   % counter for callback
plot(tiempo,filtrado); hold all;
plot( tiempo(locs), peaks, 'ro');

hbutton=uicontrol(gcf,'style','pushbutton',...
                                 'string','End',...
                                 'callback',@button_next);

%---------------------------
% plot in six plots
%---------------------------
f_6=figure;
k=1;
t_total=tiempo(end);

for k=1:6
    subplot(6,1,k); 
    plot(tiempo, filtrado);hold all;
    plot( tiempo(locs), peaks, 'ro');
    xlim([(k-1)*t_total/6  k*t_total/6]);
    ylim([-.3 .3]);
    %hold all;
end


saveas(f_6, 'firing_in_6', 'fig');


%}


