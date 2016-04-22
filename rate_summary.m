%------------------------------------------------------
% creates cell array with rates before and after Musc
%------------------------------------------------------

% Define channel number
ch=1;
%ch=2;


x_base=1300;
x_peak=1390;
d_t=2;
p_x_base=find(ceil(t_bins)==x_base);
p_x_base_f=find(ceil(t_bins)==x_base+d_t);
p_x_peak=find(ceil(t_bins)==x_peak);
p_x_peak_f=find(ceil(t_bins)==x_peak+d_t);

  str_mean=strcat('Between ',{' '},num2str(x_base),{' '},'and',...
        {' '},num2str(x_peak),{' '},'s  rates were calculated during',...
         {' '},num2str(d_t),{' '},'seconds');
    disp(str_mean);

 switch ch
     case 1
        for i=1:c_num+1
            mean_base_ch1(i)=mean(rate_cluster{i}(p_x_base:p_x_base_f ));
            mean_peak_ch1(i)=mean(rate_cluster{i}(p_x_peak:p_x_peak_f ));
            str_mean=strcat('Cluster',{' '}, num2str(i),' increased  ',...
                {' '},num2str(mean_peak_ch1(i)*100/mean_base_ch1(i)), ' % in firing rate');
            disp(str_mean);
        end
    
     case 2
        for i=1:c_num+1
            mean_base_ch2(i)=mean(rate_cluster{i}(p_x_base:p_x_base_f ));
            mean_peak_ch2(i)=mean(rate_cluster{i}(p_x_peak:p_x_peak_f ));
            str_mean=strcat('Cluster',{' '}, num2str(i),' increased  ',...
                {' '},num2str(mean_peak_ch2(i)*100/mean_base_ch2(i)), ' % in firing rate');
            disp(str_mean);
        end
 end