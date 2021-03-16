clc;clear all;close all;
%% Load
load('section063Mak_Hoque')

%% Part A
% Vman=0:10;
% Iman=[0,.471,.941,1.47,1.96,2.45,2.95,3.44,3.93,4.43,4.9];
R_est=sum(Vman.^2)/sum(Vman.*Iman);
figure
plot(Vman,Iman*1000,'o','MarkerFaceColor','b')
xlabel('Voltage (V)')
ylabel('Current (mA)')
title(['Estimated Resistance: ' num2str(R_est) '\Omega'])
grid on
hold on
[a0,a1,r2]=LinearRegression(Vman,Iman);

fit=a1*Vman;
plot(Vman,fit*1000)
hold off


%% Part B

% Estimate Resistor Value
R_est=sum(Vmeas.^2)/sum(Vmeas.*Imeas);

figure
plot(Vmeas,Imeas*1000,'o','MarkerFaceColor','b')
xlabel('Voltage (V)')
ylabel('Current (mA)')
title(['Estimated Resistance: ' num2str(R_est) '\Omega'])
grid on
hold on
[a0,a1,r2]=LinearRegression(Vmeas,Imeas);

fit=a1*Vmeas;
plot(Vmeas,fit*1000)

hold off
%% Part C
period=[];
ontime=[];
n=length(f(1,:));
%ideal
ontimeis=[]
fis=1/1426; %estimated

for i=1:n
    favg=sum(f(1,:))/n;
    period(:,i)=1/favg;
    ontime(:,i)=(dutycycle(i)/100)*period(i);
    ontimeis(:,i)=(dutycycle(i)/100)*fis;
    
end
figure
plot(dutycycle,ontime,'o-','MarkerFaceColor','r')
hold on
grid on
plot(dutycycle,ontimeis,'o-','MarkerFaceColor','b')

xlabel('Duty Cycle (%)')
ylabel('On-Time (s)')
title('On-time Vs Duty Cycle')
legend('ideal','estimate')





