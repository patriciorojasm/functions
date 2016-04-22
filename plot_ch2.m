
j=1; figure; 
for j=1:6
subplot(6,1,j); 
plot( out(2,:)); 
ylim([min(out(:,1))   max(out(:,1))]);
xlim([(j-1)*t_total/6  j*t_total/6]);
hold all;
end