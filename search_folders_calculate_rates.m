%--- CTRL BTDA DZP----

cd Ctrl' BTDA DZPN 14102015'/ 
cd exp' 1'/
load('analyzed_20151202.mat', 'r_mean')
rate=r_mean;
%rate =[rate; r_mean];
clear r_mean;
cd ..
cd EXP' 2'/
load('analyzed_20151202.mat', 'r_mean')
rate =[rate; r_mean];
clear r_mean;
cd ..
cd EXP' 3'/
load('analyzed_20151202.mat', 'r_mean')
rate =[rate; r_mean];
clear r_mean;
cd ..
cd EXP' 2'/
load('analyzed_20151202.mat', 'r_mean')
rate =[rate; r_mean];
clear r_mean;
cd ..
cd ..
cd Ctrl' BTDA DZPN 19102015'/ 
cd EXP' 1'/
load('analyzed_20151202.mat', 'r_mean')
rate =[rate; r_mean];
clear r_mean;
cd ..
cd EXP' 2'/
load('analyzed_151202.mat', 'r_mean')
rate =[rate; r_mean];
clear r_mean;
cd ..
cd EXP' 3'/
load('analyzed_151202.mat', 'r_mean')
rate =[rate; r_mean];
clear r_mean;
cd ..
cd ..
cd Ctrl' BTDA DZPN 21102015'/ 
cd EXP' 1'/
load('analyzed_151202.mat', 'r_mean')
rate =[rate; r_mean];
clear r_mean;
cd ..
cd EXP' 2'/
load('analyzed_151202.mat', 'r_mean')
rate =[rate; r_mean];
clear r_mean;
cd ..
cd EXP' 3'/
load('analyzed_151202.mat', 'r_mean')
rate =[rate; r_mean];
clear r_mean;
cd ..
cd ..
cd Ctrl' BTDA DZPN 26102015'/ 
cd EXP' 1'/
load('analyzed_151202.mat', 'r_mean')
rate =[rate; r_mean];
clear r_mean;
cd ..
cd EXP' 2'/
load('analyzed_151202.mat', 'r_mean')
rate =[rate; r_mean];
clear r_mean;
cd ..; cd ..
