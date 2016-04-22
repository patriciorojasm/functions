clear ans dt end_value i names out out_time r_sample size>out time_new;
clear p q Fs size_out sweep sweep_dur x1 x2;

names=fieldnames(x);
out=[]; out_time=[];
end_value = size(names,1)-1;
%end_value = size(names,1);
i= 1;
%dt=2.46e-5;
dt= .0001;

Fs=(1/dt)/2;
[p,q]=rat(1000/Fs,0.0001);
out=x.(names{i});
%disp('length of sweep');
%disp( size(out) );
out = resample(out,p,q);

%while i  < end_value   %size(names))

for i=1:end_value
    r_sample = resample( x.(names{i+1}) ,p,q);
    out = vertcat(out, r_sample);
    %out = [out, r_sample];
    %disp(names{i+1})
    %i= i+1;
end
size_out=size(out,1);
%disp(size_out);
time_new = linspace(0, (dt*5)*size_out, size_out );

time_new =time_new';
out_time = resample(time_new,p,q);

%t_total = size(out,1)*(1/1000);
%time = linspace(0, t_total, size(out,1));
figure, plot(time_new, out(:,1))
%out = out';

%---------------
%filter  signal
% high_pass_filter.m
%---------------
%high_pass_filter



% Commented by Pato
%clear Fs data dt end_value i j names p q r_sample t_total x; 

