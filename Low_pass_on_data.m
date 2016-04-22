%v_pol=3;
%f= 7;
%f_data=sgolayfilt(data,v_pol,f);
figure,

ftiempo=data;   %  experimental data, channel 1
Fs=20000;       %sampling frequency
cutoff= 30;  % cutoff freq
tiempo=time_new;   

Wn=2*cutoff/Fs;
Wo=cutoff;
[B,A]=butter(8,Wn, 'high');  %Butterworth
%[B,A]=besself(4,Wn,'high');
filtrado=filter(B,A,ftiempo);






subplot(211); plot(time_new,data); %xlim([2771.5 2772]);
%ylim([60 -60]);
title('no filter');

%subplot(212);plot(time_new,f_data); %xlim([2771.5 2772]);
subplot(212);plot(tiempo,filtrado); %xlim([2771.5 2772]);

%ylim([-.6 .6]);
%st=strcat('pol ',{' '},num2str(v_pol),', f',{' '},num2str(f)); 
st='filtrado';
title(st);


%for i=1:2 subplot(2,1,i); ylim([-100 60]); xlim([800 801]); end
for i=1:2 subplot(2,1,i);  xlim([300 301]); end

%subplot(2,1,1);ylim([9.5 10.5]);
%subplot(2,1,2);ylim([9.5 10.5]);

figure;
%plot(time_new,data-mean(data),'b'); hold on
plot(time_new,data,'b'); hold on
plot(time_new,filtrado, 'r','linewidth', 2);
xlim([300 300.2]);