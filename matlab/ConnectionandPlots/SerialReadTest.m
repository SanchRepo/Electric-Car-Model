data=[];
a=serial('COM73','BaudRate',9600);
fopen(a);
%flushinput(a)
tic
while (toc<5)
for i=1:3    
data(:,i)=str2double(fscanf(a));
end
if length(data) == 3
rpm=data(1)
temp=data(2);
waterlvl=data(3);
end
end


fclose(a);
delete(a);
