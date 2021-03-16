%out4 = instrhwinfo("visa","agilent","usb");

scope=visa('agilent', 'USB0::0x0957::0x1799::MY58100815::0::INSTR');%' - scope
%awg=visa('agilent', 'USB0::0x0957::0x0407::MY44043483::0::INSTR');%'} - AWG
DMM=visa('agilent', 'USB0::0x2A8D::0xB318::MY58170030::0::INSTR');%'} - DMM
fopen(DMM);
fopen(scope);
V=[];
C=[];
i=0;
while true 
i=i+1;    
%Curr=fprintf(DMM,'MEAS[:PRIM]:CURR[:DC]?');
pause(1);
V(:,i)=str2double(query(scope,':MEAS:VMAX?'));
C(:,i)=str2double(query(DMM,'MEAS:CURR?'));
%Volt=fprintf(DMM,'MEAS:VOLT?');
if V(:,i)<4.8
    break;
end
end
fclose(DMM);
fclose(scope);
delete(DMM);
delete(scope);



