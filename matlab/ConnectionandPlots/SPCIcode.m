%Consider the Agilent 33120A arbitrary waveform generator (AWG). Write the SCPI commands
%that will
%(a) Generate a triangular waveform of 500 Hz, peak voltage of 8 Volts, and an offset of 0.5 V.
%(b) Query the AWG to determine the duty cycle of a square wave signal.
%(c) Reset the function generator to its default state.
%(d) Set the AWG output termination to 50 ?.
%(e) Clear the status of the AWG.


close all;clear all;clc

% Inputs

awg=visa('agilent', 'USB0::0x0957::0x0407::MY44043476::0::INSTR');
fopen(awg);
fprintf(awg,'OUTP:LOAD INF'); % Place waveform generator into high-Z

% a.
% fprintf(awg,'APPL:TRI 500 HZ, 8.0 VPP, 0.5 V');
% b.
fprintf(awg,'APPL:SQU');
%fprintf(awg,'APPL:PULS:DCYCl 50');

dutyC = fprintf('PULS:DCYCL?');
dutyC=str2double(query(awg,'PULS:DCYCL?'));

% V=linspace(V_min,V_max,N_volts);
% Imeas=zeros(1,N_volts);
% for K=1:N_volts
% str1=['APPL:DC DEF,DEF,' num2str(V(K))];
% fprintf(awg,str1); % Apply DC Voltage Output from AWG
% pause(1)
% end

fclose(awg);
delete(awg)


%out4 = instrhwinfo('visa','agilent','usb');
%out4.ObjectConstructorName












