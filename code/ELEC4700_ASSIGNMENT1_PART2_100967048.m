%% ELEC 4700 Monte-Carlo Modeling of Electron Transport

%% Part 2: Collisions with Mean Free Path (MFP) 
%  The puepose of this code is to model the electrons in the silicon as particles 
%  with the effective mass above using a simplistic Monte-Carlo model.
%In Part 2 I added in scattering 


%Author: Richard Finney 100967048
clear all;
close all;

%Constants 

q_0 = 1.60217653e-19;             % electron charge
m_0 = 9.10938215e-31;             % electron mass
kB = 1.3806504e-23;               % Boltzmann constant
deltat = 0.2e-12;                 % mean time between collisions 
mn = 0.26*m_0;                    % effective mass of electrons



%variables

numofelec = 25;             %current numbers of electrons t be simulated
T = 300;                      %temperature in kelvin

dt = 1;
%Assign each particle with the fixed velocity given by vth but give each one a
%random direction.

vth = sqrt((kB*T)/mn);
%Spatial Boundaries

Length = 200;
Width = 100;


    %I am going to represent the location of each electron using vectors
    
x = randi([0 Length], 1, numofelec)*1e-9;       %initializing x
y = randi([0 Width], 1, numofelec)*1e-9;        %initializing y
    
    %now we have position vectors for the x and y positions of each
    %electron. Need to create vectors for vy and vx. Remember that each
    %electron has a rand angle to start with, but same velocity vth.

angles = randi([0 360], 1, numofelec);
v_x = zeros(1, numofelec);
v_y = zeros(1, numofelec);

v_x = vth*cos(angles);
v_y = vth*sin(angles);

figure(1)
hist(v_x,100);
title('x axis component of v thermal');

figure(2)
hist(v_y,100);
title('y axis component of v thermal');

    %scatter
    pscat = 1 - exp(-1e-14/(1e-12*0.2));
    pscatvector = ones(1,numofelec)*pscat;
    
    %wil be used to make electrons different colors
    colorarray= rand(1,numofelec);
for time= 1:dt:1000

    random = rand(1,numofelec);
    
    %all electrons with higher probabilities
    new = random < pscat;
    
    %all electrons with lower probabilities
    new2 = random >= pscat;
    

    rand_v_x = zeros(1,numofelec);
    rand_v_y = zeros(1,numofelec);
    
   for i = 1:1:numofelec
     r1 = randi([1 numofelec], 1,1);
     r2 = randi([1 numofelec], 1,1);
        rand_v_x(1,i) = v_x(1,r1);
        rand_v_y(1,i) = v_y(1,r2);
   end
        %all electrons with lower probabilities will stay the same
   v_x = v_x.*new2;
   v_y = v_y.*new2;
   
   rand_v_x=rand_v_x.*new;
   rand_v_y=rand_v_y.*new;
    
   v_x = v_x+rand_v_x;
   v_y = v_y+rand_v_y;
    
    %
    dx = v_x*dt*1e-15*5;
    dy = v_y*dt*1e-15*5;
    
    x = x + dx;
    y = y + dy;
    
    %if y is greater than 200
    temp = y>=Width*1e-9;
    temp1 = y<Width*1e-9;
    
    temp = temp*(-1);
    
    temphigher = temp + temp1;
    
    v_y = temphigher.*v_y;
    
     %if y is less than 100
    temp2 = y>=0;
    temp3 = y<0;
    
    temp3 = temp3*(-1);
    templower = temp3 + temp2;
    v_y = templower.*v_y;
    
  
   
 %if x greater than 200
   temp5 = x<200*1e-9;
   
   x = x .* temp5;
   
   %if x is less than 0
   temp4 = x< 0;
   temp4 = temp4*200*1e-9;
   
   %temp4 = temp4*200*1e-9;
   x = x + temp4;
   
    %average thermal velocity
    v_avg = mean(sqrt((v_x.^2)+(v_y.^2)));
    T_avg = (mn*(v_avg^2))/kB;
    
    
    %mean free path 
    
    mfp = (10^-15)*(v_avg);
    
    figure(3)
    scatter(x,y,3,colorarray);
    axis([0 200*10^-9 0 100*10^-9])
    title(['The mean free path is ', num2str(mfp)]);
   % pause(0.000000000000000000000000000000000000000001)
    hold on
    
    figure(4)
    plot(time,T_avg,'.b')
    title(['The Average Temperature is ', num2str(T_avg)]);
    axis([0 1000 0 500])
    hold on
    
    %average thermal velocity
   
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
%               END OF PART 2            %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


