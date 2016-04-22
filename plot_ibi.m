figure;%('OuterPosition',[2850 200 300 1000]);
for c=1:c_num
    j=find(cluster_class(:,1)==c); 
    t=cluster_class(j,2);
    ti_1=min(find(t > t_1));  %point numbers corresponding to time
    ti_2=min(find(t > t_2));       %ti_1 +dt_isi;
    ti_3=min(find(t > t_3));
    ti_4=min(find(t > t_4));
        % spike times 
    isi_i_first = t(ti_1:ti_2); 
    isi_i_first = diff(isi_i_first);                % ISI 
    m_l_first=mean(isi_i_first);
    isi_i_first(end)=[];                            % ISI i+
    
    isi_i_1_first= t(ti_1:ti_2);     % spike times 
    isi_i_1_first = diff(isi_i_1_first);            % ISI
    isi_i_1_first(1)=[];                            % ISI i+1

    isi_i_second = t(ti_3:ti_4);  
    isi_i_second = diff(isi_i_second);
    m_l_second=mean(isi_i_second);
    isi_i_second(end)=[];

    isi_i_1_second=t(ti_3:ti_4); 
    isi_i_1_second = diff(isi_i_1_second);
    isi_i_1_second(1)=[];
    %--------------------------
    % calculate IBI
    %--------------------------
    
    
    IBI_first = find(isi_i_first > m_l_second & isi_i_1_first > m_l_second );
    ibi_f.(names{c}) = isi_i_first(IBI_first);      % IBI duration
    mean(ibi_f.(names{c}));
    size(ibi_f.(names{c}))
    
    IBI_second = find(isi_i_second > m_l_second & isi_i_1_second > m_l_second );
    ibi_s.(names{c}) = isi_i_second(IBI_second);   % IBI duration
    mean(ibi_s.(names{c}));
    
    subplot(c_num+1,1,c);
    semilogy(ibi_f.(names{c}),'-o','color',cc(c,:));hold on;
    semilogy(ibi_s.(names{c}),'-x','color',cc(c,:));hold on;
    
end
    ibi_all = find(isi_all > m_l_second);
    IBI_all = isi_all(ibi_all);
    subplot(c_num+1,1,4);
    semilogy(IBI_all,'-o','color','black');hold on;
    
    
    