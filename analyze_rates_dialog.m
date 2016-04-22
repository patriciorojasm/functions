clear ans f1 f2 f3 ah1 ah2 ah3;
clear i j l m n names p_rate_max rate_m rate_max t_rate_max;
i=1; % recording number
j=1; % each temperature
names =who('spike*');
 %names_t =who('temperature*');
 f1=figure('OuterPosition',[800 600 400 400]); hold all;
 ah1=gca;
 f2=figure('OuterPosition',[850 100 400 400]); hold all;
 %h=subplot(511);
 ah2=gca;
 f3=figure('OuterPosition',[800 60 400 400]); hold all;
 ah3=gca;
 count=0; count1=0;
 for i=1:size(names,1)          
     n=eval(names{i});  % name of matrix spike_rate
     %disp(names(i));
     rate_m{i}=eval(names{i})  ;
     plot(ah1, rate_m{i}(:,1), rate_m{i}(:,[2:end]), '-o'); 
     count=size( rate_m{i}(:,[2:end]),2)+count;
     hold on;
     [m l] =max(rate_m{i}(:,[2:end]));  % max rate at each temp     
     rate_max{i} = m;     % array with max rates at each temp
     p_rate_max{i} = l;   % array with max indices of m
     t_rate_max{i}=  rate_m{i}( p_rate_max{i}(1,[1:end]), 1) ;
     
     for j=2:size(t_rate_max{i},1)    
     
     if     t_rate_max{i}(j,1)   >0 &&  t_rate_max{i}(j,1)  <7 %temp entre 0 y 5 grad
         %subplot(511);
         figure(f2); subplot(411);
         plot( rate_m{i}(:,1), rate_m{i}(:,j), 'b-o'); 
         plot(ah3, rate_m{i}(:,1), rate_m{i}(:,j), 'b-o'); 
     elseif t_rate_max{i}(j,1)   >7.0001 &&  t_rate_max{i}(j,1)  <14 %temp entre 0 y 5 grad
         figure(f2);subplot(412);
         plot( rate_m{i}(:,1), rate_m{i}(:,j), 'g-o'); 
         plot(ah3, rate_m{i}(:,1), rate_m{i}(:,j), 'g-o'); 
     elseif t_rate_max{i}(j,1)   >14.0001 &&  t_rate_max{i}(j,1)  <20 %temp entre 0 y 5 grad         
         figure(f2);subplot(413);
         plot( rate_m{i}(:,1), rate_m{i}(:,j), 'r-o'); 
         plot(ah3, rate_m{i}(:,1), rate_m{i}(:,j), 'r-o'); 
     %elseif t_rate_max{i}(j,1)   >15.0001 &&  t_rate_max{i}(j,1)  <20 %temp entre 0 y 5 grad     
         %figure(f2);subplot(414);
         %plot( rate_m{i}(:,1), rate_m{i}(:,j), 'c-o'); 
     else%if t_rate_max{i}(j,1)   >20.0001 &&  t_rate_max{i}(j,1)  <30
         figure(f2);subplot(414);
         plot( rate_m{i}(:,1), rate_m{i}(:,j), 'm-o');
         plot(ah3, rate_m{i}(:,1), rate_m{i}(:,j), 'm-o');
     end
     count1=count1+ j-2;
     hold on
     end
     %count2=count1 +count2;    
 end
 disp(count)
 disp(count1)
 
 