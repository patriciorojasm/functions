%--- EPI BTDA ----

cd Epi' BTDA 02092015'/ 
cd 040826_002/
load('analyzed_151202.mat', 'r_mean')
rate=r_mean;
%rate =[rate; r_mean];
clear r_mean;
cd ..
%cd 150724_003/
%load('analyzed_151202.mat', 'r_mean')
%rate =[rate; r_mean];
%clear r_mean;
%cd ..
%cd 150724_006/
%load('analyzed_151202.mat', 'r_mean')
%rate =[rate; r_mean];
%clear r_mean;
%cd ..;
cd ..
cd Epi' BTDA 03092015'/ 
cd 040826_001/
load('analyzed_151202.mat', 'r_mean')
rate =[rate; r_mean];
clear r_mean;
cd ..
%cd Epi' BTDA 03092015'/ 
cd 040826_002/
load('analyzed_151202.mat', 'r_mean')
rate =[rate; r_mean];
clear r_mean;
cd ..;cd ..
cd Epi' BTDA 24072015'/ 
cd 040826_001[1-62]/
load('analyzed_151202.mat', 'r_mean')
rate =[rate; r_mean];
clear r_mean;
cd ..;
cd 040826_003[1-99]/
load('analyzed_151202.mat', 'r_mean')
rate =[rate; r_mean];
clear r_mean;
cd ..;
cd 040826_004[1-99]/
load('analyzed_151202.mat', 'r_mean')
rate =[rate; r_mean];
clear r_mean;
cd ..;
cd 040826_005[1-101]/
load('analyzed_151202.mat', 'r_mean')
rate =[rate; r_mean];
clear r_mean;
cd ..;
%cd 040826_006[1-99]/
%load('analyzed_151202.mat', 'r_mean')
%rate =[rate; r_mean];
%clear r_mean;
%cd ..;
cd ..