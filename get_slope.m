
    %x1 = cursor_info(1,1).Position(1,1);
    %y1 = cursor_info(1,1).Position(1,2);
    %x2 = cursor_info(1,2).Position(1,1);
    %y2 = cursor_info(1,2).Position(1,2);
 
    x1= time(100);
    x2= time(end-5);
    y1= tempx_r(100);
    y2= tempx_r(end -5);
    
    slope = abs((y2-y1)/(x2-x1));
    mes = strcat('slope is ', {' '}, num2str(slope), {' '},'Celcius/sec');
    mes1 = strcat('slope is ', {' '}, num2str(slope*60), {' '},'Celcius/min');
    disp(mes)
    disp(mes1)