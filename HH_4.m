clc %clears workspace
clear %clears any variables

%Model Constants:
Cm = 1.0; %(uF/cm^2) Membrane capacitance
ENa = 115; %(mV) Sodium Voltage
EK = -12; %(mV) Potassium Voltage
EL = 10.613; %(mV) Leakage Voltage
g_Na = 120; %(mS/cm^2) Sodium conductance
g_L = 0.3; %(mS/cm^2) Leakage conductance
g_K = 36; %(mS/cm^2) Potassium conductance
I_stim = 200; %(uA/cm^2) Amount of current stimulation for 0.05msec
Simul_time = 20; %(msec) Duration of the simulation

%Initial Conditions:
V(1) = 0; %(mV) Initial membrane voltage condition at time 0
m(1) = ((.1*25)/(exp(25/10)-1))/(((.1*25)/(exp(25/10)-1))+4); %initial value for the gating variable m
h(1) = 0.07/(0.07+1/(exp(30/10)+1)); %initial value for the gating variable h
n(1) = (.1/(exp(1)-1))/(.1/(exp(1)-1)+0.125); %initial value for the gating variable n

%Stepsize
step = 0.01; %(ms) Step size between points where slope is calculated
N = Simul_time/step; %Total number of points of data to be taken

time1(1) = 0; %initialization of time so time at t = 1 is 0 milliseconds
for num = 1:N %for loop initialization that contains calculation of all the data points
for i = 1:4 %embedded for loop to determine the variables necessary to calculate Hodgkin Huxley
if i == 1 %conditional statement for variables at the first slope
variable1 = V(num); %sets variable1 equal to the voltage at point num for the first slope
variable2 = m(num); %sets variable2 equal to the m value at point num for the first slope
variable3 = h(num); %sets variable3 equal to the h value at point num for the first slope
variable4 = n(num); %sets variable4 equal to the n value at point num for the first slope
end %end of the first slope conditional statement
if i<1 || i>4 %conditional statement for variables at the second and third slopes
variable1 = V(num)+(step/2)*K(i-1,1); %determines the voltage for the second and third slopes using the Runge-Kutta 4th order step increments
variable2 = m(num)+(step/2)*K(i-1,2); %determines the m value for the 2nd and 3rd slopes
variable3 = h(num)+(step/2)*K(i-1,3); %determines the h value for the 2nd and 3rd slopes
variable4 = n(num)+(step/2)*K(i-1,4); %determines the n value for the 2nd and 3rd slopes
end %end conditional statement for second and third slope
if i == 4 %conditional statement for variables at the fourth slope
variable1 = V(num)+step*K(i-1,1); %determines voltage for the fourth slope
variable2 = m(num)+step*K(i-1,2); %determines the m value for the fourth slope
variable3 = h(num)+step*K(i-1,3); %determines the h value for the fourth slope
variable4 = n(num)+step*K(i-1,4); %determines the n value for the fourth slope
end %end fourth slope conditional statement
for L = 1:4 %corresponds to slopes of points
if L == 1; %if for the first slope
if time1(num) > 0.05; %conditional statement accounting for the 0.05ms stimulation, so after 0.05ms, the stimulation current is zero
I_stim = 0; %current stimulation is zero after 0.05ms
I_Na(num) = g_Na*variable2^3*variable3*(variable1-ENa); %determines the value of the sodium current at point 1
I_K(num) = g_K*variable4^4*(variable1-EK); %determines the potassium current at point 1
I_L(num) = g_L*(variable1-EL); %determines the leakage current at point 1
K(i,L) = -(I_Na(num)+I_K(num)+I_L(num)-I_stim)/Cm; %determines the value of the dV/dt of the voltage equation

