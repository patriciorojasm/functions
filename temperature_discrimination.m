clear rate_m_means x1 x x2;
fa=figure; hold all; ah1=gca;
fb=figure; hold all; ah2=gca;
for i=1:size(names,1)          
     rate_m{i}=eval(names{i})  ;
     x=rate_m{i}';    % matrix for operation
     x(1,:)=NaN;            % temperature column = Nan
     x(find(x==0))=NaN;     % changes 0 to NaN 
     x=x';
     x1{i} = nanmean(x); % find mean
     x2{i} = nanstd(x); % find mean
     % --- plot ---
     plot(ah1, x1{i}, x2{i},'o-');
     xlabel('mean');
     ylabel('std');
     Legend_temp{i}=names{i};
     hold all;
     % --- plot ---
     figure(fb); subplot(211);
     plot(x2{i},'-o');
     xlabel('unit number');
     ylabel('std');
     Legend_temp{i}=names{i};
     hold all;
     subplot(212);
     errorbar(x1{i},x2{i},'-o');
     xlabel('unit number');
     ylabel('mean');
     Legend_temp{i}=names{i};
     hold all;
end
legend(Legend_temp);

x_ax=linspace(0, 1.1, 10);
y_ax=x_ax;
plot(ah1,x_ax, y_ax, 'k-.');
xlim(ah1, [0 1.2]); ylim(ah1, [0 .8]);