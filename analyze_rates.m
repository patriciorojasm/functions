clear ans f1 f2 f3 ah1 ah2 ah3;
clear i j l m n names p_rate_max rate_m rate_max t_rate_max;
clear aux aux2 count maximos;
i=1;
j=1;
names =who('spike*');
count=0;
 %names_t =who('temperature*');
 figure;
 for i=1:size(names,1)
     n=eval(names{i});  % name of matrix spike_rate
     %disp(names(i));
     rate_m{i}=eval(names{i});   
     plot(rate_m{i}(:,1), rate_m{i}(:,[2:end]), '-o');
     count=size( rate_m{i}(:,[2:end]),2)+count;
     hold on;
     %end   
 end
 %disp(count)
 disp(strcat('total units are  ', num2str(count)))