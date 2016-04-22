%
clear as dt end_value i names out out_time r_sample size>out time_new;
clear p q Fs size_out sweep sweep_dur x1 x2;
%tic
names=fieldnames(x);
out=[]; %out_time=[];
end_value = size(names,1)-1;
%end_value=14
i= 1;
dt= .0001;
%dt= 2.2e-5;
%dt= 5e-5;
out=x.(names{i});
%---------------
%  concatenate
%---------------
for i=1:end_value
    r_sample = x.(names{i+1});
    out = vertcat(out, r_sample);
    %out = [out, r_sample];
    %disp(names{i+1})
    %i= i+1;
end
size_out=size(out,1);
%disp(size_out);d d
time_new = linspace(0, dt*size_out, size_out );
time_new =time_new';
out = out';
figure;plot(time_new,out(1,:));
%figure;plot(time_new,out(2,:));

data=[];
% save matrices for waveclus
%data = out(2,:);
%save('ch2.mat', 'data', '-v7.3');
%data=[];
data = out(1,:);
save('ch1.mat', 'data', '-v7.3');

time_new=time_new(:,1);
save('time.mat', 'time_new', '-v7.3');
%
clear
%------------------------------------
%   Find peaks
%------------------------------------

