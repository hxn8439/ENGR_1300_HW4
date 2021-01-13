% Hamilton Nguyen Engr 1300.001 7/16/2018

%{
 Problem Statement:

The specific gravity of acetic acid(vineger) is 1.049. Write a MATLAB
program to display the density of acetic acid in units of pounds-mass per
cubic foot, grams per cubic centimeter, kilograms per cubic meter, and
slugs per liter. Incorporate each value into a sentence with appropriate
per text, each sentence on a new line. All numeric values should be given
to two decimal places.

 Known Variable: SG=1.049, 1[kg]=2.205[lbm], 1[mL]=1[cm^3], 1[m^3]=1000L,
 1L=0.0353[ft^3]. density_water=1000[kg]/[m^3]= 1[g]/[cm^3],
 1[slug]=32.2[lbm]

 Unknown Variables: Not available.
 Assumption: None.
 Equations: density_acetic_acid=(SG)*density_water([kg]/[m^3])
 Case Scenario: input S.G. 1.049 and convert for the following units as
 stated. 

%}

clear; clc; 

SG=1.049; %specific gravity of acetic acid
density_water=1000; %density of water in [kg]/[m^3]

density_acetic_acid=(SG)*density_water; %density of acetic acid in [kg]/[m^3]

%converting [kg]/[m^3] to [g/cm^3], use 1[kg]=1000[g], 1[m^3]=(1*10^6)[cm^3]
conversion1= density_acetic_acid*(1000)*(1/(1*10^6)); %[g/cm^3]

%converting [g/cm^3] to [lbm/ft^3], use 1[L]=1000[mL], 1[L]=0.0353[ft^3], 1[kg]=2.205[lbm],1[cm^3]=1[mL], and 1[kg]=1000[g] 
conversion2= conversion1*(1)*(1000)*(1/0.0353)*(1/1000)*(2.205);

%converting [g/cm^3] to [slug/L], use 1[slug]=32.2[lbm],  1[kg]=1000[g],
%1[L]=1000[mL], 1[cm^3]=1[mL], 1[kg]=2.205[lbm]
conversion3= conversion1*(1)*(1000)*(1/1000)*(2.205)*(1/32.2);

%print solution for conversion values, refer below
fprintf("density of acetic acid is %0.2f [lbm/ft^3]\n",conversion2);
fprintf("density of acetic acid is %0.2f [g/cm^3]\n",conversion1);
fprintf("density of acetic acid is %0.2f [kg/m^3]\n", density_acetic_acid);
fprintf("density of acetic acid is %0.2f [slug/L]\n",conversion3);
