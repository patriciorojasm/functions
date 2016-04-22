clear

files=dir;
files(1:2) =[];
dirFlags= [files.isdir];
subFolders=files(dirFlags);

disp('Analyzing......');
for k=1:length(subFolders)  
	cd (subFolders(k).name); 
    
    file_load=dir('ana*');
    f_load= file_load(end).name;
    load(f_load);
	%
    isi_all= diff(cluster_class(:,2));
    x_axis = cluster_class(:,2);
    x_axis(end) = [];
    %----plot ISI---------
    f_isi_lin = figure;
    plot(x_axis, isi_all,'o', 'color','black');
    xlabel('time (ms)'); ylabel('ISI (ms)');
    %---log plot ISI------
    f_isi_log=figure;
    semilogy(x_axis, isi_all,'o', 'color','black');
    xlabel('time (ms)'); ylabel('ISI (ms)');

    saveas(f_isi_lin, 'f_isi_lin', 'fig');
    saveas(f_isi_lin, 'f_isi_lin', 'jpg');
    saveas(f_isi_log, 'f_isi_log', 'fig');
    saveas(f_isi_log, 'f_isi_log', 'jpg');
    close all;
    
	clear  c_num cluster_class data i i1 index inspk ipermut isi_bin j rate rate_1
    clear rate_cluster s si spikes t t_bins tim tim_new tit c par
	n=length(subFolders);
	str = strcat('analyzed ',{' '},num2str(k),{' '},'out of',{' '},num2str(n));
	disp(str);
    clearvars -except dirFlags subFolders k
	cd ..
end
disp('END of fun');




