clear t_time test1 p s mu f_y
t_time=time_new(1:2000);
test1=data(1:2000);
test1=test1';
figure; 
%subplot(6,1,1);
plot(test1);

for pot=4:8
    %pot=6;
    t_time=time_new(1:2000);
    [p,s,mu]=polyfit(t_time,test1,pot);
    f_y=polyval(p,t_time,[],mu);
    dt_test1=test1-f_y;
    %subplot(6,1,pot);
   %plot(test1); hold all;
    plot(dt_test1); hold all;
end