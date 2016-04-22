%horz cat trazos
list=dir('2013*.mat');
num_files = size(list,1);
ch2_t = [];
ch3_t = [];
ch4_t = [];
ch5_t = [];
time_t = [];
i=1; j=1;

for i=1:num_files
    load(list(i).name);
    ch2_t = horzcat(ch2_t, ch2);
    ch3_t = horzcat(ch3_t, ch3);
    ch4_t = horzcat(ch4_t, ch4);
    ch5_t = horzcat(ch5_t, ch5);
    time_t = horzcat(time_t, time);
    
clear ch2 ch3 ch4 ch5 time;
end
num_point= size(time_t,2);
ch5_t(num_point) = ch5_t(num_point-1);

n_plots=5;
for j=1:n_plots
figure; subplot(4,1,1);
%x =[0 1/3; 1/3 2/3; 2/3 1];
x1= round(num_point*(j-1)/n_plots) +1;
x2= round(num_point*j/n_plots); 

%plot(time_t(1:num_point/3), ch2_t(1:num_point/3));
plot(time_t(x1:x2), ch2_t(x1:x2));
%ylim([700 900]);
%axis([1 num_point/3 700 900]);
datetick('x','mmdddHHMMPM');

subplot(4,1,2);
plot(time_t(x1:x2), ch3_t(x1:x2));
datetick('x','mmdddHHMMPM');
%ylim([700 900]);

subplot(4,1,3);
plot(time_t(x1:x2), ch4_t(x1:x2));
datetick('x','mmdddHHMMPM');
%ylim([700 900]);

subplot(4,1,4);
plot(time_t(x1:x2), ch5_t(x1:x2));
datetick('x','mmdddHHMMPM');
%ylim([700 900]);
end