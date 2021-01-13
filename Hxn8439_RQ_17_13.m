% Hamilton Nguyen Engr 1300.001 7/24/2018

%{
 Problem Statement:

You want to create a graph showing the relationship of an ideal gas between pressure (P) and temperature (T).
Allow the initial temperature to be 270 kelvin. The range of temperatures to be modeled ranges from from 270 to 480 kelvin. Control the scale of the abscissa so the range is shown from 250 to 500 kelvin.

Model two gases:
Nitrogen (formula, N2; molecular weight, 28 grams per mole), using a 12-liter tank with an initial pressure of 2.5 atmospheres.
Oxygen (formula, O2; molecular weight, 32 grams per mole), using a 15-liter tank with an initial pressure of 4 atmospheres.
After drawing the graph for nitrogen and oxygen, model a third gas, with information entered by the user. Assume the volume is 12 liters.
Ask the user to enter the name of the gas [Example: Chlorine]
Ask the user to enter the initial pressure in the tank measured at 270 kelvin [Example: 3 atm]
Ask the user to enter the temperature of interest [Example: 400 kelvin]. The user is interested in a temperature in the range of 270 to 480 kelvin.
 
Known Variable: R=0.08206[atm*L/mol*K]
Unknown Variable: n/a. follow the case scenario in the textbook.
Assumption:ideal gas, n1=n2=1
Equations: PV=nRT
 Case Scenario:
Refer to the case scenarios for problem RQ_17_13 in textbook Thinking like
an Engineer 4th edition.
%}

clear; clc; close all;

R=0.08206; %[atm*L/mol*K], gas constant

%Nitrogen Gas
Ti=270; %[K]
V1=12; %[L]
P1=2.5; %[atm]
n1=(P1*V1)/(R*Ti); %[mol], Nitrogen

%Oxygen Gas
V2=15; %[L]
P2=4; %[atm]
n2=(P2*V2)/(R*Ti); %[mol], Oxygen

%User input Gas
name_gas=input('Enter the name of the gas: ','s'); %input string name of gas
i_pressure=input('Enter the initial pressure [atm]: '); %input initial pressure of gas
T_interest=input('Enter the temp of interest [k]: ');%input temperature of interest of gas
V3=12; %[L], Liters of gas 
n3=(i_pressure*V3)/(R*Ti); %[mol], gas of interest

T=(Ti:10:480);%set range

%plottting first graph
figure('color','white'); %background white
P_nitrogen=((n1*R)/V1)*T;% Y formula for nitrogen
P_oxygen=((n2*R)/V2)*T;% Y formula for oxygen
P_gas_interest=((n3*R)/V3)*T; %Y formula for gas of interest
plot(T,P_nitrogen,'--b','LineWidth',1); %plotting nitrogen curve
hold on;
plot(T,P_oxygen,':r','LineWidth',3);%plotting oxygen curve
hold on;
plot(T,P_gas_interest,'-m','LineWidth',1.5);%plotting gas of interest curve

grid on; %turning grid on
axis([250 500 0 8]); %setting grid axis
xlabel('Temperature(T)[K]'); %abcessa name
ylabel('Pressure (P)[atm]');%ordinate name
title('Pressure Change of Gases in a Tank','FontWeight','normal');%title of plot
legend('Nitrogen','Oxygen',sprintf('%s',name_gas),'Location','SE');%lengend of plot

figure('color','white'); %second plot(subplot)

subplot(3,1,1);%subplot 1
x = linspace(Ti,480);% set x axis range values
y1 = ((n1*R)/V1)*x; %set y formula for nitrogen
plot(x,y1,'--b','LineWidth',1)%subplot nitrogen curve 
grid on;%turn on grid
axis([250 500 0 8]);% set axis to grid
xlabel('Temperature(T)[K]');%abcessa label
ylabel('Pressure (P)[atm]');%ordinate label
title('Pressure Change of Nitrogen in a Tank','FontWeight','normal');%subplot 1 title

subplot(3,1,2); %subplot 2 
y2 = ((n2*R)/V2)*x; % set y formula for oxygen
plot(x,y2,':r','LineWidth',3) %subplot oxygen curve
grid on; %turn on grid 
axis([250 500 0 8]); %set axis to grid 
xlabel('Temperature(T)[K]'); %abcessa label
ylabel('Pressure (P)[atm]');%ordinate label
title('Pressure Change of Oxygen Gas in a Tank','FontWeight','normal'); %subplot 2 title

subplot(3,1,3);%subplot 3 
y3 = ((n3*R)/V3)*x;%set y formula for gas of interest
plot(x,y3,'-m','LineWidth',1.5)%subplot gas of interest
grid on;%turn on grid
axis([250 500 0 8]);%set axis to grid
xlabel('Temperature(T)[K]');%abcessa label
ylabel('Pressure (P)[atm]');%ordinate label
title('Pressure Change of Chlorine Gas in a Tank','FontWeight','normal'); %subplot 3 title

%Solve Pressure (P) value using Temperature of interest
syms P
eqn = (P*V3)/(n3*R) ==T_interest;
solx = solve(eqn,P);

%print solution to the user output
fprintf('At a temperature of %d Kelvin, %s has a pressure of %0.1f \natm.\n', T_interest, name_gas, solx);