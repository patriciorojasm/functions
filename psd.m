Fs = 1/dt;   
t = time; %0:1/Fs:2.96;
%x = cos(2*pi*t*1.24e3)+ cos(2*pi*t*10e3)+ randn(size(t));
nfft = 2^nextpow2(length(ch1));
Pxx = abs(fft(ch1,nfft)).^2/length(ch1)/Fs;

% Create a single-sided spectrum
Hpsd = dspdata.psd(Pxx(1:length(Pxx)/2),'Fs',Fs);  
plot(Hpsd); 
