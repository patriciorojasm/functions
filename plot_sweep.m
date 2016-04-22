% plot sweep "sweep"
% uses data from concat_traces>marcelo_2.m
clear sweep sweep_dur x1 x2 sweep_i sweep_f;

%figure, 
plot(time_new, out(:,1))
sweep_dur=time_new(49920/5);  % time of one sweep
sweep = 370;
x1=(sweep-1)*sweep_dur;
x2=x1+sweep_dur;
xlim([x1 x2]);
ylim([-1 1]);