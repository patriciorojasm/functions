i=1;
x_der = x_der';
y_der = y_der';
xy_der =[];    % vector que asigna un 1 cada vez que hay mas de 6 celdas con movimiento en x
for i=  1:size(x_der,2) 
   if abs(x_der(i)) <=1 && abs(y_der(i)) <= 1
       xy_der(i) =0;
   else
       xy_der(i) = 1;
   end
end
%
i=1; j=1;
s_xy =[];    % vector que asigna un 1 cada vez que hay mas de 6 celdas con movimiento en x
num=[];
%timo = [];
%for i=  1:5:round(size(xy_der,2)-5) 
while i < (size(xy_der,2)-5)
    if (sum(xy_der(i:i+5))==0)
       s_xy(j) =0;
   else
       s_xy(j) = 1;
    end
   num(j) = i;
   
   i=i+5;
   j=j+1;
end
%
%suma_xy=[];
tim=find(s_xy);
subplot(212), plot(xy_der); xlim([0 2000]);
ylim([-.1 1.1])
hold all;
plot(num, s_xy, 'color', 'r');