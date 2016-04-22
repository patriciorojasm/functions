% makes histograms of spikes in each window
% c=1;
% c_num =max(cluster_class(:,1));
n_windows =3;
dt=100;
t_1 = 100;
t_11 = t_1+dt;
t_2= 300;
t_22= t_2 +dt;
t_3 =600;
t_33 = t_3+dt;

% hacer n_windows cell arrays

% cada array 
figure;
m_1 = tim;
% x_std = linspace(1.10,22.21,10);
x_std =20;

for c=1:c_num+1
    del_index_1= find( tim.(names{c})  < t_1 );
    del_index_2= find( tim.(names{c})  > t_11 );
    del_index = horzcat(del_index_1, del_index_2);
    %del_index= find( tim.(names{c}) < t_1  & tim.(names{c}) > t_11 );
    m_1.(names{c})(del_index)=[];
   % if (size(m_1.(names{c})) <1)
   %     h_m1.(names{c}) =[]; x_m1.(names{c}) =[];
   % else
        [h_m1.(names{c})  x_m1.(names{c}) ] = hist( diff( m_1.(names{c}) )) ;
   % end
end

m_2 = tim;
for c=1:c_num+1
    del_index_1= find( tim.(names{c})  < t_2 );
    del_index_2= find( tim.(names{c})  > t_22 );
    del_index = horzcat(del_index_1, del_index_2);
    %del_index= find( tim.(names{c}) < t_1 & tim.(names{c}) > t_2 );
    %del_index= find( tim.(names{c}) < t_2  & tim.(names{c}) > t_22 );
    m_2.(names{c})(del_index)=[];
    %if size(m_2.(names{c})) <1
     %   h_m2.(names{c}) =[]; x_m2.(names{c}) =[];
    %else
        [h_m2.(names{c})  x_m2.(names{c})] = hist( diff( m_2.(names{c}) ) );
    %end
end

m_3 = tim;
for c=1:c_num+1
    del_index_1= find( tim.(names{c})  < t_3 );
    del_index_2= find( tim.(names{c})  > t_33 );
    del_index = horzcat(del_index_1, del_index_2);
    %del_index= find( tim.(names{c}) < t_2 );
    %del_index= find( tim.(names{c}) < t_3  & tim.(names{c}) > t_33 );
    m_3.(names{c})(del_index)=[];
    %if size(m_1.(names{c})) <1
    %    h_m3.(names{c}) =[]; x_m3.(names{c}) =[];
    %else
        [h_m3.(names{c})  x_m3.(names{c})] = hist( diff( m_3.(names{c}) ));
    %end
end
ii=0; c=1;
%figure; %subplot(c_num,3,1)
c=1;
for c=1:c_num+1
    subplot(c_num+1,2,c+ii);
    width1 = 0.5; 
    hold on;
    bar(x_m2.(names{c}), h_m2.(names{c}), width1, 'r'  );
    
    width2 = 0.5*width1;
    bar(x_m1.(names{c}), h_m1.(names{c}), width2, 'b' );
    hold off;
    
   % hold all;
    subplot(c_num+1,2,c+ii+1);
    bar(x_m2.(names{c}), h_m2.(names{c}), 'g' );
    bar(x_m3.(names{c}), h_m3.(names{c}),  'r' );
    ii= ii+1;
   % hold off;
end