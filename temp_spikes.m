i=1;    % number of clusters
ii=1;    % number of elements per cluster
figure;
for i=1:5
    for ii=1:size(isi.(names{i}),2)
        delta=abs(time- isi.(names{i})(ii) );
        [cc index_time] = min(delta);
        temps.(names{i})(ii) =time(index_time);
        %jj=find(time==isi.(names{i})(ii) );
        
    end
    disp(i)
    subplot(c_num+1,1,i); 
    hold all;
    plot(temps.(names{i}), isi.(names{i}), '-o');
    
end

