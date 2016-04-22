%% DC offset removal. 21.10.2011 Maria L. Stavrinou
%a)solution 1
%% 1. load the EEG.data and save it as another set
%data= EEG.data; % nchan x timeduration_all
%% 2 Low pass filter
h=fdesign.lowpass('Fp,Fst,Ap,Ast',0.001,0.05,1,6,250);
d=design(h,'butter');
fvtool(d)
% check on a single channel
%comment by Pato, the array already has that name
%ch1=double(data(1,:));
y=filter(d, out);%y=filtfilt(d.Numerator,1,ch1);
figure; plot(out); hold on; plot(y, 'r')
hold on; plot((out-y), 'g')
