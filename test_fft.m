
Fs1=1000;                        %Sampling rate
NFFT1=2^nextpow2(size(out(1,:),2));            %gets an interger that is the nearest power of 2 of the lenght of the experimental data
fftY1=fft(out(1,:),NFFT1)/size(out(1,:),2);      %computes the fast fourier transform
f1=Fs1/2*linspace(0,1,NFFT1/2+1);     %lineal equispacing

figure, 
plot(f1,2*abs(fftY1(3:NFFT1/2+3)),'g');   %plot fft(Im)
