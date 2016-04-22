%figure;
%plot(sipkes(:,20));
names={'zero' 'uno' 'dos' 'tres' 'cuatro' 'cinco' 'seis' 'siete' 'ocho'};
%
f_6=figure('OuterPosition',[800 500 500 800]);
for c=0:c_num
    subplot(c_num+1,1,c+1);
    %j=find(cluster_class(:,1)==c);
    %p_uno= spikes(j,20);
    p.(names{c+1}) = spikes(s.(names{c+1}),25); % peak amplitude
    %plot(tim.(names{c+1}), p.(names{c+1}),'oc','color',cc(c+1,:));  % ALT
    plot(p.(names{c+1}),'oc','color',cc(c+1,:));
end

f_7=figure('OuterPosition',[1300 500 500 800]);
for c=0:c_num
    subplot(c_num+1,1,c+1);
    %j=find(cluster_class(:,1)==c);
    %p_uno= spikes(j,20);
    p.(names{c+1}) = spikes(s.(names{c+1}),25); % peak amplitude
    %plot(tim.(names{c+1}), p.(names{c+1}),'oc','color',cc(c+1,:));      
    
    j=find(cluster_class(:,1)==c);    % indice of each clustered spike in cluster_class
    t=cluster_class(:,2);  % spike's time 
    t=.001*t';
    plot(t(j), p.(names{c+1}),'oc','color',cc(c+1,:));    
    
end


%{
figure;
%subplot(3,1,1);plot(tim.uno, p.uno,'o','color',cc(2,:)); % amplitude cluster 1
subplot(4,1,1);plot(p.uno,'o','color',cc(2,:)); % amplitude cluster 1
%subplot(3,1,2);plot(tim.dos, p.dos,'or','color',cc(3,:)); % amplitude cluster 2
subplot(4,1,2);plot(p.dos,'or','color',cc(3,:)); % amplitude cluster 2
%subplot(3,1,3);plot(tim.tres, p.tres,'oc','color',cc(4,:)); % amplitude cluster 3
subplot(4,1,3);plot(p.tres,'oc','color',cc(4,:)); % amplitude cluster 3
subplot(4,1,4);plot(p.cuatro,'oc','color',cc(4,:)); % amplitude cluster 3
%
%
figure('OuterPosition',[850 200 200 600]); 

m1=mean(spikes(s.uno(200:220),:));
m2=mean(spikes(s.uno(end-40:end-20),:));

er1=std(spikes(s.uno(200:220),:))/sqrt(length(spikes(s.uno(200:220))));
er2=std(spikes(s.uno(end-40:end-20),:))/sqrt(length(spikes(s.uno(end-40:end-20))));

subplot(411);
errorbar(m1,er1,'k','linewidth',2);hold all;
errorbar(m2,er2,'r','linewidth',2);
xlim([10 40]); box off; axis off;
%------------------------------------------
m1=mean(spikes(s.dos(1:20),:));
m2=mean(spikes(s.dos(end-20:end),:));

er1=std(spikes(s.dos(1:20),:))/sqrt(length(spikes(s.dos(1:20))));
er2=std(spikes(s.dos(end-20:end),:))/sqrt(length(spikes(s.dos(end-20:end))));

subplot(412);
errorbar(m1,er1,'k','linewidth',2);hold all;
errorbar(m2,er2,'r','linewidth',2);
xlim([10 40]); box off; axis off;
%------------------------------------------
m1=mean(spikes(s.tres(1:10),:));
m2=mean(spikes(s.tres(end-20:end),:));

er1=std(spikes(s.tres(1:10),:))/sqrt(length(spikes(s.tres(1:10))));
er2=std(spikes(s.tres(end-20:end),:))/sqrt(length(spikes(s.tres(end-20:end))));

subplot(413);
%errorbar(m1,er1,'k','linewidth',2);hold all;
errorbar(m2,er2,'r','linewidth',2);
xlim([10 40]); box off; axis off;
%------------------------------------------
m1=mean(spikes(s.cuatro(1:10),:));
m2=mean(spikes(s.cuatro(end-20:end),:));

er1=std(spikes(s.cuatro(1:10),:))/sqrt(length(spikes(s.cuatro(1:10))));
er2=std(spikes(s.cuatro(end-20:end),:))/sqrt(length(spikes(s.cuatro(end-20:end))));

subplot(414);
errorbar(m1,er1,'k','linewidth',2);hold all;
errorbar(m2,er2,'r','linewidth',2);
xlim([10 40]); box off; axis off;
%}