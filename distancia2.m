%figure, plot(result.positions(:,1), result.positions(:,2));
%
%figure, subplot(2,1,1);
%plot(result.positions(:,1));
%subplot(2,1,2);
%plot(result.positions(:,2));
%
%figure, subplot(2,1,1);
%plot(diff(result.positions(:,1)));
%subplot(2,1,2);
%plot(diff(result.positions(:,2)));
%
x_der= diff(result.positions(:,1));
y_der= diff(result.positions(:,2));

t_zero = [];
i=1;
for i=  1:10831
   if (x_der(i)==0 && y_der(i) ==0)
       t_zero(i)=0;
   else
       t_zero(i)=1;
    
   end
end

time_zero = find(t_zero);
size_zero = size(time_zero,1);
time_one = find(t_zero==0);
size_one = size(time_one,1);

%figure;
%plot(result.positions(:,1)); 
%hold all;  plot(result.positions(:,2)); 
%xlim([0 2000]); 
%subplot(312), plot(xy_der); ylim([-.1 1.1]); xlim([0 2000]); title('xy der');
%subplot(313), plot(s_xy); ylim([-.1 1.1]); xlim([0 2000]); title('s xy');


%---------------------

%------entrar cut-off de la derivada--------------
%prompt = {'Enter drivative threshold (0-1):'};
%dlg_title = 'Input';
%num_lines = 1;
%def = {'1'};
%threshold = inputdlg(prompt,dlg_title,num_lines,def);
%threshold = str2num(threshold{1});
%--------------------------------------------------

%------umbral de la derivada--------------
%-----------------------------------------
threshold = 1;
%-----------------------------------------


%------esto viene de distancia4.m------------
i=1;
x_der = x_der';
y_der = y_der';
xy_der =[];    % vector que asigna un 1 cada vez que hay mas de 6 celdas con movimiento en x
for i=  1:size(x_der,2) 
   if abs(x_der(i)) <= threshold && abs(y_der(i)) <= threshold
       xy_der(i) =0;
   else
       xy_der(i) = 1;
   end
end
%
i=1; j=1;
%s_xy =[];    % vector que asigna un 1 cada vez que hay mas de 6 celdas con movimiento en x
%num=[];
time_quiet= (size(find(xy_der==0),2));  % numero de frames sin movimiento
time_quiet  =  time_quiet*900/result.end_frame

time_mov= (size(find(xy_der==1),2));  % numero de frames con movimiento
time_mov  =  time_mov*900/result.end_frame

time_total = time_quiet + time_mov

%timo = [];
%for i=  1:5:round(size(xy_der,2)-5) 
%while i < (size(xy_der,2)-5)
%    if (sum(xy_der(i:i+5))==0)
%       s_xy(j) =0;
%   else
%       s_xy(j) = 1;
%    end
%   num(j) = i;
%   
%   i=i+5;
%   j=j+1;
%end
%
%suma_xy=[];
%tim=find(s_xy);
figure,  plot(xy_der);
ylim([-.1 1.1])
%hold all;
%plot(num, s_xy, 'color', 'r');

saveas(gcf,'movimiento.pdf','pdf')