function i_av_clusters(rb_1,rb_3)
    global i_mean i_sem f_rb  % n_spikes
    tiempo_bins=evalin('base','t_bins');
    isi=evalin('base', 'isi');
    c_num=evalin('base', 'c_num');
    cluster_class=evalin('base', 'cluster_class');
    n_bins=evalin('base', 'n_bins');
    %d_tiempo=24; % 120 seconds, 24 intervals of 5 seconds 
    %d_tiempo=5; % 25 seconds, 5 intervals of 5 seconds 
    d_tiempo=10;
    %
    names={'zero' 'uno' 'dos' 'tres' 'cuatro' 'cinco' 'seis' 'siete' 'ocho'};
    
    %--- first interval-----
    f_rb_1=max(find(tiempo_bins < rb_1));
    f_rb_2=f_rb_1+ d_tiempo;
  
    %--- second interval-----
    f_rb_3=min(find(tiempo_bins > rb_3));
    f_rb_4=f_rb_3+ d_tiempo;
    %figure;
    f_rb=zeros(4,1);
    f_rb(1)=f_rb_1; f_rb(2)=f_rb_2; f_rb(3)=f_rb_3; f_rb(4)=f_rb_4;
    i_mean=zeros(2,c_num);
    i_sem=zeros(2,c_num);
    temp_n_spikes=zeros(2,c_num);
    %
    
    bin_length=5;     % duration of window to calculate rate (in seconds)
    %n_bins = round(time_new(end)/bin_length);   % number of windows
    rate_a=[];
    t_bins = 1:n_bins;    % time point at which rate was calculated
    t_bins = t_bins*bin_length;
    
    t=cluster_class(:,2);
    t=t';
    t=t*.001;    
    
    %--------
    figure('OuterPosition',[2000 1000 500 1000]);  
    for c=1:c_num
        j=find(cluster_class(:,1)==c);
        
        %isi_b=[];%=zeros(100,n_bins);
        
        for i= 1:n_bins
            t_i= (i-1)*bin_length +1;
            t_f= i*bin_length;
            isi_bin=find(t(j) < t_f & t(j) > t_i)   ;   % spikes indexes
            %t(isi_bin)   % tiempos de cada peak de interes en el bin
            isi_b(i)=mean(diff(t(isi_bin))) ;  % mean time in seconds
            %isi_bin=find( t > t_i); 
            rate_a(i) = size(isi_bin,2)  ;  
            %disp(i);
        end

    subplot(211);    
    rate_a = rate_a/(bin_length);
    isi_b(isnan(isi_b))=0;
    %plot((time_new(1)+t_bins), rate_a, 'o-','color','k');
    %--- this is the one ---
    plot(t_bins, rate_a, '-o');hold all
    %ylabel('rate (spikes/s)');
    %xlabel('time (s)');

    subplot(212);
    plot(t_bins,isi_b*1000,'-o');hold all
    %xlim([time_new(1) t_bins(end)]);
    ylabel('ISI (s)');
    xlabel('time (s)');

   % end
    
    %----------
     %for c=0:c_num
        i_mean(1,c)=mean(isi_b(f_rb_1:f_rb_2)); % rate average
        i_sem(1,c)=std(isi_b(f_rb_1:f_rb_2))/(sqrt(length([f_rb_1:f_rb_2])));

        i_mean(2,c)=mean(isi_b(f_rb_3:f_rb_4)); % rate average
        i_sem(2,c)=std(isi_b(f_rb_3:f_rb_4))/(sqrt(length([f_rb_3:f_rb_4])));
        %------------
       % n_elements(1)=length(rate_c{1,c+1}([f_rb_1:f_rb_2]));
       % n_elements(2)=length(rate_c{1,c+1}([f_rb_3:f_rb_4]));
        %---calculate times for printing------

        %plot(tiempo_bins,rate_c{1,c+1}); hold all;
        %size(tiempo_bins)
        %size(rate_c{1,c+1})
        
        %m1 =find(t_bins < 400, 1, 'last' );
        %m2 =find(t_bins < 500, 1, 'last' );
        %mean(isi_b(m1:m2))   
        
    end
    disp('------------------------------------')
    disp('------------------------------------')
    disp('rates average for first and second intervals')    
    %i_mean=i_mean*1000
    disp(i_mean'*1000)
    disp('------------------------------------')
    disp('sem for first and second intervals')
    %i_sem=i_sem*1000
    disp(i_sem'*1000)
    disp('------------------------------------')
    
end

    
   