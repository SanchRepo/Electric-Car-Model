clc;clear all;close all;
%% Load
load('section063Mak_Hoque')
dt = 1e-6

%% Part A
% Vman=0:10;
% Iman=[0,.471,.941,1.47,1.96,2.45,2.95,3.44,3.93,4.43,4.9];
R_est=sum(Vman.^2)/sum(Vman.*Iman);
figure
plot(Vman,Iman*1000,'o','MarkerFaceColor','b')
xlabel('Voltage (V)')
ylabel('Current (mA)')
title(['Estimated Resistance: ' num2str(R_est) 'K\Omega'])
grid on
hold on
% [a0,a1,r2]=LinearRegression(Vman,Iman);
a1 = ThroughOriginLinearRegression(Vman,Iman);
fit=a1*Vman;
plot(Vman,fit*1000)
%
txt1 = ['y = (' num2str(a1) ')x'];
xl = xlim;
yl = ylim;
xt = 0.05 * (xl(2)-xl(1)) + xl(1);
yt = 0.90 * (yl(2)-yl(1)) + yl(1);
text(xt, yt, txt1, 'FontSize', 16, 'Color', 'r', 'FontWeight', 'bold');
%
hold off


%% Part B
%%%%%%Have to multiply this current Imeas data by another factor of 1000
%%%%%%for some reason

%Imeas=Imeas*1000;
% Estimate Resistor Value
R_est=sum(Vmeas.^2)/sum(Vmeas.*Imeas);

figure
plot(Vmeas,Imeas*1000,'o','MarkerFaceColor','b')
xlabel('Voltage (V)')
ylabel('Current (mA)')
title(['Estimated Resistance: ' num2str(R_est) 'K\Omega'])
grid on
hold on
% [a0,a1,r2]=LinearRegression(Vmeas,Imeas);
a1 = ThroughOriginLinearRegression(Vmeas,Imeas);
fit=a1*Vmeas;
plot(Vmeas,fit*1000)
%
txt2 = ['y = (' num2str(a1) ')x'];
xl = xlim;
yl = ylim;
xt = 0.05 * (xl(2)-xl(1)) + xl(1);
yt = 0.90 * (yl(2)-yl(1)) + yl(1);
text(xt, yt, txt2, 'FontSize', 16, 'Color', 'r', 'FontWeight', 'bold');
%
hold off
%% Part C
period=[];
ontime=[];
n=length(f(1,:));
%ideal
ontimeis=[]
fis=1/1426; %estimated
counter=1;
count1=zeros(25,1);


for i = 1: length(data_volts(1,:))
    counter=1;
   for j = 170: length(data_volts(:,1))
       
       if data_volts(j,i)> 2.5 && counter ==1 
        count1(i)=count1(i)+1;
        if data_volts(j+1,i)<0
            counter=0;
            
        end
       
      
       end
   end
end


for i=1:n
    favg=sum(f(1,:))/n;
    period(:,i)=1/favg;
    ontime(:,i)=(dutycycle(i)/100)*period(i);
    %ontimeis(:,i)=(dutycycle(i)/100)*fis;
    ontimeis(:,i)=dt*count1(i); 
    
    
    
    
end
figure 
plot(dutycycle,ontime,'-s','MarkerFaceColor','r')
hold on
grid on
plot(dutycycle,ontimeis,'o-','MarkerFaceColor','b')

xlabel('Duty Cycle (%)')
ylabel('On-Time (s)')
title('On-time Vs Duty Cycle')
legend('ideal','estimate')





