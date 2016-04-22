%--- EPI BTDA DZP----

cd Epi' BTDA DZPN 07092015'/ 
cd EXP' 1'/
load('analyzed_151202.mat', 'r_mean')
rate=r_mean;
%rate =[rate; r_mean];
clear r_mean;
cd ..
cd EXP' 2'/
load('analyzed_151202.mat', 'r_mean')
rate =[rate; r_mean];
clear r_mean;
cd ..; cd ..
cd Epi' BTDA DZPN 08112015'/ 
cd EXP' 1'/
load('analyzed_151202.mat', 'r_mean')
rate =[rate; r_mean];
clear r_mean;
cd ..; 
cd EXP' 2'/
load('analyzed_151202.mat', 'r_mean')
rate =[rate; r_mean];
clear r_mean;
cd ..; 
cd EXP' 3'/
load('analyzed_151202.mat', 'r_mean')
rate =[rate; r_mean];
clear r_mean;
cd ..; cd ..
cd Epi' BTDA DZPN 29102015'/ 
cd EXP' 1'/
load('analyzed_151202.mat', 'r_mean')
rate =[rate; r_mean];
clear r_mean;
cd ..; 
cd EXP' 2'/
load('analyzed_151202.mat', 'r_mean')
rate =[rate; r_mean];
clear r_mean;
cd ..; 
cd EXP' 3'/
load('analyzed_151202.mat', 'r_mean')
rate =[rate; r_mean];
clear r_mean;
cd ..; cd ..