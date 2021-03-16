%out4 = instrhwinfo("visa","agilent","usb");

 scope=visa('agilent', 'USB0::0x0957::0x1799::MY58100818::0::INSTR');%' - scope
 awg=visa('agilent', 'USB0::0x0957::0x0407::MY44043483::0::INSTR');%'} - AWG
 DMM=visa('agilent', 'USB0::0x2A8D::0xB318::MY58160107::0::INSTR');%'} - DMM

 fopen(awg);
fopen(scope);

V_min=0;
V_max = 5;
N_volts= .1; 
fprintf(awg,'OUTP:LOAD INF'); %Sets HIGH Z
V1=0:.1:5; V2=0:.1:4.9; V3=0.1:.1:5;
V=[V1,fliplr(V2),V3];
a=serial('COM58','BaudRate',9600);
fopen(a);
countpulse=[];
f=[];
for K=1:length(V)
str1=['APPL:DC DEF,DEF,' num2str(V(K))];
fprintf(awg,str1); % Apply DC Voltage Output from AWG

pause(5) 
%Arduino output
flushinput(a)
countpulse(:,K) = str2double(fscanf(a));
%saving frequency from oscope
f(:,K)=str2double(query(scope,':MEAS:FREQUENCY?'));

end
%divide by 30 (30 holes on the pulse counter) and multiple by 60 ( 60
%seconds to a minute)

%rpm calculations

rpmpc=2*countpulse;

%getting rid of bad values in data
for i= 1:length(f)
    if f(:,i)>500
        f(:,i)=0;
    end
end


rpmf=2*f;
rpmf(:,(90:110))=0;

plot(1:length(V),rpmf)
hold on
plot(1:length(V),rpmpc)

fclose(a);
fclose(awg);
fclose(scope);
delete(awg);
delete(scope);
delete(a);


