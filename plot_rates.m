figure;
subplot(211);
plot(tiempo,filtrado); hold all;
plot( tiempo(locs), -peaks, 'ro');
%ylim([-.3 .3]);
subplot(212);
plot(t_bins, rate, 'o-');
ylim([0 200]);
for g=1:2
    subplot(2,1,g);
    xlim([900 1200]);
end
clear g;