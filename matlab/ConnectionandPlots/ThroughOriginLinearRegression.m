function [ a1,r2 ] = ThroughOriginLinearRegression(x,y)

n=length(x);
xsum=0;
xsumsq=0;
ysum=0;
ysumsq=0;
xysum=0;

for i = 1:n
    xsum = x(i) + xsum;
    xsumsq = x(i)^2+xsumsq;   
    ysum = y(i) + ysum;
    ysumsq = y(i)^2+ysumsq;
    xysum = x(i)*y(i)+xysum;    
end    
xmean = xsum/n;
ymean = ysum/n;
a1=(xysum)/(xsumsq);
a0=ymean-a1*xmean;
Sr=0;
St=0;
for i = 1:n
    Sr=(y(i)-a0-(a1*x(i)))^2+Sr;
    St=(y(i)-ymean)^2+St;
end
r2=(St-Sr)/St;
%r=sqrt(r2);
end
% x=[1,2,3,4,5,6,7];
% y=[.5,2.5,2,4,3.5,6,5.5];