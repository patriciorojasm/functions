fc = figure;
c=0;
subplot(c_num+3 ,1,1);
plot(time_new,data);
for c=0:c_num+1
    subplot(c_num+3 ,1,c+2);
    isi.(names{c+1}) = tim.(names{c+1});
    x_axis = tim.(names{c+1});
    if size(tim.(names{c+1})) < 2
       c=c+1;
    else
     x_axis(end) = [];
    plot(x_axis, diff( tim.(names{c+1})),'o', 'color',cc(c+1,:));
    end
end

subplot(c_num+3 ,1,c_num+3);
plot(time_new, tempx); hold all;
plot(time_new, tempx_r, 'red');
 xlim([0 time_new(end)]);
grid on;
ex= exist('slope');
if ex ==1
    tit_1 = strcat('slope is ', {' '}, num2str(slope*60), {' '},'Celcius/min');
    box off;
    title(tit_1);
end

for c=0:c_num+1
    subplot(c_num+3 ,1,c+1);
    xlim([0 time_end(end)]); box off;
end

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
