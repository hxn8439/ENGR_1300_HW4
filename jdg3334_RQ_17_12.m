%James Grumbles ENGR1300.001 7/26/2018
%Problem Statement: Write a program to help analyze
%different diversification scenario's for a baseball bat
%manufacturer
%
%Provided Variables
%Materials-list of materials
%Cost-estimated production cost of each material
%LECost-labor and energy cost

clear
clc
close all

%Instructor Given Values
Materials={'Ash';'Hickory';'Maple';'Pine'};
Cost=[4.35 4.95 6.35 3.75]; %cost per 25 bats of each material type
LECost=1.25; %labor cost to produce one bat regardless of material

Cost_Per_Bat=Cost./25; %calculating the cost per individual bat

%Input values
Choice=menu('Select bat material',Materials{:,1});
Sale_Per_Bat=input(['Enter the selling price of one ' Materials{Choice,1} ' bat:']);
Production=input('Enter the total number of bats per week without an upgrade and total run in weeks for the year [Bats Weeks]:');
Extra_Fixed=input('Enter the additional number of bats per week if upgraded and the fixed cost for the upgrade [Bats Cost]');
Variable_Cost=Cost_Per_Bat(1,Choice)+LECost; %variable cost per bat

%Calculate values for no upgrade output
Total_Bats=Production(1,1).*Production(1,2);
Profit=Sale_Per_Bat*Total_Bats-Variable_Cost;

%Calculate values for upgraded output
U_Weekly_Bats=Production(1,1)+Extra_Fixed(1,1);
U_Total_Bats=U_Weekly_Bats.*Production(1,2);
U_Profit=Sale_Per_Bat*U_Total_Bats-Variable_Cost-Extra_Fixed(1,2);
Breakeven=Extra_Fixed(1,2)./((Sale_Per_Bat-Variable_Cost)*U_Weekly_Bats);

%Base Output
fprintf('Selling Price per bat:\t\t\t\t $%2.2f\n',Sale_Per_Bat);
fprintf('Total Variable Cost per bat:\t\t $%2.2f\n\n',Variable_Cost);

%No Upgrade Output
fprintf('NO UPGRADE\n');
fprintf('Producing %2.0f %s bats a week for %2.0f weeks = %2.0f total bats\n',Production(1,1),Materials{Choice,1},Production(1,2),Total_Bats);
fprintf('\t\tProfit:\t\t\t\t\t\t $%2.1e\n\n',Profit);

%Upgraded Output
fprintf('WITH UPGRADE\n');
fprintf('Producing %2.0f %s bats a week for %2.0f weeks - %2.0f total bats\n',U_Weekly_Bats,Materials{Choice,1},Production(1,2),U_Total_Bats);
fprintf('\t\tFixed Cost of upgrade:\t\t $%2.2f\n',Extra_Fixed(1,2));
fprintf('\t\tProfit:\t\t\t\t\t\t $%2.1e\n',U_Profit);
fprintf('\t\tBreakeven Point:\t\t   %4.0f weeks\n',Breakeven);

%Calculate values needed for plots
plot_weeks=(0:1:52);
Cost_Curve=Variable_Cost*Production(1,1)*plot_weeks;
Revenue=Sale_Per_Bat*Production(1,1)*plot_weeks;
U_Cost_Curve=Variable_Cost*U_Weekly_Bats*plot_weeks+Extra_Fixed(1,2);
U_Revenue=Sale_Per_Bat*U_Weekly_Bats*plot_weeks;
BreakevenY=(Sale_Per_Bat*U_Weekly_Bats)*Breakeven;

plot(plot_weeks,Cost_Curve,plot_weeks,Revenue,plot_weeks,U_Cost_Curve,plot_weeks,U_Revenue);
hold on;
plot([Breakeven,Breakeven],[0,BreakevenY],'color','k','linewidth',2);
grid on;
legend('Cost','Revenue','Upgraded Cost','Upgraded Revenue','Breakeven','location','northwest');
xlabel('Number of Weeks (#)');
ylabel('Revenue and Total Cost ($)');
title([Materials{Choice,1},' Baseball Bats']);