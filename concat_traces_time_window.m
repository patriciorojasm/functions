%clear ans dt end_value i names  out_time out r_sample size_out time_new;
%clear p q Fs size_out sweep sweep_dur x1 x2;

%------
%
tic
names=fieldnames(x);
out=[]; out_time=[];
end_value = size(names,1)-1;
i= 1;
dt= .0001;
%dt= 5e-5;
out=x.(names{i});
%---------------
%  concatenate
%---------------
for i=1:end_value
    r_sample = x.(names{i+1});
    out = vertcat(out, r_sample);
end
%
toc
size_out=size(out,1);
time_new = linspace(0, dt*size_out, size_out );
time_new =time_new';
out = out';
%figure;plot(time_new,out(1,:));
%figure;plot(time_new,out(2,:));

save('out.mat', 'out', '-v7.3');
disp('done concatenating...');
%
%------------------
% High pass filter
%------------------ 
%high_pass_filter
%clear out;
%out=filtrado;
%clear filtrado;

%------------------
% Low pass filter
%------------------
%low_pass_filter
%
%--------------------------------------
% make matrices of the desired length
%--------------------------------------
x1=1000;  % start time of new wave
x1=find(floor(time_new)==x1);
x1=x1(1);
x2=3500; % end time of new wave
x2=find(floor(time_new)==x2);
x2=x2(1);
di=x2-x1;
time_window=[x1 x2];
save('time_window.mat', 'time_window', '-v7.3');

data=[];
% save matrices for waveclus
data = out(2,[x1:x2]);
%{
%------------------------------------------
% savitzky-golay filter filter correction
%------------------------------------------
v_pol=3;
f=51;
f_data=sgolayfilt(data,v_pol,f); % filter ch2 to get trend
data=data - f_data;             % baseline correction ch2
%filter
%------
v_pol=3;
f=7;
data=sgolayfilt(data,v_pol,f);  % FILTER high frequencies before spike detection
%}
save('ch2.mat', 'data', '-v7.3');
%---
data=[];
data = out(1,[x1:x2]);
%{
v_pol=3;
f=51;
f_data=sgolayfilt(data,v_pol,f);    % filter ch1 to get trend
data=data - f_data;                 % baseline correction
%filter
%------
v_pol=3;
f=7;
data=sgolayfilt(data,v_pol,f);
%}
save('ch1.mat', 'data', '-v7.3');

time_new=time_new([x1:x2],1);

%time_new(1)
%time_new(end)
save('time.mat', 'time_new', '-v7.3');
%save('concat.mat', 'out','time_new', '-v7.3');
disp('done saving...');

%-------------------
%

%------------------------------------
%   Find peaks
%------------------------------------
f_Get_spikes_1('ch1.mat', 10000, 1)    % This files has default filtering values
disp('done finding peaks...');
load('ch1.mat_spikes.mat')
%------------------------------------
%   Clustering
%------------------------------------
Do_clustering
disp('done clustering...');
load('times_ch1.mat_spikes.mat');
%
load('time.mat');
load('ch1.mat');
find_clusters
load('time_window.mat');
rasters_3
% save 
plot_clusters
%
rate_all
spike_properties_epi_1
%toc
%-------------
%-------------
%f_ss ={'f_1'; 'f_2'; 'f_3'; 'f_4'; 'f_5'; 'f_6'; 'f_7'; 'f_8'}; 
%{
for i=1:8
    nombre=f_ss(i);
    %saveas(f_ss(i), nombre, 'fig');
    saveas(figure(i),  strcat('figure_ch1_3_',num2str(i)), 'fig')
    saveas(figure(i),  strcat('figure_ch1_3_',num2str(i)), 'png');
    
end

save('analyzed_150903.3');
%}