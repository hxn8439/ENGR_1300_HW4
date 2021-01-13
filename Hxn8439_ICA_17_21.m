% Hamilton Nguyen Engr 1300.001 7/16/2018

%{
 Problem Statement: There is currently an effort in the united states to
 replace incandescent light bulbs with more energy-ffeicient technologies,
 including compact fluoresent lights (CFLs) and light-emitting
 diodes(LEDs). The lumen[lm] is the SI unit of luminous flux, a measure of
 the perceived power of light. Luminious flux is adjusted to reflect the
 varying sensitivity of the human eye to diffent wavelengths of light.
 To test the power usage, you run an experiment and measure the following
 data. Create a proper plot of these data, with electrical consumption (EC)
 on the ordinate. use the data from the textbook.

On the graph, use solid blue circles for incandescent bulbs, solid red
squares for CLFs, and open black diamonds for LEDs

 Known Variable: none, refer to data table in textbook. 
 Unknown Variable: none, refer to data table in textbook. 
 Assumption: none, refer to data table in textbook. 
 Equations: none, refer to data table in textbook. 
 Case Scenario: plot the data to a graph.

%}

clear; clc; close all; 

%the values for the abscessa. 
Luminous_flux=[80 200 400 600 750 1250 1400];%(LF)[lm]

%Electrical Consumption(EC)[W], also the values for the ordinate.
Incandescent=[16 nan 38 55 68 nan 105];
CFL=[nan 5 10 nan 18 27 33];
LED=[1.7 3 6 9 12 nan nan];

figure('color', 'w')%background, white
plot(Luminous_flux,Incandescent,'bo','MarkerFaceColor','b')%plot for Luminous flux vs. Incandescent
hold on
plot(Luminous_flux,CFL,'rs','MarkerFaceColor','r')%plot for Luminous flux vs. CFL
hold on 
plot(Luminous_flux,LED,'dk')%plot for Luminous flux vs. LED

xlabel('Luminous Flux [lm]'); %x axis label
ylabel('Electrical Consumption(EC)[W]'); %y axis label
legend('Incandescent','CFL','LED','Location','Best') %legend for the data
title('Experimental data Power Usage of Lights'); % title of the plot data
grid on %create a grid in graph
axis([0 1450 0 110]); %declare a range values for abscessa and ordinate. 




