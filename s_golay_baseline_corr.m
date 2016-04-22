%v_pol=3;
%f= 5;
%f_data=sgolayfilt(data1,v_pol,f);
figure;
subplot(311); plot(time_new,data); %xlim([2771.5 2772]);
%ylim([60 -60]);
title('no filter');
v_pol=3;
f= 61;
f_data2=sgolayfilt(data,v_pol,f);
subplot(312); plot(time_new, f_data2);
title('filtered a lot');

subplot(313);plot(time_new,(f_data2-data)); %xlim([2771.5 2772]);
%ylim([-.6 .6]);
%st=strcat('pol ',{' '},num2str(v_pol),', f',{' '},num2str(f)); 
title('baseline corrected');


for i=1:3 subplot(3,1,i); xlim([170 170.2]);  %ylim([-5 5]);xlim([3600 3601]); 
end % 

figure;
plot(time_new,data,'b'); hold on
plot(time_new,f_data2, 'r','linewidth', 2);
xlim([170 170.2]);
 
%xlim([3600 3600.4]);