clear

files=dir;
files(1:2) =[];
dirFlags= [files.isdir];
subFolders=files(dirFlags);
%for k=1:length(subFolders)
%    fprintf('#%d=%s\n', k,subFolders(k).name);
%end
disp('Analyzing......');
for k=1:length(subFolders)  
	cd (subFolders(k).name); 
        f_name=dir('*.mat');
        
	x=load(char(f_name.name),'Y*');

	names=fieldnames(x);
	out=[]; %out_time=[];
	end_value = size(names,1)-1;
	%k= 1;
	%dt= .0001;
    dt= .00005;

	out=x.(names{k});
	%---------------
	%  concatenate
	%---------------
	for i=1:end_value
	    r_sample = x.(names{i+1});
	    out = vertcat(out, r_sample);
	end
	size_out=size(out,1);
	%disp(size_out);
	time_new = linspace(0, dt*size_out, size_out );
	time_new =time_new';
	out = out';
	
	data=[];
	% save matrices for waveclus
	data = out(2,:);
	save('ch2.mat', 'data', '-v7.3');
	data=[];
	data = out(1,:);
	save('ch1.mat', 'data', '-v7.3');

	time_new=time_new(:,1);
	save('time.mat', 'time_new', '-v7.3');

	clear  x names out end_value size_out r_sample time_new f_name dt data n str 
	n=length(subFolders);
	str = strcat('analyzed ',{' '},num2str(k),{' '},'out of',{' '},num2str(n));
	disp(str);
	cd ..
end




