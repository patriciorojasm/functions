%*************************************************************************%
%******************      Author: Vlachos Marios         ******************%
%******************   Designed by: Vlachos Marios       ******************%
%****************** Electrical and Computer Engineer    ******************%
%******************          PhD Student                ******************%
%******************   University of Patras, Greece      ******************%
%******************          8 November 2005            ******************%
%*************** email: mvlachos@george.wcl2.ee.upatras.gr ***************%
%*************************************************************************%

clear all;
close all;

% Load the initial signal m
%**************************************************************************
load ('ch1.mat', 'data');
%**************************************************************************

% Perfoms 1-D FFT to m
%**************************************************************************
m=data;
a=fft(m);
%**************************************************************************

% View the absolute of a
%**************************************************************************
aa=abs(a);
figure, plot(aa);
title('FFt');
%**************************************************************************

% Cut the above zone of frequencies
%**************************************************************************
a(10:91)=0;
%**************************************************************************

% Performs 1-D inverse FFT and show its real part and the initial signal
%**************************************************************************
ia=ifft(a);
figure, plot(real(ia),'r');
hold on;
plot(m);
title('initial signal versus (real inverse FFT) smooth signal');
%**************************************************************************

% Cut the dc component from the same signal m
%**************************************************************************
a=fft(m);
a(1)=0;
ia=ifft(a);
figure, plot(real(ia),'g');
hold on;
plot(m,'b');
title('initial signal versus signal without dc component');
%**************************************************************************

% Combine the two process to one and view the final smooth signal without 
% dc component
%**************************************************************************
a=fft(m);
a(1)=0;
a(10:91)=0;
ia=ifft(a);
figure, plot(real(ia),'m');
hold on;
plot(m,'b');
title('initial signal versus smooth signal without dc component');
%**************************************************************************
