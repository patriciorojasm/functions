%{
test1=data(1:200000);
test1=test1';

L=size(test1,1);
NFFT = 2^nextpow2(L); % Next power of 2 from length of y
Y = fft(test1,NFFT)/L;
Fs=10000;
f = Fs/2*linspace(0,1,NFFT/2+1);

% Plot single-sided amplitude spectrum.
figure;
plot(f,2*abs(Y(1:NFFT/2+1))); 
title('Single-Sided Amplitude Spectrum of y(t)')
xlabel('Frequency (Hz)')
ylabel('|Y(f)|')


Wo =2/(10000/2);
Bw=Wo/35;
[b,a]=iirnotch(Wo,Bw);

ft_data=filter(b,a,data);

figure;
subplot(211);
plot(time_new(1:10000),data(1:10000)); %hold all;
subplot(212);
plot(time_new(1:10000),ft_data(1:10000)); 
%}

