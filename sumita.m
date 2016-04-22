%Calcular el tiempo que el alimalito se mueve
%
i=1;
s_x_der =[];    % vector que asigna un 1 cada vez que hay mas de 6 celdas con movimiento en x
for i=  1:(size(x_der,1)-5) 
   if (sum(x_der(i:i+5))==0)
       s_x_der(i) =1;
   else
       s_x_der(i) = 0;
   end
end
%
i=1;
s_y_der =[];     % vector que asigna un 1 cada vez que hay mas de 6 celdas con movimiento en y
for i=  1:(size(y_der,1)-5) 
   if (sum(y_der(i:i+5))==0)
       s_y_der(i) =1;
   else
       s_y_der(i) = 0;
   end
end
%
j=2;
suma_x = []; % vector que asigna 1 cada vez que elemento j y j-1 detectaron movimiento en x
for j=2:size(s_x_der,2)
    if (s_x_der(j)==1 && s_x_der(j-1)~=1)
        suma_x(j)=1;
    else
        suma_x(j)=0;
    end
end

j=2;
suma_y = [];     % vector que asigna 1 cada vez que elemento j y j-1 detectaron movimiento en y
for j=2:size(s_y_der,2)
    if (s_y_der(j)==1 && s_y_der(j-1)~=1)
        suma_y(j)=1;
    else
        suma_y(j)=0;
    end
end

num_event_x=sum(suma_x);    
time_mov_x = num_event_x*.5   % time in seconds
num_event_y=sum(suma_x);
time_mov_y = num_event_y*.5   % time in seconds
       