%t_spikes=time(index(1,:))

% index   spikes=[1.44 4.36 9.94 15.32];
% time    x=0:0.01:16;


B=[time index;zeros(size(time)) ones(size(index))];

% Sort in ascending order of X coordinates
C=sortrows(B',1)';
% You can also SORT row 1 and reorder row 2 using the index you get from
%SORT

% Plot data
plot(C(1,:),C(2,:))
