%function plot_spike_with_button()
%-------------------------------------------------
% Plot cluster number with a button for next trace
%-------------------------------------------------
c = 1;  % cluster to plot
figure('OuterPosition',[2500 600 500 500]);  

global i1;
i1=1;
global si
si=size(j,1);
%hold on;
plot(spikes(j(1),:));

 uicontrol('Style', 'pushbutton', 'String', 'Next',...
        'Position', [20 20 50 20],...
        'Callback', @button_next);        % Pushbutton string callback

