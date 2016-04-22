%close;
c=0;
c_num =max(cluster_class(:,1));
f7 = figure;
ccx=1;
for c=0:c_num+1
    for ccx=1:size(zz,2)+1
        % ---------------
        if ccx ==1
            t_i=0;
            t_f= time(zz(ccx));
        %elseif ccx == size(zz,2)
         %   t_i= time(zz(ccx));
          %  t_f= time(end);
        elseif ccx == size(zz,2)+1
            t_i= time(zz(ccx-1));
            t_f= time(end);
        else
            t_i= time(zz(ccx-1));
            t_f= time(zz(ccx));
            end
        %t_f= time(zz(ccx));
        % ---------------
        %if ccx== size(zz,2)+1
         %   t_i= time(zz(ccx));
          %  t_f= time(end);
        %else
            %t_i= time(zz(ccx-1));
            %t_f= time(zz(ccx));
        %end
        % ---------------
        %disp(ccx)
        j=find(cluster_class(:,1)==c);   % index in cluster_class matrix
        t_spikes = cluster_class(j,2)*.01;
        %----deletes spikes above t_f-----
        del_index = find(t_spikes > t_f );
        spikes_segment = t_spikes;          % this is THE matrix
        spikes_segment(del_index(:,1))=[];
        %----deletes spikes below t_i-----
        del_index = find(t_spikes < t_i );        
        spikes_segment(del_index(:,1))=[];      
        n_spikes_segment=size(spikes_segment,1);
        s_rate(ccx) = n_spikes_segment / (t_f -t_i) ;
    end
    %disp('-----')
    spike_rate{c+1}= s_rate;  % populates matrix spike_rate
    spike_rate_m(:,c+2)= s_rate;
    temp_exp = floor(mean(tempx_r(1:50))); 
    temp_exp = temp_exp:1:(temp_exp + (size(zz,2)));
    temperature_exp{c+1}= temp_exp;  % populates matrix temperature_exp
    spike_rate_m(:,1)= temp_exp;
    
    plot(temp_exp, s_rate, 'o-'); hold all;
    %plot(s_rate, 'o-'); hold all;
    %str= strcat('c vale ', num2str(c));
    %disp(str);
end
hold off;
ylabel('Spike Rate (spikes/s)');
xlabel('Temperature (C)');

set(gca,'XTick', temp_exp)
box off;
