clear out_f out_f_fft f1 f2;

figure,
%subplot(211);
plot( time_new, out(:,1), 'bo');
%xlim([0 100]);
hold all;
dat=out(:,1)';
%out_f=ft_preproc_highpassfilter(dat, 1000, 100);%, 4); %, 'but', 'onepass', 'no');
out_f = ft_preproc_lowpassfilter(dat, 2000, 50);%, 8, 'but', 'twopass');
%out_f=ft_preproc_highpassfilter(out(:,1), 2000, 30, 4, 'but', 'twopass');%, 'no');

%subplot(212);
plot( time_new, dat, '-+r');
xlim([0 2]);

figure;
%f = Fs*(0:Nsamps/2-1)/Nsamps;
f1 = (1/dt)*(0: size(dat,2)/2-1)/size(dat,1);
f2 = (1/dt)*(0: size(out_f,2)/2-1)/size(out_f,1);

out_fft = abs(fft(out(:,1)'));
out_fft = out_fft(1:size(dat,2)/2);

out_f_fft = abs(fft(out_f));
out_f_fft = out_f_fft(1:size(out_f,2)/2);

subplot(211);
plot(f1, out_fft, 'r'); hold on;
subplot(212);
plot(f2, out_f_fft, 'b'); 

