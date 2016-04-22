function rasterplot(trials,times,xlim,hfig)
% function to rastes plot
% It is plot the times 
% structure the input
% times is trial related in seconds
% trial is a vector large is equal to the number of spikes
% 
%%%%%%%%%%%%%% Plot variables %%%%%%%%%%%%%%
plotwidth=1;     % spike thickness
plotcolor='k';   % spike color
trialgap=1.5;    % distance between trials
showlabels=1;    % display x and y labels

%%%%%%%%% Code Begins %%%%%%%%%%%%

if nargin < 4
   figure;
   hfig=gca;
end  
 % plot spikes
  

  numspikes=length(times);
  xx=ones(3*numspikes,1)*nan;
  yy=ones(3*numspikes,1)*nan;

  yy(1:3:3*numspikes)=(trials)*trialgap;
  yy(2:3:3*numspikes)=yy(1:3:3*numspikes)+1;
  
  %scale the time axis to s
  xx(1:3:3*numspikes)=times;
  xx(2:3:3*numspikes)=times;
  %xlim=[0,triallen];

  axes(hfig);
  plot(xx, yy, plotcolor, 'linewidth',plotwidth);
  axis ([xlim,0,(max(trials)+1)*1.5]);

  
 set(hfig, 'ytick', max(yy),'YTickLabel',{num2str(max(trials))},'tickdir','out');   
 box off;
 
  
  if (showlabels)
    xlabel('Time(s)');
    ylabel('Trials');
  end
 
   
  
  
end
  