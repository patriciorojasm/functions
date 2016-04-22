%ftiempo=out(:,1);   %  experimental data, channel 1
ftiempo=out;   %  experimental data, channel 1
Fs=10000;       %sampling frequency
cutoff= 300;  % cutoff freq
tiempo=time_new;   

Wn=2*cutoff/Fs;
Wo=cutoff;

[B,A]=butter(8,Wn, 'high');  %Butterworth
%[B,A]=besself(4,Wn,'high');
filtrado=filter(B,A,ftiempo);

%figure;
%subplot(211); plot(ftiempo(1:10000),  'b'); hold all;
%subplot(212); plot(filtrado(1:10000), 'b');
