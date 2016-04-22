% merge waves from original .mat files from wcp

names = who;
out=[];
%start = 1501  %(size(names,1))/2 +1;
i= (size(names,1))/2 +1;
end_value = size(names,1);
%i=1253;
Fs=40000;
[p,q]=rat(1000/Fs,0.0001);

out=eval(names{i});
out = resample(out,p,q);

while i  < end_value   %size(names))
    r_sample = resample( eval(names{i+1}) ,p,q);
    %out = vertcat(out, eval(names{i+1}));
    out = vertcat(out, r_sample);
    %disp(names{i})
    %disp('hola')
    i= i+1;
end

% ahora eje tiempo
t_total = size(out,1)*(1/1000);
time = linspace(0, t_total, size(out,1));

j=1; figure; 
for j=1:6
subplot(6,1,j); 
plot(time, out(:,1)); 
ylim([min(out(:,1))   max(out(:,1))]);
xlim([(j-1)*t_total/6  j*t_total/6]);
hold all;
end

out = out';
save('r_sample.mat', 'out', '-v7.3')
save('time.mat', 'time', '-v7.3')
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
