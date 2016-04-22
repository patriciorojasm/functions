
  load([ '130305_011[1-1500].mat'],'Y*')              %load the data file, exported from winWCP, but only the Y register

  rows=size(Data,2);                    %will store the readed rows
  j=1;
  Fs=20224;
  while (j<=rows)
    init   = Data(j,1);                 %init slice
    ending = Data(j,2);                 %ending slice
    i    = init;                        %index counter
    aux  = [];                          %empty aux vector
    while(i<=ending)
        b=strcat('Y',num2str(i));       %creates a string Y1, Y2, ....
        aux=cat(1,aux,eval(b));         %will concatenate aux+Y1, aux+Y2, ... 
        i=i+1;
    end
    
    Im=aux(:,1);                        %channel 1 vector
    Vm=aux(:,2);                        %channel 2 vector
    Time=linspace(init,size(Im,2),Fs);   %time vector
    
    fprintf('Ahora a graficar')
    graficar(Im,Vm,Time,init,ending)
    j=j+1;
  end


