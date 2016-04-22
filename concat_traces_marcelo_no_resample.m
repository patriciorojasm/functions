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
%figure;plot(time_new,out(1,:));
%figure;plot(time_new,out(2,:));

%------------------------------
% sgolsy linebase correction
%------------------------------
%{
data=[];
data = out(2,:);
%
%------------------------------------------
% savitzky-golay filter filter correction
%------------------------------------------
v_pol=3;
f=51;
f_data=sgolayfilt(data,v_pol,f); % filter ch2 to get trend
data=data - f_data;             % baseline correction ch2
%filter
v_pol=3;
f=7;
data=sgolayfilt(data,v_pol,f);  % FILTER high frequencies before spike detection
%
out(2,:)=data;
%---
data=[];
data = out(2,:);
%
v_pol=3;
f=51;
f_data=sgolayfilt(data,v_pol,f);    % filter ch1 to get trend
data=data - f_data;                 % baseline correction
%filter
v_pol=3;
f=7;
data=sgolayfilt(data,v_pol,f);
data = out(1,:);
%time_new=time_new([x1:x2],1);
%}

%------------------
% High pass filter
%------------------pw
%high_pass_filter
%clear out;
%out=filtrado;
%clear filtrado;
%--------------------

%find_rates_v2
%
data=[];
% save matrices for waveclus
data = out(2,:);
save('ch2.mat', 'data', '-v7.3');
data=[];
data = out(1,:);
save('ch1.mat', 'data', '-v7.3');

time_new=time_new(:,1);
save('time.mat', 'time_new', '-v7.3');
%
clear
%------------------------------------
%   Find peaks
%------------------------------------
f_Get_spikes_1('ch1.mat', 10000, 1)    % This files has default filtering values
load('ch1.mat_spikes.mat')
%------------------------------------
%   Clustering
%------------------------------------
Do_clustering
load('times_ch1.mat_spikes.mat')
load('time.mat')
load('ch1.mat')
find_clusters
rasters_31
plot_clusters
%toc
rate_all
%find_rates
%---------
spike_properties_epi_1
%{
f_ss ={'f_1'; 'f_2'; 'f_3'; 'f_4'; 'f_5'; 'f_6'; 'f_7'; 'f_8'}; 

for i=1:8
    nombre=f_ss(i);
    %saveas(f_ss(i), nombre, 'fig');
    saveas(figure(i),  strcat('figure_ch1_',num2str(i)), 'fig')
    saveas(figure(i),  strcat('figure_ch1_',num2str(i)), 'png');
    
end

%clear; 
close all;
%}
