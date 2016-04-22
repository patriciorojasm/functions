% 4 may 2015
% test value of Butt filter
clear all;
load('150128001_r.mat');
filt=[50 100 200 300];
f1= figure; 
subplot(511);
plot(out([1:10000],1), 'b');
xlim([0 4000])
for i=1:4
    fi=filt(i);
    [ftiempo,tfTiempo,Fs,filtrado,freqFiltrado]=fftPlot('150128001_r.mat',fi, 2000);
    figure(f1);
    subplot(5,1,i+1);
    plot(filtrado(1:10000), 'b');
    title(strcat(num2str(filt(i)),' Hz Butt' ));
    xlim([0 4000]);
end
