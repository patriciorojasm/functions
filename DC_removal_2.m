%% DC offset removal. 21.10.2011 Maria L. Stavrinou
%b)solution 2 %%
%% load eeg data
%data= EEG.data; % nchan x timeduration_all
%% 2 Low pass filter
h=fdesign.lowpass('Fp,Fst,Ap,Ast',0.001,0.05,1,8,250);
d=design(h,'equiripple');
fvtool(d)
% check on a single channel
%ch1=double(data(1,:));
ch2=out;  % added by Pato
y2=filtfilt(d.Numerator,1,ch2);
figure; plot(ch2); hold on; plot(y2, 'r')
hold on; plot((ch2-y2), 'g')
 