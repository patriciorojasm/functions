clear, close all;
figure;
t=linspace(0,1,1001);
N=size(t,2);              % number of samples
y= sin(2*pi*t*6) + sin(2*pi*t*10) + sin(2*pi*t*13);
NFFT = 2^nextpow2(N); 
dt=0.001;                 % inter-sample time difference
f = (1/dt)/2*linspace(0,1,NFFT/2+1);
F=fft(y);                   % fft

subplot(311);
plot(t,y);
title('original');

subplot(312);
fu=2*abs(F(abs(1:NFFT/2+1)));    % FFT magnitude
plot(f,fu); %2*abs(F(abs(1:NFFT/2+1))));
hold all; xlim([0 50]);

[peaks,locs]=findpeaks(fu, 'threshold', 5);
w =f(locs);             % gives us a list of frequencies for the FFT

ipos=find(w>0);         
freqs= w(ipos);         % only look at positive frequencies
mags=abs(F(ipos));      % magnitude component
phase= imag(F(ipos));   % phase component
%ip(ip>5)=0;
ip=locs;                % find peaks in FFT

Fs=F;                   % make a copy of the signal FFT
Fs(ip(2:3))=0;          % set peaks corresponding to 
yf=ifft(Fs);            % reconstruct
%ip(ip>5)=0;
fu_s=2*abs(Fs(abs(1:NFFT/2+1)));
[peaks_s,locs_s]=findpeaks(fu_s, 'threshold', 5);
w_s =fu_s(locs);        % find peaks in FFT

Ff=F;                   % make a copy of the signal FFT
%ip=locs_s;
%Ff(ip(2:5))=0;         % set 10Hz and 13Hz peaks to zero
magsf=abs(Ff(ipos));    % magnitude component
phasef=imag(Ff(ipos));  % phase component
yf=ifft(Ff);            % reconstruct

plot(f,fu_s, 'r-');

%plot(f, mags,'b-'); hold all;
%plot(f, magsf,'r-', 'linewidth',2);
legend('original', 'filtered');
xlim([0 50]);

subplot(313);
yr=ifft(F);
plot(t,y,'b-'); hold all;
plot(t,yr, 'r-', 'linewidth',2);
legend('original', 'filtered');


%-----------------------------------------------
