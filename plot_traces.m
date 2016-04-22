
c=1;
n_plots=5;
traces=64;
p_trace=485888;
dt=5e-5;

figure;  hold on;
length=dt*p_trace*traces;
for c=1:n_plots
    subplot(n_plots,1,c);
    
    x1= (c-1)*length/n_plots;
    x2= c*length/n_plots;
    %plot(time_06, data_06(2,:));  %ch1) %, x1,x2); 
    plot(time_new,data);
    %title('filtered 130813_002');
    %plot(time, d_f);
    xlim([x1 x2]);
    ylim([-4 4]);
end