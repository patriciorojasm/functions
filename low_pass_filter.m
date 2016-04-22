%ftiempo=out(:,1);   %  experimental data, channel 1
ftiempo=data;   %  experimental data, channel 1
%ftiempo=data;   %  experimental data, channel 1

Fs=20000;       %sampling frequency
cutoff= 100;  % cutoff freq
tiempo=time_new;   

Wn=2*cutoff/Fs;
Wo=cutoff;

%[B,A]=butter(4,Wn, 'high');  %Butterworth
[B,A]=besself(4,Wn, 'low');  %Butterworth
%[B,A]=besself(4,3000,'low');
filtrado=filter(B,A,ftiempo);
%figure; freqs(B,A);

%{
figure;
subplot(211), plot(time_new, data);
xlim([600 601]);
subplot(212), 
plot(time_new, filtrado);
xlim([600 601]);
%ylim([-60 20]);
%}
