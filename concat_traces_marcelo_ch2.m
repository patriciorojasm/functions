clear ans dt end_value i names out_time r_sample;
clear p q Fs size_out sweep sweep_dur x1 x2;


%names=fieldnames(x);
%out=[]; out_time=[];
%end_value = size(names,1)-1;
%end_value = size(names,1);
%i= 1;
%dt=2.46e-5;
%dt= .0001;

%Fs=(1/dt)/2;
%[p,q]=rat(1000/Fs,0.0001);
%out=x.(names{i});
%disp('length of sweep');
%disp( size(out) );
%out = resample(out,p,q);

%while i  < end_value   %size(names))

%for i=1:end_value
 %   r_sample = resample( x.(names{i+1}) ,p,q);
  %  out = vertcat(out, r_sample);
    %out = [out, r_sample];
    %disp(names{i+1})
    %i= i+1;
%end
%size_out=size(out,1);
%disp(size_out);
%time_new = linspace(0, (dt*5)*size_out, size_out );

%time_new =time_new';
%out_time = resample(time_new,p,q);

%t_total = size(out,1)*(1/1000);
%time = linspace(0, t_total, size(out,1));
%figure, plot(time_new, out(:,2))
%out = out';

%---------------
%filter  signal
% high_pass_filter.m
%---------------
ftiempo=out(:,2);   %  experimental data, channel 1
Fs=2000;       %sampling frequency
cutoff= 300;  % cutoff freq
tiempo=time_new;   

Wn=2*cutoff/Fs;
Wo=cutoff;

[B,A]=butter(4,Wn, 'high');  %Butterworth
%[B,A]=besself(4,Wn,'high');
filtrado=filter(B,A,ftiempo);

figure;
subplot(211); plot(ftiempo(1:10000),  'b'); hold all;
subplot(212); plot(filtrado(1:10000), 'b');

