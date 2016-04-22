%{
cd ('150114_001');
x=load('150114_001.mat','Y*');
concat_traces_no_resample_batch
save anayzed_150623_ch2_batch.mat
clear;
cd ..
%
cd ('150114_002');

x=load('150114_002.mat','Y*');
concat_traces_no_resample_batch
save anayzed_150623_ch2_batch.mat
clear;
cd ..
%}
cd ('hola1');
x=load('141008_004[1-704].mat','Y*');
concat_traces_no_resample_batch_test
save anayzed_160125_batch.mat
clear;
cd ..
%
cd ('hola2');
x=load('141014_002.4[1-577].mat','Y*');
concat_traces_no_resample_batch_test
save anayzed_160125_batch.mat
cd ..
clear;
%
