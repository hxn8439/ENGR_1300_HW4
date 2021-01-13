% Hamilton Nguyen Engr 1300.001 7/16/2018

%{
 Problem Statement: In a factory, various metal rods are forged and then
 plunged into a liquid to quickly cool the metal. The types of metal
 produced as well as their specific heat capacity are listed in the Table
 A. refer textbook. 

The metal rods may vary in mass and production (initial) temperature. The
ideal process lowers the temperature of the material to 50 degrees Celsius
[C]. The liquid used to cool the metal is glycerol. The properties of
glycerol are listed below. Initially, the glycerol is at room temperature,
assumed to be 75 degrees Fahrenheit [F]. Write a program containing the
following elements:
 
 Known Variable: C_p[Cadmium]=231 [J/(kg*K)],SG[glycerol]=1.261,  C_p[glycerol]=2400 [J/(kg*K)] 
 Unknown Variable: determine the [gals] glycerol needed to cool the Cadmium metal. 
 Assumption: t_i[glycerol]=75[F], t_f[material]=50[C].
 Equations: Q=M*C_p*delta_T, T[F]=T[C]1.8+32, K=T[C]+273
 Case Scenario:
Ask the user to enter the material name and specific heat information that
they would like to use.  You may assume that the user will choose one of the 
materials in Table A.  Both these items should be stored in a 1 X 2 cell array.
You may use more than one line to accomplish this task
Ask the user to enter a 1 X 2 vector containing first the mass in grams [g] and 
second the initial temperature in degrees Celsius [0C] of the material the user entered in the first step.
Calculate the thermal energy, in Joules [J], that must be removed from the
 material and then determine the volume of glycerol needed, in units of gallons
 [gal], to cool the rod to 50 degrees Celsius. You may use the properties of glycerol listed in Table B.
Write an output statement or set of statements to the user similar to the final
 output shown below. The numerical formats should match exactly as shown.
 Please note the bold information is what the user will enter.

Output format:

Enter name of the material: Cadmium

Enter the specific heat [J/(kg K)]: 231

Enter the mass [g] and initial temperature [deg C] of the material as a 1 x 2 matrix [m T]: [4000 300]

For the 4.0 kg Cadmium rod with an initial temperature of 300 deg C
        Energy removed [J]         2.3e+05
        Glycerol Volume [gal]      0.81

Please do NOT attempt to write functions.
%}

clear; clc; 

material=input('Enter name of the material:','s');
specific_heat=input('\nEnter the specific heat [J/(kg K)]:');
Mass_initialT= input('\nEnter the mass [g] and initial temperature [deg C] of the material as a 1 x 2 matrix [m T]:');

input1={material specific_heat};
input2=Mass_initialT;

C_p=2400; %[J/(kg*K)], specific heat of glycerol 
T_f=50;%degrees [C]
SG=1.261; %specific gravity of glycerol
density_water=1000; %[kg/m^3]

%converting T_f[C] to [K]
T_f_k=T_f+273;

%converting user input [g] to [kg]
convertM=Mass_initialT(1)/1000;

%converting user input T_i[C] to [K]
convertT=Mass_initialT(2)+273;

%calculating Thermal Energy
Q_metal=convertM*specific_heat*(T_f_k-convertT); %[J]

%convert to Thermal Energy value into a positive Scalar value 
Q_metal_scalar=Q_metal*-1; %[J]

ideal_T= 75; %degrees Fahrenheit [F] for glycerol

%convert ideal T[F] to [K] for glycerol
convert_ideal_T=((ideal_T-32)/1.8)+273; %[K]

%find glycerol mass when thermal energy is transferred into it. 
mass_glycerol=(Q_metal_scalar)/(C_p*(T_f_k-convert_ideal_T)); %[kg]

density_glycerol=SG*density_water; %[kg/m^3] density of glycerol
volume_glycerol=mass_glycerol/density_glycerol; %[m^3]

%converting volume [m^3] to [L] then to [gal]
convert_volume_glycerol=volume_glycerol*(1000)*0.264; %[gal]

%Print out solution according to the case scenario.
fprintf('\nFor the %0.1f kg %s rod with an initial temperature of %d deg C\n\tEnergy removed [J]\t\t%0.1e\n\tGlycerol Volume [gal]\t%0.2f\n',convertM,input1{1},input2(2),Q_metal_scalar,convert_volume_glycerol);