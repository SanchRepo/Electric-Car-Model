load('DischargeData.mat')
C1 = C*-1;
V1=V;
P1 = C1.*V1;
time1 = 1:3:3*length(V1); %times by 3 to make it "seconds"

load('DischargeDataSHITBATTERY.mat')
C2 = C*1;
V2=V;
P2 = C2.*V2;
time2 = 1:3:3*length(V2); %times by 3 to make it "seconds"

cumEnergy1=[];
cumEnergy2=[];
preCum=0;
for K=1:length(P1)
    Energy1 = P1(K)*time1(K);
    
    cumEnergy1(:,K) = preCum + Energy1;
    preCum=cumEnergy1(:,K);
end
preCum=0;
for K=1:length(P2)
    Energy2 = P2(K)*time2(K);
    
    cumEnergy2(:,K) = preCum + Energy2;
    preCum=cumEnergy2(:,K);
end
figure
plot(time1,V1)
hold on
plot(time2,V2)
ylabel('Voltage (V)')
xlabel('Time (s)')
title('Voltage vs Time')
legend('Duracell', 'KitBattery')

figure
plot(time1,C1)
hold on
plot(time2,C2)
ylabel('Current (mA)')
xlabel('Time (s)')
title('Current vs Time')
legend('Duracell', 'KitBattery')

figure
plot(time1,P1)
hold on
plot(time2,P2)
ylabel('Power (Watts)')
xlabel('Time (s)')
title('Power vs Time')
legend('Duracell', 'KitBattery')


figure
plot(time1,cumEnergy1)
hold on
plot(time2,cumEnergy2)
ylabel('Cumulative Energy (J)')
xlabel('Time (s)')
title('Cumulative Energy vs Time')
legend('Duracell', 'KitBattery')


