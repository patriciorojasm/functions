 
x1= cursor_info(1).DataIndex;  % start point
x2= x1+6e5;                 % end point
spikes_dos = spike_times(ch1(x1:x2), .55);
figure, plot(time(x1:x2), ch1(x1:x2));
size(spikes_dos,2)