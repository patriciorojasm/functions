function r_av_clusters(rb_1,rb_3)
    global r_mean sem 
    tiempo_bins=evalin('base','t_bins');
    %d_tiempo=24; % 120 seconds, 24 intervals of 5 seconds 
    d_tiempo=5; % 25 seconds, 5 intervals of 5 seconds 
    
    %--- first interval-----
    f_rb_1=max(find(tiempo_bins < rb_1));
    f_rb_2=f_rb_1+ d_tiempo;
    
    rate_c=evalin('base', 'rate_cluster');
    c_num=evalin('base', 'c_num');
    
    %--- second interval-----
    f_rb_3=min(find(tiempo_bins > rb_3));
    f_rb_4=f_rb_3+ d_tiempo;
    %figure;
    
    for c=0:c_num
        r_mean(1)=mean(rate_c{1,c+1}([f_rb_1:f_rb_2])); % rate average
        sem(1)=std(rate_c{1,1}([f_rb_1:f_rb_2]))/(sqrt(length([f_rb_1:f_rb_2])));

        r_mean(2)=mean(rate_c{1,c+1}([f_rb_3:f_rb_4])); % rate average
        sem(2)=std(rate_c{1,1}([f_rb_3:f_rb_4]))/(sqrt(length([f_rb_3:f_rb_4])));
        %------------
        n_elements(1)=length(rate_c{1,c+1}([f_rb_1:f_rb_2]));
        n_elements(2)=length(rate_c{1,c+1}([f_rb_3:f_rb_4]));
        %---calculate times for printing------

        %plot(tiempo_bins,rate_c{1,c+1}); hold all;
        %size(tiempo_bins)
        %size(rate_c{1,c+1})
        
        %-----printing------
        str1_1=strcat('time interval',{' '},mat2str([rb_1 rb_1+d_tiempo*5]));
        str1=strcat('mean',{' '},num2str(r_mean(1)),',',{' '},...
            '+-',num2str(sem(1)),{' '}, 'length',{' '},num2str(n_elements(1)));
        str2_1=strcat('time interval',{' '},mat2str([rb_3 rb_3+ d_tiempo*5]));
        str2=strcat('mean',{' '},num2str(r_mean(2)),',',{' '},...
             '+-',num2str(sem(2)),{' '},'length',{' '},num2str(n_elements(2)));
        disp(str1_1);
        disp(str1);
        disp('------------------------------------')
        disp(str2_1);
        disp(str2);
        disp('------------------------------------')
        %disp('------------------------------------')
        ratio=r_mean(2)/r_mean(1);
        str3=strcat('there is a change of ',{' '},num2str(ratio),{' '},'times in freq');
        disp(str3); 
        disp(r_mean)
        disp('------------------------------------')
        disp('------------------------------------')
    end

end
