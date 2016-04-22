clear ans dt end_value i names  out_time out r_sample size_out time_new;
clear p q Fs size_out sweep sweep_dur x1 x2;
tic
names=fieldnames(x);
out=[]; out_time=[];
end_value = size(names,1)-1;
i= 1;
dt= .0001;
out=x.(names{i});
%---------------
%  concatenate
%---------------
for i=1:end_value
    r_sample = x.(names{i+1});
    out = vertcat(out, r_sample);
end
size_out=size(out,1);
time_new = linspace(0, dt*size_out, size_out );
time_new =time_new';
out = out';

%--------------------------------------
% make matrices of the desired length
%--------------------------------------
x1=3000;  % start time of new wave
x1=find(floor(time_new)==x1);
x1=x1(1);
x2=4000; % end time of new wave
x2=find(floor(time_new)==x2);
x2=x2(1);
di=x2-x1;
time_window=[x1 x2];
save('time_window.mat', 'time_window', '-v7.3');
%
data2=[];
data2 = out(2,[x1:x2]);

data1=[];
data1 = out(1,[x1:x2]);

time_new=time_new([x1:x2],1);