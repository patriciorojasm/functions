%-------------------------
% testing filter values
%-------------------------
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

figure;
plot(time_new, out(2,:));
hold all;

%------------------
% band stop filter
%------------------
%band_stop_filter;
low_pass_filter;
clear out;
out=filtrado;
%clear filtrado;
plot(time_new,out(2,:));

xlim([1550 1555])
