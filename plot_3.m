%plotea 2 canales de spikes y uno de temp
figure;
hold on;
i=1;
column=1;
for i=1:3;
    subplot(3,1,i);
    plot(data(i+1,:));
end
%data(:,4) = 0.1031*data(:,4) -27.92;