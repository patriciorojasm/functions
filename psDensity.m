%function[] = psDensity(archivo,varargin)

%call the function like this:
%archivo,segment 1, segment 2, type1, segment 3, segment 4, type2, segment 5,
%segment6, type3
% ej.: psDensity('14102014_3.mat',0,200,'Low K',300,400,'High K',
% 600,750,'Bumetanide')
   % out=data;
    %load(archivo,'out'); %load only the out vector from the file
v_pol=3;
f=9 ;
out = out';    
data=sgolayfilt(out,v_pol,f);
out = out';

Fs1=10000; %sampling frequency
a1=26000000;
a2=34000000;
b1=35000000;
b2=40000000;
c1=42000000;
c2=46000000;
   %{ 
if (nargin == 10) % all the information, with 3 segments
            
            if(varargin{1}==0) %case of starting from the very begining
                a1=1; %init of segment 1
            else
                a1 = varargin{1}*Fs1; %init of segment 1
            end
            a2 = varargin{2}*Fs1; %end of segment 1

            b1 = varargin{4}*Fs1; %init of segment 2
            b2 = varargin{5}*Fs1; %end of segment 2

            c1 = varargin{7}*Fs1; %init of segment 3
            if(strcmp(varargin(8),'last')==1)  %end of segment 3 is till the end?
              c2 = size(out(2,:),2); %yes
            else
              c2 = varargin{8}*Fs1; %no, it is fixed
            end
            %}
            
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            %                 Channel 1                     %
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            
            %here, will take the segments out from the loaded data vector
            a = out(1,[a1:a2]); 
            b = out(1,[b1:b2]);
            c = out(1,[c1:c2]);
            
            %analysis block
            wina=floor(size(a,2)/10); %set window size
            noverlapa=floor(wina/4); %set overlaping size
            pa=pwelch(a,wina,noverlapa); %welch power spectral density
            NFFT1=2^nextpow2(size(pa,1)); %number of samples to the frequency vector
            fa=(Fs1/2)*linspace(0,1,NFFT1/2+1); %frequency vector

            %SAME FROM THE SECOND SEGMENT
            winb=floor(size(b,2)/10);
            noverlapb=floor(winb/4);
            pb=pwelch(b,winb,noverlapb);
            NFFT1=2^nextpow2(size(pb,1));
            fb=(Fs1/2)*linspace(0,1,NFFT1/2+1);

            %SAME FROM THE THIRD SEGMENT
            winc=floor(size(c,2)/10);
            noverlapc=floor(winc/4);
            pc=pwelch(c,winc,noverlapc);
            NFFT1=2^nextpow2(size(pc,1));
            fc=(Fs1/2)*linspace(0,1,NFFT1/2+1);


            %Ploting block
            figure;
            loglog(fa,pa,'k','linewidth',2)
            hold on;
            loglog(fb,pb,'r','linewidth',2)
            hold on;
            loglog(fc,pc,'b','linewidth',2)
            grid on;
            title ('PSD Channel 1');
           % ylim([min(pa) max(pa)+20]); %amplitude limit
            ylabel('uV^2/Hz');
            %xlim([0.1 500]); %frequency limit
            xlabel('Frequency[Hz]');
           % legend([varargin(3),varargin(6),varargin(9)],'Location','SouthWest'); %set the legend with the provided input
            legend('Control','Bum', 'Wash','Location','SouthWest');
            hold off;
            
           % clear out;
            
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            %                 Channel 2                     %
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

            %here, will take the segments out from the loaded data vector
            a = out(2,[a1:a2]); 
            b = out(2,[b1:b2]);
            c = out(2,[c1:c2]);            
            
            %analysis block
            wina=floor(size(a,2)/10); %set window size
            noverlapa=floor(wina/4); %set overlaping size
            pa=pwelch(a,wina,noverlapa); %welch power spectral density
            NFFT1=2^nextpow2(size(pa,1)); %number of samples to the frequency vector
            fa=(Fs1/2)*linspace(0,1,NFFT1/2+1); %frequency vector

            %SAME FROM THE SECOND SEGMENT
            winb=floor(size(b,2)/10);
            noverlapb=floor(winb/4);
            pb=pwelch(b,winb,noverlapb);
            NFFT1=2^nextpow2(size(pb,1));
            fb=(Fs1/2)*linspace(0,1,NFFT1/2+1);

            %SAME FROM THE THIRD SEGMENT
            winc=floor(size(c,2)/10);
            noverlapc=floor(winc/4);
            pc=pwelch(c,winc,noverlapc);
            NFFT1=2^nextpow2(size(pc,1));
            fc=(Fs1/2)*linspace(0,1,NFFT1/2+1);

            %Ploting block
            figure;
            loglog(fa,pa,'k','linewidth',2)
            hold on;
            loglog(fb,pb,'r','linewidth',2)
            hold on;
            loglog(fc,pc,'b','linewidth',2)
            hold on;
            grid on;
            title ('PSD Channel 2');
            %xlim([1e-1 1e4]);
            %ylim([min(pa) 10e5])
           % ylim([min(pa) max(pa)+20]); %amplitude limit
            ylabel('uV^2/Hz');
          %  xlim([0.1 500]); %frequency limit
            xlabel('Frequency[Hz]');
         %   legend([varargin(3),varargin(6),varargin(9)],'Location','SouthWest'); %set the legend with the provided input
            legend('Control','Bum', 'Wash','Location','SouthWest');
            
            
         %{
            else
    if(nargin == 7) %only 2 segments to analyze
            if(varargin{1}==0) %case of starting from the very begining
                a1=1; %init of segment 1
            else
                a1 = varargin{1}*Fs1; %init of segment 1
            end
            a2 = varargin{2}*Fs1; %end of segment 1

            c1 = varargin{4}*Fs1; %init of segment 2
            if(strcmp(varargin(5),'last')==1)  %end of segment 2 is till the end?
              c2 = size(out(2,:),2); %yes
            else
              c2 = varargin{5}*Fs1; %no, it is fixed
            end
            
            
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            %                 Channel 1                     %
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            
            %here, will take the segments out from the loaded data vector
            a = out(1,[a1:a2]); 
            c = out(1,[c1:c2]);
            
            %analysis block
            wina=floor(size(a,2)/10); %set window size
            noverlapa=floor(wina/4); %set overlaping size
            pa=pwelch(a,wina,noverlapa); %welch power spectral density
            NFFT1=2^nextpow2(size(pa,1)); %number of samples to the frequency vector
            fa=(Fs1/2)*linspace(0,1,NFFT1/2+1); %frequency vector

            %SAME FROM THE SECOND SEGMENT
            winc=floor(size(c,2)/10);
            noverlapc=floor(winc/4);
            pc=pwelch(c,winc,noverlapc);
            NFFT1=2^nextpow2(size(pc,1));
            fc=(Fs1/2)*linspace(0,1,NFFT1/2+1);

            %Ploting block
            figure;
            loglog(fa,pa,'r','linewidth',2)
            hold on;
            loglog(fc,pc,'b','linewidth',2)
            hold on;
            grid on;
            title ('PSD Channel 1');
            ylim([min(pa) max(pa)+20]); %amplitude limit
            ylabel('uV^2/Hz');
            xlim([0.1 500]); %frequency limit
            xlabel('Frequency[Hz]');
            legend([varargin(3),varargin(6)],'Location','SouthWest'); %set the legend with the provided input

            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            %                 Channel 2                     %
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

            %here, will take the segments out from the loaded data vector
            a = out(2,[a1:a2]); 
            c = out(2,[c1:c2]);            
            
            %analysis block
            wina=floor(size(a,2)/10); %set window size
            noverlapa=floor(wina/4); %set overlaping size
            pa=pwelch(a,wina,noverlapa); %welch power spectral density
            NFFT1=2^nextpow2(size(pa,1)); %number of samples to the frequency vector
            fa=(Fs1/2)*linspace(0,1,NFFT1/2+1); %frequency vector

            %SAME FROM THE THIRD SEGMENT
            winc=floor(size(c,2)/10);
            noverlapc=floor(winc/4);
            pc=pwelch(c,winc,noverlapc);
            NFFT1=2^nextpow2(size(pc,1));
            fc=(Fs1/2)*linspace(0,1,NFFT1/2+1);

            %Ploting block
            figure;
            loglog(fa,pa,'r','linewidth',2)
            hold on;
            loglog(fc,pc,'b','linewidth',2)
            hold on;
            grid on;
            title ('PSD Channel 2');
            ylim([min(pa) max(pa)+20]); %amplitude limit
            ylabel('uV^2/Hz');
            xlim([0.1 500]); %frequency limit
            xlabel('Frequency[Hz]');
            legend([varargin(3),varargin(6)],'Location','SouthWest'); %set the legend with the provided input
    end
  %  end
    
    
%end
            %}