else %condition when time is less than 0.05msec
I_Na(num) = g_Na*variable2^3*variable3*(variable1-ENa); %determines the sodium current at point 1
I_K(num) = g_K*variable4^4*(variable1-EK); %determines the potassium current
I_L(num) = g_L*(variable1-EL); %determines the leakage current
K(i,L) = -(I_Na(num)+I_K(num)+I_L(num)-I_stim)/Cm; %determines the value of dV/dt (slope)
end %end conditional statements
end %end conditional statements
if L == 2; %if for the second slope
Alpha_m = 0.1*(25-variable1)/(exp((25-variable1)/10)-1); %finds the Alpha m H-H gating variable
Beta_m = 4*exp(-variable1/18); %finds the Beta m H-H gating variable
K(i,L) = Alpha_m*(1-variable2)-Beta_m*variable2; %finds the next K value slope
end %end condition
if L == 3; %if for the third slope
Alpha_h = 0.07*exp(-variable1/20); %finds the Alpha h HH gating variable
Beta_h = 1/(exp((30-variable1)/10)+1); %finds the Beta h HH gating variable
K(i,L) = Alpha_h*(1-variable3)-Beta_h*variable3; %finds the next slope
end %end condition
if L == 4; %4th slope
Alpha_n = 0.01*(10-variable1)/(exp((10-variable1)/10)-1); %HH gating variable
Beta_n = 0.125*exp(-variable1/80); %HH gating variable
K(i,L) = Alpha_n*(1-variable4)-Beta_n*variable4; %4th slope
end %end condition
end %end for loop
if i == 4; %conditional statement
for P = 1:4; %for loop to determine the values of k needed for finding the next points
kbar(P) = (1/6)*(K(1,P)+2*K(2,P)+2*K(3,P)+K(4,P)); %finds the weighted average of the slope voltage values
end %end for loop
V(num+1) = V(num)+step*kbar(1); %determines the value of the next voltage point
m(num+1) = m(num)+step*kbar(2); %determines the value of the next m
h(num+1) = h(num)+step*kbar(3); %determines the value of the next h
n(num+1) = n(num)+step*kbar(4); %determines the value of the next n
time1(num+1) = time1(num)+step; %increments the time so that it continues on
end %end conditional statement
end %end for loop
end %end initial for loop

I_Na(num+1) = g_Na*m(num+1)^3*h(num)*(V(num+1)-ENa); %sodium ionic current for the next point
I_K(num+1) = g_K*n(num+1)^4*(V(num+1)-EK); %potassium ionic current for the next point
I_L(num+1) = g_L*(V(num+1)-EL); %leakage current for the next point

Voltage = -100:.1:150; %voltage span for plotting

Alpha_m = 0.1.*(25-Voltage)./(exp((25-Voltage)./10)-1); %alpha m gating variable
Beta_m = 4.*exp(-Voltage./18); %beta m gating variable
Tao_m = 1./(Alpha_m+Beta_m); %Tm time constant

Alpha_h = 0.07.*exp(-Voltage./20); %alpha h gating variable
Beta_h = 1./(exp((30-Voltage)./10)+1); %beta h gating variable
Tao_h = 1./(Alpha_h+Beta_h); %Th time constant

Alpha_n = 0.01.*(10-Voltage)./(exp((10-Voltage)./10)-1); %alpha n gating variable
Beta_n = 0.125.*exp(-Voltage./80); %beta n gating variable
Tao_n = 1./(Alpha_n+Beta_n); %Tn time constant

m_bar = Alpha_m./(Alpha_m+Beta_m); %sodium current m value
h_bar = Alpha_h./(Alpha_h+Beta_h); %sodium current h value
n_bar = Alpha_n./(Alpha_n+Beta_n); %potassium current n value

figure(1) %produces the first figure
plot(time1,V) %plots voltage versus time, an action potential
xlabel('Time (ms)') %labels the x axis with time
ylabel('Membrane Voltage (mV)')%labels the y axis with voltage
title('Action Potential') %provides a title for the plot

figure(2) %produces the second figure
plot(Voltage,m_bar,Voltage,h_bar,Voltage,n_bar) %plots the voltage versus gating variables, all three on one plot
xlabel('Voltage (mV)') %labels the x axis with voltage
ylabel('Gating variables') %labels the y axis with gating variable values
title('Gating Variables vs Voltage') %provides a title for the plot
legend('m value','h value','n value') %produces a legend to label the plot curves

figure(3) %produces the third figure
plot(Voltage,Tao_m,Voltage,Tao_h,Voltage,Tao_n) %plots voltage versus time constants for all three time constants
xlabel('Membrane Voltage (mV)') %labels the x axis with voltage
ylabel('Time Constant Value') %labels the y axis with time constant values
title('Time Constants as a function of Membrane Voltage') %provides a title to the plot
legend('Tau m','Tau h','Tau n') %provides a legend to label the curves

figure(4) %produces the fourth figure
plot(time1,I_Na,time1,I_K,time1,I_L) %plots the ionic currents versus time
title('Ionic Currents vs Time') %adds a title to the plot
xlabel('Time (ms)') %labels the x axis with time
ylabel('Ionic Current (uA)') %labels the y axis with current
legend('Sodium Current','Potassium Current','Leakage Current') %provides a legend to label the plots

figure(5) %produces the final figure
plot(time1,m,time1,h,time1,n) %plots the gating variables versus time
xlabel('Time (ms)') %labels the x axis
ylabel('Gating variables') %labels the y axis
title('Gating Variables vs Time') %adds a title to the plot
legend('m value','h value','n value') %provides a legend to label the plots
