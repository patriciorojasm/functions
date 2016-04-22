%----------------------------------------
% plot log ISI vs time for each cluster
%----------------------------------------
fc = figure;
c=0;

for c=0:c_num
    subplot(c_num+1,1,c+1);
    isi.(names{c+1}) = tim.(names{c+1});
    x_axis = tim.(names{c+1});
    %if size(tim.(names{c+1})) < 2
    %   c=c+1;
    %else
    x_axis(end) = [];
    semilogy(x_axis, diff( tim.(names{c+1})),'o', 'color',cc(c+1,:));
    %end
end


%--------------------------------------------------------
% plot log ISI vs time with colors for each cluster
%-------------------------------------------------------

figure;
for c=0:c_num
    isi.(names{c+1}) = tim.(names{c+1});
    x_axis = tim.(names{c+1});
    x_axis(end) = [];
    semilogy(x_axis, diff( tim.(names{c+1})),'o', 'color',cc(c+1,:));
    hold on;
    xlabel('time (ms)'); ylabel('ISI (ms)');
end

%for c=0:c_num+1
%    subplot(c_num+1 ,1,c+1);
%    xlim([0 time_end(end)]); box off;
%end

%saveas(fc, 'trace_raster', 'fig');
%saveas(fc, 'trace_raster', 'png');

%fc_c=copyobj(gcf,0);   % copy Fc figure
%subplot(c_num+2 ,1,c_num+2);
%hold all;

%{
figure,
c=0;
for c=0:c_num+1
  
    isi.(names{c+1}) = tim.(names{c+1});
    x_axis = tim.(names{c+1});
    if size(tim.(names{c+1})) < 2
       c=c+1;
    else
     x_axis(end) = [];
    semilogy(x_axis, diff( tim.(names{c+1})),'o');
    hold all;
    box off;
    end
end
%}
