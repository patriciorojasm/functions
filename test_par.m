tic
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

display('normal running time is');
toc
%-----------
tic
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
parfor i=1:end_value
    r_sample = resample( x.(names{i+1}) ,p,q);
    out = vertcat(out, r_sample);
    %out = [out, r_sample];
    %disp(names{i+1})
    %i= i+1;
end
size_out=size(out,1);
display('parallel running time is');
toc
