clear ans f1 f2 f3 ah1 ah2 ah3 sample symbolcell tMax;
clear i j l m n names p_rate_max rate_m rate_max t_rate_max Legend count count1;


i=1; % recording number
j=1; % each temperature
names =who('spike*');
symbolcell ={'.','o', 'x',  '+', '-','*', 'p', '-.','.','o', 'x',  '+', '-','*', ':', '-.'};
 
 %f1=figure; hold all;
 %ah1=gca;
 f2=figure;%('OuterPosition',[850 100 400 900]); hold all;
 %h=subplot(511);
 ah2=gca;
 f3=figure; hold all;
 ah3=gca;
 count=0; count1=0;
 for i=1:size(names,1)          
     n=eval(names{i});  % name of matrix spike_rate
     %disp(names(i));
     rate_m{i}=eval(names{i})  ;
     %plot(ah1, rate_m{i}(:,1), rate_m{i}(:,[2:end]), '-o'); 
     count=size( rate_m{i}(:,[2:end]),2)+count;
     %hold on;
     [m l] =max(rate_m{i}(:,[2:end]));  % max rate at each temp     
     rate_max{i} = m;     % array with max rates at each temp
     p_rate_max{i} = l;   % array with max indices of m
     t_rate_max{i}=  rate_m{i}( p_rate_max{i}(1,[1:end]), 1) ;
     
     sample=4;
     for j=2:size(t_rate_max{i},1) 
       %disp(j)
       tMax=t_rate_max{i}(j,1);
       if(tMax  >0 &&  tMax<11)
           sample=1;
       end
       if(tMax  >=11 &&  tMax<20)
           sample=2;
       end
       %if(tMax  >=15 &&  tMax<20)
       %    sample=3;
       %end
        
       switch sample
           case 1 %temp entre 0 y 5 grad
             %subplot(511);
             figure(f2); subplot(211);
             plot( rate_m{i}(:,1), rate_m{i}(:,j),  strcat('b-',[symbolcell{j}])) ; 
             xlim([0 20]);
             Legend{i}=names{i};
             %hold on
             %plot( rate_m{i}(:,1), rate_m{i}(:,j), strcat('b-o',[symbolcell{j}])); 
             plot(ah3, rate_m{i}(:,1), rate_m{i}(:,j), 'b-o');
             hold on
           case 2 %temp entre 0 y 5 grad
             figure(f2);subplot(212);
             plot( rate_m{i}(:,1), rate_m{i}(:,j),  strcat('m-',[symbolcell{j}])); 
             xlim([0 20]);
             Legend{i}=names{i};
             %hold on
             plot(ah3, rate_m{i}(:,1), rate_m{i}(:,j), 'm-o'); 
             hold on
           %case  3 %temp entre 0 y 5 grad         
           %  figure(f2);subplot(313);
           %  plot( rate_m{i}(:,1), rate_m{i}(:,j),  strcat('r-',[symbolcell{j}])); 
           %  xlim([0 20]);
           % Legend{i}=names{i};
           %  plot(ah3, rate_m{i}(:,1), rate_m{i}(:,j), 'r-o');
           %  hold on    
       end
       count1=count1+ j-2;
        legend(Legend)
     %
     end
     %legend(Legend)
    end
    
     
 disp(count)
 disp(count1)
 
 