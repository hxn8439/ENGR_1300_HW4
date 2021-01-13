% Hamilton Nguyen Engr 1300.001 7/16/2018

%{
 Problem Statement: Refer to the set of instructions for this problem in the
 textbook.

 Known Variable: N/A, Refer to the Reference table (the arrays) down below.
 Unknown Variable: Power= ? [W] for the three following components with
 respective voltage.

 Assumption: None.

 Equations: P=V*I [W]; V is Voltage [V] while I is current [A] 
 
Case Scenario: Refer in the textbook for numerous case scenarios.

%}

clear; clc; 

Name = {'Holtz100' 'Lever014' 'Dillard202'}; %name Components

CurData = [5 7 10 12 15; 128 142 165 180 212; 18 20 23 25 30; 260 285 333 368 428]; %Row 1 is voltage, Row 2 is 
%Holtz100 current [mA],Row 3 is Lever014 current [mA],Row 4 is Dillard202 current [mA].

%menu choice of components
choice= menu('Choose a Component',Name{1},Name{2},Name{3});

%power data of the components 
Power_mA= [CurData(1,1:5).*CurData(2,1:5);CurData(1,1:5).*CurData(3,1:5);CurData(1,1:5).*CurData(4,1:5)];

%power data of the components in watts [W], with a conversion of currents in mA to A.
Power=(1*10^-3)*Power_mA;

%currents (I) from [mA] [A] for all components
Current=(1*10^-3)*[CurData(2,1:5);CurData(3,1:5);CurData(4,1:5)];

%voltage choices 
fprintf('Voltage Choices:\n%d\t%d\t%d\t%d\t%d\n\n',CurData(1,:));

%Statement for inputting voltage
Volt=input('Enter a voltage value from the list shown:');

% PRINTOUT of the solution.REFER EVERTHING BELOW. 

fprintf('\nComponent %s\n\tVoltage = %d V\n\tCurrent = %0.3f A\n\tPower = %0.2f W\n',Name{choice},Volt,Current(choice,find(CurData(1,:)==Volt)),Power(choice,find(CurData(1,:)==Volt)));