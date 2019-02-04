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

numofelec = 100;             %current numbers of electrons t be simulated
T = 300;                    %temperature in kelvin

dt = 1;
%Assign each particle with the fixed velocity given by vth but give each one a
%random direction.

vth = sqrt((kB*T)/mn);
%Spatial Boundaries

Length = 200;
Width = 100;
    
x = randi([0 Length], 1, numofelec)*1e-9;       %initializing x
y = randi([0 Width], 1, numofelec)*1e-9;        %initializing y

elecpos = [x;y];
previous=zeros(2,numofelec);
    
    %now we have position vectors for the x and y positions of each
    %electron. Need to create vectors for vy and vx. Remember that each
    %electron has a rand angle to start with, but same velocity vth.

angles = randi([0 360], 1, numofelec);
v_x = zeros(1, numofelec);
v_y = zeros(1, numofelec);

v_x = vth*cos(angles);
v_y = vth*sin(angles);

colorarray= rand(1,numofelec)
for time= 1:dt:1000
previous = [x',y']
    dx = v_x*dt*1e-15;
    dy = v_y*dt*1e-15;
    
    x = x + dx;
    y = y + dy;
    
    %if y is greater than 200
    temp = y>=Width*1e-9;
    temp1 = y<Width*1e-9;
    
    temp = temp*(-1);
    
    temphigher = temp + temp1;
    
    v_y = temphigher.*v_y;
    
     %if y is less than 100
    temp2 = y>=0
    temp3 = y<0
    
    temp3 = temp3*(-1);
    templower = temp3 + temp2;
    v_y = templower.*v_y;
    
  
   
 %if x greater than 200
   temp5 = x<200*1e-9;
   
   x = x .* temp5;
   
   %if x is less than 0
   temp4 = x< -0.1;
   temp4 = temp4*200*1e-9;
   
   %temp4 = temp4*200*1e-9;
   x = x + temp4;
   
    %average thermal velocity
    v_avg = mean(sqrt((v_x.^2)+(v_y.^2)));
    T_avg = (mn*(v_avg^2))/kB;
    
    %mean free path 
    
    mfp = (10^-12)*(v_avg);
    
    
    figure(3)
    scatter(x,y,3,colorarray);
    axis([0 200*10^-9 0 100*10^-9])
    title(['The mean free path is ', num2str(mfp)]);
   % pause(0.000000000000000000000000000000000000000001)
    hold on
    
    figure(4)
    plot(time,T_avg,'.b')
    title(['The Average Temperature is ', num2str(T_avg)]);
    axis([0 500 0 500])
    hold on
    
    end

    
    
    
    



