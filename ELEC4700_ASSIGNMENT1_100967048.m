%Author: Richard Finney 100967048


%1. Electron Modelling (40)
% Model the electrons in the silicon as particles with the effective mass above using a simplistic
% Monte-Carlo model.

%Effective mass of electrons mn = 0.26m0 where m0 is the rest mass.

%The nominal size of the region is 200nm × 100nm

%1. What is the thermal velocity vth? Assume T = 300K.

%Constants 

q_0 = 1.60217653e-19;             % electron charge
m_0 = 9.10938215e-31;             % electron mass
kB = 1.3806504e-23;               % Boltzmann constant
deltat = 0.2e-12;                 % mean time between collisions 
mn = 0.26*m_0;                    % effective mass of electrons



%variables

numofelec = 10;             %current numbers of electrons t be simulated
T = 300;                    %temperature in kelvin


%Assign each particle with the fixed velocity given by vth but give each one a
%random direction.

vth = sqrt((kB*T)/mn);
%Spatial Boundaries

Length = 200;
Width = 100;

%i will be represting the electrons as a vector of its px,py,vx,xy
electrons = zeros(numofelec, 4);

    %I am going to represent the location of each electron using vectors
    
electrons(:,1) = randi([0 Length], 1, numofelec)*1e-9;       %initializing x
electrons(:,2) = randi([0 Width], 1, numofelec)*1e-9;        %initializing y
    
    %now we have position vectors for the x and y positions of each
    %electron. Need to create vectors for vy and vx. Remember that each
    %electron has a rand angle to start with, but same velocity vth.

angles = randi([0 360], 1, numofelec);
v_x = zeros(1, numofelec);
v_y = zeros(1, numofelec);
    
    %now do a loop to fill in these matricies
    
    for i =1:1:numofelec
        v_x(1,i) = vth*cos(angles(1,i));
        v_y(1,i) = vth*sin(angles(1,i));
    end
    
electrons(:,3) = v_x;
electrons(:,4) = v_y;
    
     
    %note that the spatial steps should be smaller than 1/100 of the region
    %size

%for  time = 1:1:1000
    
 %   for c=1:1:numofelec
  %  plot(x(1,c),y(1,c));
   % axis([0 200*10^-9 0 100*10^-9])
    %hold on
    %pause(0.5)
    %end
    
    
    
    
    
%end

%Assign each particle a random location in the x?y plane within the region defined
%by the extent of the Silicon.


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Code in progress%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%T = 300     %temperature in Kelvin
%t = 0.2     %mean time in ps 

%numelec = 10
%x0 = randn(200, numelec, 0)       %inital x position of particles
%y0 = randn(100, numelec, 0)       %inital y position of particles
%a0 = randn(360, numelec, 1)       %inital angle of particle trajectory
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Code in progress%%%%%%%%%%%%%%%%%%%%%%%%%%%%


