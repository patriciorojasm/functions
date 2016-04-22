Fs=40000;
[p,q]=rat(1000/Fs,0.0001);
resamp_2 = resample(ch2,p,q);
figure, plot(resamp_2);