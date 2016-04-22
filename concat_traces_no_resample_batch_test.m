%
names=fieldnames(x);
out=[]; %out_time=[];
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
    %out = [out, r_sample];
    %disp(names{i+1})
    %i= i+1;
end
size_out=size(out,1);
%disp(size_out);
time_new = linspace(0, dt*size_out, size_out );
time_new =time_new';
out = out';



