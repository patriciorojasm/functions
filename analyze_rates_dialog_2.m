
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
      %---PROMPT---
     prompt = {'Enter value for plot'};
     dlg_title = 'Input';
     num_lines = 1;
     def = {'1'};
     co(i,1) = inputdlg(prompt,dlg_title,num_lines,def);
     %------------
     
 end
 figure;
for i=1:size(names,1)
     n=eval(names{i});  % name of matrix spike_rate
     %disp(names(i));
     rate_m{i}=eval(names{i});   
     if     str2num(co{i})==1
         col='r';
     elseif str2num(co{i})==2
         col='b';
     elseif str2num(co{i})==3
         col='g';
     end
     plot(rate_m{i}(:,1), rate_m{i}(:,[2:end]),  col); 
     hold on;
 end