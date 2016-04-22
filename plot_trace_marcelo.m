sweep_i=100;
sweep_f=101;
%n_samples= 49920;
%dt= .0001;
trace= 9.98;
seg_1=trace*sweep_i
seg_2=trace*sweep_f

%trace= time(end)*trazos totales del registro

out = out';
figure, 
plot(time, out(:,1));
xlim([seg_1 seg_2]);
out = out';