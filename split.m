function[aux] = split(registros)
tic;
reg = fopen(registros);             %open the file that has the names of the registers to be read

while (~feof(reg))
  name = fgetl(reg);                %gets the name of each register
  Data = csvread([name '.txt']);         %Data will open a file containing the init and ending of each register 
  load([name '.mat'],'Y*');              %load the data file, exported from winWCP, but only the Y register

  rows=size(Data,2);                    %will store the readed rows
  j=1;
  Fs=20224;
  
    init   = Data(1,1);                 %init slice
    ending = Data(1,2);                 %ending slice
    i    = init;                        %index counter
    aux  = [];                          %empty aux vector
    while(i<=ending)
        b=strcat('Y',num2str(i));       %creates a string Y1, Y2, ....
        aux=cat(1,aux,eval(b));         %will concatenate aux+Y1, aux+Y2, ... 
        i=i+1
    end
    
    %Im=aux(:,1);                        %channel 1 vector
    %Vm=aux(:,2);                        %channel 2 vector
    %Time=linspace(init,size(Im,2),Fs);   %time vector
    
    %fprintf('Ahora a graficar')
   % graficar(Im,Vm,Time,init,ending)
 end

fclose('all');
%fclose(Data);
toc
end
  


