%f_name=who;
%f_name= str2num('f_name');
%figure;
i=1;
%list = who('ch*');
%subplot(4,1,i);


%for i=1:4
 %   subplot(4,1,i);
%    data =list(i,1).name;
    
  %  plot(list(i));
%   % datetick('x','HHMMPM');
% end

figure;
subplot(4,1,1);
plot(time_t, ch2_t); datetick('x','HHMMPM');
subplot(4,1,2);
plot(time_t, ch3_t); datetick('x','HHMMPM');
subplot(4,1,3);
plot(time_t, ch4_t); datetick('x','HHMMPM');
subplot(4,1,4);
plot(time_t, ch5_t); datetick('x','HHMMPM');

