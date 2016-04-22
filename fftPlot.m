%function[ftiempo,tfTiempo,Fs,filtrado,freqFiltrado]=fftPlot(archivo, cutoff, samplingFreq)
function[ftiempo,tfTiempo,Fs,filtrado,freqFiltrado]=fftPlot(cutoff, samplingFreq)
%clc;

% comment load if use second line
%load(archivo);
%--------------------------------
ftiempo=out(:,1);   %  experimental data, channel 1
Fs=samplingFreq; %sampling frequency
%tiempo=1/Fs:1/Fs:(size(ftiempo,2)/Fs);
tiempo=time_new;    


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                             %
%           FFT BLOCK         %
%                             %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%     

NFFT=2^nextpow2(size(ftiempo,1)); %gets an interger that is the nearest power of 2 of the lenght of the experimental data
tfTiempo=fft(ftiempo,NFFT)/size(ftiempo,1);%computes the fast fourier transform

f=Fs/2*linspace(0,1,NFFT/2+1); %lineal equispacing

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                             %
%           plotting          %
%                             %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 

figure;
subplot(3,2,1)
plot(tiempo,ftiempo);
title('Amplitud vs Tiempo (sin filtrar)');
ylabel('amplitud');
xlim([0 size(ftiempo,2)/Fs]);
xlabel('Tiempo [s]');
grid on;


size(f)
size(2*abs(tfTiempo(3:NFFT/2+1)))

subplot(3,2,3)
plot(f,2*abs(tfTiempo(3:NFFT/2+3)),'r'); 
title('Amplitud vs Frecuencia (sin filtrar)');
ylim([0 5e-4]);
ylabel('amplitud')
xlim([0 5000]);
xlabel('frecuencia [Hz]');
grid on;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                             %
%   Power Spectral Density    %
%                             %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 

%justifies the cutoff frequency of the filter

subplot(3,2,5)
Hs=spectrum.periodogram('Hamming'); 
psd(Hs,ftiempo,'Fs',Fs) 
% Potencia promedio 
Hdsp=psd(Hs,tfTiempo,'Fs',Fs); 


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                             %
%         Filtering           %
%                             %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 


Wn=2*cutoff/Fs;
Wo=cutoff;

[B,A]=butter(4,Wn, 'high');  %Butterworth
%[B,A]=besself(4,Wn,'high');

filtrado=filter(B,A,ftiempo);

%frequency response AFTER filter
freqFiltrado=fft(filtrado);


%filter plotting

subplot(3,2,2);
plot(tiempo,filtrado);
title('Amplitud vs Tiempo (filtrada)');
ylabel('amplitud');
xlim([0 size(filtrado,2)/Fs]);
grid on;

subplot(3,2,4)
plot(f,2*abs(freqFiltrado(3:NFFT/2+3)),'r');
title('Amplitud vs Frecuencia (filtrada)');
xlim([0 5000]);
ylim([0 5e-4]);
xlabel('Frecuencia [Hz]');
ylabel('amplitud');
grid on;


subplot(3,2,6)
Hs=spectrum.periodogram('Hamming'); 
psd(Hs,filtrado,'Fs',Fs) 
% Potencia promedio 
Hdsp=psd(Hs,freqFiltrado,'Fs',Fs); 

correlation= corrcoef(ftiempo,filtrado)



end