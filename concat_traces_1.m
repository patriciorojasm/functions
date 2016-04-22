%
names=fieldnames(x);
out=[];
end_value = size(names,1)-1;
i= 1;

Fs=40000;
[p,q]=rat(1000/Fs,0.0001);
out=x.(names{i});
out = resample(out,p,q);

%while i  < end_value   %size(names))
dt=10/Fs;
for i=1:end_value
    r_sample = resample( x.(names{i+1}) ,p,q);
    out = vertcat(out, r_sample);
    %out = [out, r_sample];
    %disp(names{i+1})
    %i= i+1;
end
size_out=size(out,1);
%disp(size_out);

time_new = linspace(0, dt*size_out, size_out );
time_new =time_new';
out = out';
%figure;plot(out(1,:));
%figure;plot(out(2,:));

%t_total = size(out,1)*(1/1000);
%time = linspace(0, t_total, size(out,1));
%figure, plot(time, out(:,1))

%
j=1; figure; 
for j=1:6
subplot(6,1,j); 
plot(time_new, out(:,1)); 
ylim([min(out(:,1))   max(out(:,1))]);
xlim([(j-1)*t_total/6  j*t_total/6]);
hold all;
end
%
%out = out';
%
save('r_sample.mat', 'out', '-v7.3')
save('time.mat', 'time_new', '-v7.3')
clear
load('r_sample.mat');
data=[];
data = out(2,:);
save('ch2.mat', 'data', '-v7.3');
data = out(1,:);
save('ch1.mat', 'data', '-v7.3');
%clear data;
temp= out(3,:);
%clear temp
save('temp.mat', 'temp', '-v7.3');
%{
f_Get_spikes_1('ch1.mat', 40000, 1)    % This files has default filtering values
disp('done finding peaks...');
load('ch1.mat_spikes.mat')
%   Clustering
Do_clustering
disp('done clustering...');
load('times_ch1.mat_spikes.mat')
%
load('time.mat')
load('ch1.mat')
find_clusters
rasters_31
plot_clusters
spike_properties_epi_1
%}
% load('/home/pato/DISK/PATO/DATA/NACELLA/Analized_2/temp_calibration_final.mat', 'p')
%trim_temp_1

