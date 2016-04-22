function []=graficar(Y1,Y2,T,init,ending)

Y=[Y1;Y2]'

%Im
Fs1=size(T,1)/max(T);                        %Sampling rate
NFFT1=2^nextpow2(size(Y(:,1),1));            %gets an interger that is the nearest power of 2 of the lenght of the experimental data
fftY1=fft(Y(:,1),NFFT1)/size(Y(:,1),1);      %computes the fast fourier transform
f1=Fs1/2*linspace(0,1,NFFT1/2+1);            %lineal equispacing

psdY1=10*log10(pwelch(Y(:,1)));              %Power spectral density, in dB
NFFT11=2^nextpow2(size(psdY1,1));            %used to get the frequency vector
f11=Fs1/2*linspace(0,1,NFFT11/2+1);          %frequency



%Vm
NFFT2=2^nextpow2(size(Y(:,2),1));           %gets an interger that is the nearest power of 2 of the lenght of the experimental data
fftY2=fft(Y(:,2),NFFT2)/size(Y(:,2),1);     %computes the fast fourier transform
f2=Fs1/2*linspace(0,1,NFFT2/2+1);           %lineal equispacing

psdY2=10*log10(pwelch(Y(:,2)));             %Power spectral density, in dB
NFFT22=2^nextpow2(size(psdY2,1));           %used to get the frequency vector
f22=Fs1/2*linspace(0,1,NFFT22/2+1);         %frequency




g=figure();

subplot(3,2,1)
 plot(T,Y(:,1));                            %plot Im vs Time
 title(['Im' init ending])
 xlabel('Tiempo [s]');
 ylabel('Im')
 grid on;
 xlim([0 max(T)])
 %set the limits on the mean +- 2 stdev
   ylim([mean(Y(:,1))-2*std(Y(:,1)) mean(Y(:,1))+2*std(Y(:,1))]) 
subplot(3,2,2)
 plot(T,Y(:,2))                            %plot Vm vs Time
 title('Vm')
 xlabel('Tiempo [s]');
 ylabel('Vm')
 grid on;
 xlim([0 max(T)])
 %set the limits on the mean +- 2 stdev
   ylim([mean(Y(:,2))-2*std(Y(:,2)) mean(Y(:,2))+2*std(Y(:,2))]) 
subplot(3,2,3)
 plot(f1,2*abs(fftY1(3:NFFT1/2+3)),'g');   %plot fft(Im)
 title('FFT(Im)');
 ylim([0  0.03]);
 ylabel('amplitud')
 xlim([0 100]);
 xlabel('frecuencia [Hz]');
 grid on;
subplot(3,2,4)
 plot(f2,2*abs(fftY2(3:NFFT2/2+3)),'g');   %plot fft(Vm)
 title('FFT(Vm)');
 ylim([0  6]);
 ylabel('amplitud')
 xlim([0 100]);
 xlabel('frecuencia [Hz]');
 grid on;
subplot(3,2,5)
 plot(f11,psdY1,'r');                      %plot PSD(Im)
 title('PSD Im');
 ylim([-20 20]);
 ylabel('dB/Hz')
 xlim([0 100]);
 xlabel('frecuencia [Hz]');
 grid on;
subplot(3,2,6)
 plot(f22,psdY2,'r');                      %plot PSD(Vm)
 title('PSD Vm');
 ylim([-5 65]);
 ylabel('dB/Hz')
 xlim([0 100]);
 xlabel('frecuencia [Hz]');
 grid on;
 
 clear;
 clc;
end
 
 
 