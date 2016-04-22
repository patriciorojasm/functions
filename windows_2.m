% makes histograms of spikes in each window
% c=1;
% c_num =max(cluster_class(:,1));
n_windows =3;
dt=60;
t_1 = 220;
t_11 = t_1+dt;
t_2= 280;
t_22= t_2 +dt;
t_3 =600;
t_33 = t_3+dt;

% hacer n_windows cell arrays

% cada array 

m_1 = tim;
% x_std = linspace(1.10,22.21,10);
x_std =50;

for c=1:c_num+1
    del_index_1= find( tim.(names{c})  < t_1 );
    del_index_2= find( tim.(names{c})  > t_11 );
    del_index = horzcat(del_index_1, del_index_2);
    %del_index= find( tim.(names{c}) < t_1  & tim.(names{c}) > t_11 );
    m_1.(names{c})(del_index)=[];
    [h_m1.(names{c})  x_m1.(names{c}) ] = hist( diff( m_1.(names{c}) ), x_std ) ;
    
end

m_2 = tim;
for c=1:c_num+1
    del_index_1= find( tim.(names{c})  < t_2 );
    del_index_2= find( tim.(names{c})  > t_22 );
    del_index = horzcat(del_index_1, del_index_2);
    m_2.(names{c})(del_index)=[];
        [h_m2.(names{c})  x_m2.(names{c})] = hist( diff( m_2.(names{c})) , x_std );
end

m_3 = tim;
for c=1:c_num+1
    del_index_1= find( tim.(names{c})  < t_3 );
    del_index_2= find( tim.(names{c})  > t_33 );
    del_index = horzcat(del_index_1, del_index_2);
    m_3.(names{c})(del_index)=[];
        [h_m3.(names{c})  x_m3.(names{c})] = hist( diff( m_3.(names{c})) , x_std);
end
ii=0; c=1;
%figure; %subplot(c_num,3,1)
f3=figure;

c=1;
for c=1:c_num+1
    subplot(c_num+1,1,c);
    width1 = 0.5; 
    hold on;
    bar(x_m2.(names{c}), h_m2.(names{c}),  'r'  );
    
    width2 = 0.5*width1;
    bar(x_m1.(names{c}), h_m1.(names{c}),  'b' );
    hold off;
end

tit_1 = strcat('Temp_1 =',{' '},num2str(t_1), {' | '},'Temp_2 =',{' '}, ...
    num2str(t_2), {' | '},  'Delta =', {' '}, num2str(dt));
subplot(c_num+1,1,1); title(tit_1);
legend('Temp 2','Temp 1' );
print('-dpsc2','-append','all_figures');

f4=figure;
for c=1:c_num+1
    subplot(c_num+1,1,c);
    width1 = 0.5; 
    hold on;
    bar(x_m2.(names{c}), h_m2.(names{c}),  'r'  );
    
    width2 = 0.5*width1;
    bar(x_m3.(names{c}), h_m3.(names{c}),  'g' );
    hold off;
end

tit_2 = strcat('Temp_2 =',{' '},num2str(t_2), {' | '},'Temp_3 =',{' '}, ...
    num2str(t_3), {' | '},  'Delta =', {' '}, num2str(dt));
subplot(c_num+1,1,1); title(tit_2);
legend('Temp 2','Temp 3' );
print('-dpsc2','-append','all_figures');
%---------------
c=1; 
f5=figure;
for c=1:c_num+1
    subplot(c_num+1,1,c);
    width1 = 0.5; 
    hold on;
    bar(x_m1.(names{c}), h_m1.(names{c}),  'b'  );
    
    width2 = 0.5*width1;
    bar(x_m3.(names{c}), h_m3.(names{c}),  'g' );
    hold off;
end

tit_2 = strcat('Temp_1 =',{' '},num2str(t_1), {' | '},'Temp_3 =',{' '}, ...
    num2str(t_3), {' | '},  'Delta =', {' '}, num2str(dt));
subplot(c_num+1,1,1); title(tit_2);
legend('Temp 1','Temp 3' );
print('-dpsc2','-append','all_figures');


saveas(f3, 'hist_1', 'fig');
saveas(f3, 'hist_1', 'png');

saveas(f4, 'hist_2', 'fig');
saveas(f4, 'hist_2', 'png');

saveas(f5, 'hist_3', 'fig');
saveas(f5, 'hist_3', 'png');

%--------------------------------
% statistics
%--------------------------------
%{
c=1;
for c=1:c_num+1
    name = ['t1' 't2' 't3'];
    for b=1:3
        (name{b}).n.(names{c})    = size (diff( m_1.(names{c})), 2);
        t1.m.(names{c})    = mean(diff( m_1.(names{c})), 2);
        t1.sem.(names{c}) = std ( diff( m_1.(names{c})) /sqrt(length( diff( m_1.(names{1})))));
        str0 = srtcat('Temp', {' '}, num2str(b));
        str1= strcat('Cluster',{' '},num2str(c), ...
            {' '}, 'N',{' '}, num2str(t1.n.(names{c})), ...
            {' '},'Mean', {' '},num2str(t1.m.(names{c})), ...  
            {' '}, 'sem', {' '}, num2str(t1.sem.(names{c})))
        disp(str0)
        disp(str1)
    end
end
%}

