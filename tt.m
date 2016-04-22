function tt(trace1,trace2)
%trace =121;
dt=0.0001;
length=49920;

ti_1=trace1*dt*length;
ti_2=trace2*dt*length;
st=strcat('times are ',{' '},num2str(ti_1),{' '},'and',{' '},num2str(ti_2));
disp(st);
