% plotea rasters
i=1;
c=0;
f1 =figure;  hold all;
c_num =max(cluster_class(:,1));
%subplot(c_num,1,c); 
for c=0:c_num
    j=find(cluster_class(:,1)==c);
     
    subplot(c_num+2 ,1,c+1);
    t=cluster_class(:,2);
    t=0.01*.5*t';
    plot([t(j);t(j)],[ones(size(t(j)));zeros(size(t(j)))], 'k');
    i=i+1;
    %xlim([0 time_new(end)]);
end
%c=1; i=1;
%subplot(c_num,1,c_num);
%temp_1 = 25.726*temp -27.092;
%plot(time, temp);

subplot(c_num+2 ,1,c+2);
%load('temp.mat');
plot(time, temp_c);
grid on;

ex= exist('slope');
if ex ==1
    tit_1 = strcat('slope is ', {' '}, num2str(slope*60), {' '},'Celcius/min');
    subplot(c_num+2 ,1,c+2);
    title(tit_1);
end