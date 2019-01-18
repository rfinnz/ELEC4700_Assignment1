%Author: Richard Finney 100967048


%1. Electron Modelling (40)
% Model the electrons in the silicon as particles with the effective mass above using a simplistic
% Monte-Carlo model.

%Effective mass of electrons mn = 0.26m0 where m0 is the rest mass.

%The nominal size of the region is 200nm × 100nm

%1. What is the thermal velocity vth? Assume T = 300K.

T = 300     %temperature in Kelvin
t = 0.2     %mean time in ps 

numelec = 10
x0 = randn(200, numelec, 0)       %inital x position of particles
y0 = randn(100, numelec, 0)       %inital y position of particles
a0 = randn(360, numelec, 1)       %inital angle of particle trajectory

