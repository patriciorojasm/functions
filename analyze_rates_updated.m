   
i=1;
j=1;
names =who('spike*');
 %names_t =who('temperature*');
 figure;
 for i=1:size(names,1)
     n=eval(names{i});  % name of matrix spike_rate
     %disp(names(i));
     rate_m{i}=eval(names{i});   
     plot(rate_m{i}(:,1), rate_m{i}(:,[2:end]), '-o'); 
     hold on;
     %end
 end
 
 
 
 
 %find max for every spike
 maximos=cell(size(rate_m,2),1);
 for i=1:size(rate_m,2)
     maximos{i}=max(rate_m{1,i});
 end
 
 tempMax=cell(size(rate_m,2),1);
 for i=1:11
     aux=zeros(size(maximos{i},2),5)
     for j=1:size(maximos{i},2)
       aux2=maximos{i}(1,j)
       if(aux2~=0)
         aux(j,1)=find(rate_m{1,i} == aux2)
       end
         aux(j,2)=mod(aux(j,1),size(rate_m{1,i},1));
         if(aux(j,2)==0)
             aux(j,2)=1;
         end
         aux(j,3)=j;
         aux(j,4)=aux2;
         aux(j,5)=rate_m{1,i}(aux(j,2),1);
       tempMax{i}=aux;
     end
 end
 
 
 figure;
 
 for i=1:size(names,1)
     rate_m{i}=eval(names{i});   
     for j=2:size(maximos{i},2)
     if(tempMax{i}(j,5)>0 && tempMax{i}(j,5)<5) %temp entre 0 y 5 grad
         %subplot(4,1,1);
         plot(rate_m{i}(:,1), rate_m{i}(:,j), 'b-o'); 
     elseif (tempMax{i}(j,5)>5 && tempMax{i}(j,5)<10) %temp entre 5 y10 grad
         %subplot(4,1,2)
         plot(rate_m{i}(:,1), rate_m{i}(:,j), 'g-o'); 
     elseif (tempMax{i}(j,5)>10 && tempMax{i}(j,5)<15) %temp entre 10 y 15 grad
         %subplot(4,1,3)
         plot(rate_m{i}(:,1), rate_m{i}(:,j), 'c-o');
     elseif(tempMax{i}(j,5)>15) %temp mayor a 15 grad
         %subplot(4,1,4)
         plot(rate_m{i}(:,1), rate_m{i}(:,j), 'r-o'); 
     %else
         %subplot(4,1,4)
         %plot(rate_m{i}(:,1), rate_m{i}(:,j), 'r-o'); 
     end
     end
         
     hold on;
     %end
 end
 
 
 
 

 
 
 
 
 