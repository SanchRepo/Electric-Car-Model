function [ A,B,r2 ] = ExponentialFit( x,y )

n=length(x);
xsum=0;
xsumsq=0;
lnysum=0;
xlnysum=0;
ysum=0;
for i = 1:n
    xsum = x(i) + xsum;
    ysum = y(1) + ysum;
    xsumsq = x(i)^2+xsumsq;   
    lnysum = log(y(i)) + lnysum;
%     lnysumsq = y(i)^2+lnysumsq;
    xlnysum = x(i)*log(y(i))+xlnysum;    
end   

xsum2=xsum^2;
a=((lnysum*xsumsq)-(xsum*xlnysum))/((n*xsumsq)-xsum2);

b=((n*xlnysum)-(xsum*lnysum))/((n*xsumsq)-xsum2);

A=exp(a);
B=b;

xmean = xsum/n;
ymean = ysum/n;
SSx=0;
SSy=0;
SSxy=0;

for i = 1:n
%     Sr=(y(i)-B-(a*x(i)))^2+Sr;
%     St=(y(i)-ymean)^2+St;
SSx = (x(i)-xmean)^2+SSx;
SSy = (y(i)-ymean)^2+SSy;
SSxy = ((x(i)-xmean)*(y(i)-ymean))+SSxy;


end
r2=1-((SSxy^2)/(SSx*SSy));

end

x=[0.7,1.2,2.1,3.2,5.8];
y=[7.0,5.0,3.0,2.0,1.0];

% A=8.54095
% B=-4.169e-1
y2=A*exp(B*x)

plot(x,y,'o','MarkerFaceColor','b')
hold on
plot(x,y2)