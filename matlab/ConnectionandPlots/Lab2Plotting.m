load('RPMvalues.mat')
V1=0:.1:5; V2=0:.1:4.9; V3=0.1:.1:5;
V=[V1,fliplr(V2),V3];
for i= 1:length(f)
    if f(:,i)>500
        f(:,i)=0;
    end
end
rpmf=2*f;
rpmf(:,(90:110))=0;

%plot(1:length(V),rpmf)
%hold on
%plot(1:length(V),rpmpc)
[b1,m1,r1]=LinearRegression(V(15:51),rpmf(15:51));
[b2,m2,r2]=LinearRegression(V(52:87),rpmf(52:87));
[b3,m3,r3]=LinearRegression(V(114:151),rpmf(114:151));

[b1c,m1c,r1c]=LinearRegression(V(15:51),rpmpc(15:51));
[b2c,m2c,r2c]=LinearRegression(V(52:87),rpmpc(52:87));
[b3c,m3c,r3c]=LinearRegression(V(114:151),rpmpc(114:151));


firstspliceF=m1*V(1:51)+b1;
secondspliceF=m2*V(52:101)+b2;
thirdspliceF=m3*V(102:151)+b3;
FullF=[firstspliceF,secondspliceF,thirdspliceF];

firstspliceC=m1c*V(1:51)+b1c;
secondspliceC=m2c*V(52:101)+b2c;
thirdspliceC=m3c*V(102:151)+b3c;
FullC=[firstspliceC,secondspliceC,thirdspliceC];

figure
plot(1:length(V),rpmf)
hold on
plot(1:length(V),FullF)
legend('Pulse Frequency','Linear Regression')
xlabel('Point per Voltage in 0.1 V increments')
ylabel('RPM')
title('RPM vs Voltage based on Frequency')

figure
plot(1:length(V),rpmpc)
hold on
plot(1:length(V),FullC)
legend('Counter Approach','Linear Regression')
xlabel('Point per Voltage in 0.1 V increments')
ylabel('RPM')
title('RPM vs Voltage based on Pulse Count')

figure
plot(1:length(V),rpmpc)
hold on
plot(1:length(V),rpmf)
legend('Counter Approach','Pulse Frequency')
xlabel('Point per Voltage in 0.1 V increments')
ylabel('RPM')
title('RPM vs Voltage Both Methods')

