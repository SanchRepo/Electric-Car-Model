a=serial('COM46','BaudRate',9600);
fopen(a);
%boi=fread(a);
boi = fscanf(a);
fclose(a);