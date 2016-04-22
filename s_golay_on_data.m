v_pol=3;
f= 7;
f_data=sgolayfilt(data,v_pol,f);
%figure,
subplot(211); plot(time_new,data); %xlim([2771.5 2772]);
%ylim([60 -60]);
title('no filter');

subplot(212);plot(time_new,f_data); %xlim([2771.5 2772]);
%ylim([-.6 .6]);
st=strcat('pol ',{' '},num2str(v_pol),', f',{' '},num2str(f)); 
title(st);


for i=1:2 subplot(2,1,i); ylim([-100 60]); xlim([800 801]); end