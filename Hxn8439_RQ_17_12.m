% Hamilton Nguyen Engr 1300.001 7/24/2018

%{
 Problem Statement:

We want to conduct an analysis for a wooden baseball bat manufacturer that is interested in diversifying its product line by adding more materials and possibly upgrading the equipment. To help the manufacturer look at the different scenarios, write a program that includes the following:
Load the information from the MAT file titled BatCost.mat. This file contains the following variables:

The bats can be produced from four different materials: ash, hickory, maple and pine. The material names are stored as a cell array in the variable Materials.
The estimated material cost to produce 25 bats from each material is saved in the vector Cost. To determine the material cost per bat, the value given in Cost will need to be divided by 25.
The labor and energy cost to produce one bat is estimated in the scalar variable LECost. This cost is the same regardless of the bat material.
Using a menu, ask the user to select the material for the bat. Ask the user to enter, as a scalar, the selling price of a single bat made from the chosen material. The material name chosen by the user must appear in this statement.
Ask the user to enter, as a vector, the total number of bats the manufacturer can produce per week without an upgrade, and the number of weeks the manufacturer plans to run the bat production machinery in a year; these values are the same regardless of the type of bat produced.
Ask the user to enter a vector containing the ADDITIONAL number of bats that can be produced in a week if the equipment is upgraded, and the fixed cost for the upgrade.
The variable cost of production will be the summation of the material cost, labor cost, and energy cost and is the same for a given material regardless of upgrades.
 
Known Variable: n/a. 
 Unknown Variable: n/a.
 Assumption: n/a.
 Equations: n/a
 Case Scenario: 

Selling Price per bat:         $##.##
Total Variable Cost per bat:    $##.##
NO UPGRADE
Producing ## MMM bats a week for ## weeks = ## total bats
    Profit:             ##.#E##
WITH UPGRADE
Producing ## MMM bats a week for ## weeks = ## total bats
    Fixed Cost of upgrade:???$##.## 
    Profit:            $##.#E##
    Breakeven Point:       #### weeks

%}

clear; clc; close all;

Materials={'Ash';'Hickory';'Maple';'Pine'}; %data given by the instructor

Cost=[4.35 4.95 6.35 3.75]; %data given by the instructor, material cost per 25 bats.

Per_bat_cost=Cost./25; %Per bat cost material.

LECost=1.25; % data given by the instructor. Labor and Energy cost per bat produced.

choice=menu('Select the Material for the bat.',Materials(:,1)); %choice menu for selecting material of bat

selling_price=input(sprintf('Enter the selling price of a single bat made from %s material:',Materials{choice,1})); % input for selling price

Manufact=input('\nEnter, as a vector, the total number of bats produce per \nweek (without upgrade) and the number of weeks the bat production in a year:'); %input as a vector as required by the textbook. 

upgrade=input('\nEnter as a vector, the number of additional bats produced \nper week (with upgrade), and the fix cost of upgrade:'); %input as a vector for upgrade as required by the textbook

Variable_Cost_perBat=Per_bat_cost(1,choice)+ LECost; %variable cost per bat including Labor and Energy Cost. Scalar value.

profit_noupgrade= (Manufact(1,1)*Manufact(1,2)*selling_price)-(Manufact(1,1)*Manufact(1,2)*LECost*Per_bat_cost(1,choice)); % profit with no upgrade. Scalar value

profit_upgrade= ((Manufact(1,1)+upgrade(1,1))*Manufact(1,2)*selling_price)-(((Manufact(1,1)+upgrade(1,1))*Manufact(1,2)*LECost*Per_bat_cost(1,choice))+upgrade(1,2)); %profit with upgrade. Scalar value.

%determining x(weeks) to find the breakeven point between Revenue and Investing(loss). This calculation accounts for only without upgrades. 
syms x1
eqn = (Manufact(1,1)*x1*selling_price)-(Manufact(1,1)*x1*LECost*Per_bat_cost(1,choice)) == 0;
solx = solve(eqn,x1);

%determining x(weeks) to find the breakeven point between Revenue and Investing(loss). This calculation accounts for only with upgrades. 
syms x
eqn = ((Manufact(1,1)+upgrade(1,1))*(x)*selling_price)-(((Manufact(1,1)+upgrade(1,1))*(x)*LECost*Per_bat_cost(1,choice))+upgrade(1,2)) == 0;
solx1 = solve(eqn,x);

%layout of the print solutions as outline in the textbook: 
fprintf('\nSelling Price per bat:\t\t\t\t$%0.2f\n',selling_price);
fprintf('Total Variable Cost per bat:\t\t$%0.2f\n',Variable_Cost_perBat);
fprintf('NO UPGRADE\n');
fprintf('Producting %d %s bats a week for %d weeks = %d total bats\n', Manufact(1,1), Materials{choice,1},Manufact(1,2),(Manufact(1,1)*Manufact(1,2)));
fprintf('\tProfit:\t\t\t\t\t\t\t$%0.1E\n',profit_noupgrade);
fprintf('WITH UPGRADE\n');
fprintf('Producting %d %s bats a week for %d weeks = %d total bats\n', (Manufact(1,1)+upgrade(1,1)), Materials{choice,1},Manufact(1,2),(Manufact(1,1)+upgrade(1,1))*Manufact(1,2));
fprintf('\tFixed Cost of upgrade:\t\t\t$%0.2f\n', upgrade(1,2));
fprintf('\tProfit:\t\t\t\t\t\t\t$%0.1E\n', profit_upgrade);
fprintf('\tBreakeven Point:\t\t\t\t%0.0f weeks\n',solx1);

%Proper plot for the number of weeks bats vs. Revenue/total cost. 

x2=(0:1:52); %(weeks, starting 0, ending 52, increment 1)

y1=((Manufact(1,1)+upgrade(1,1))*(x2)*selling_price); %yplot for revenue-with upgrade
y2=-(((Manufact(1,1)+upgrade(1,1))*(x2)*LECost*Per_bat_cost(1,choice))+upgrade(1,2)); %yplot for investing(loss)-with upgrade
y3= (Manufact(1,1)*x2*selling_price); %yplot for revenue-without upgrade
y4=-(Manufact(1,1)*x2*LECost*Per_bat_cost(1,choice));%yplot for investing(loss)-without upgrade

%generating a plot for with upgrade and without upgrade

figure('color','white');
plot(x2,y1,':r','LineWidth',3);
hold on;
plot(x2,y2,'-k','LineWidth',3);
hold on;
plot(x2,y3,':b','LineWidth',3);
hold on;
plot(x2,y4,'-g','LineWidth',3);

line([solx solx], [0 (Manufact(1,1)*Manufact(1,2)*LECost*Per_bat_cost(1,choice))]);
line([solx1 solx1], [0 (((Manufact(1,1)+upgrade(1,1))*Manufact(1,2)*LECost*Per_bat_cost(1,choice))+upgrade(1,2))]);

grid on;

xlabel('Number of weeks[#]bats');
ylabel('Revenue and total cost in dollars[$]');
title(sprintf('Plot curve in production of %s bats per annum.',Materials{choice,1}));
legend('Revenue-upgrade','Total Cost-upgrade','Revenue-no upgrade','Total Cost-no upgrade','Location','NW');



