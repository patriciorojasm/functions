% based on concat_traces_marcelo.m with no resampling

clear ans dt end_value i names out out_time r_sample size>out time_new;
clear p q Fs;
names=fieldnames(x);
out=[]; out_time=[];
end_value = size(names,1)-1;
%end_value = size(names,1);
i= 1;
%dt=2.46e-5;
dt= .0001;

%Fs=(1/dt)/2;
%[p,q]=rat(1000/Fs,0.0001);
out=x.(names{i});
%out = resample(out,p,q);


%while i  < end_value   %size(names))

for i=1:end_value
    r_sample =  x.(names{i+1});
    out = vertcat(out, r_sample);
end
size_out=size(out,1);
%disp(size_out);
time_new = linspace(0, dt*size_out, size_out );
%disp(time_new(49920));
time_new =time_new';
%out_time = resample(time_new,p,q);

%t_total = size(out,1)*(1/1000);
%time = linspace(0, t_total, size(out,1));
figure, plot(time_new, out(:,1))
out = out';


