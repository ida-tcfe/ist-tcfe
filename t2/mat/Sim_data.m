close all
clear all

%%%%%%%%%%%%%%%%Support File for NGspice

% Simulate OP, t<0
fid = fopen("results.txt", "a");


a = textread ("data.txt", "%s")
values = cell(1, 11);
values{1,1} = a(4,1);

for i = 1:10
  values{1, i+1} = a(3*i + 4,1);
endfor


wval = cell2mat(values)
R1 = str2double(wval{1})*1000
R2 = str2double(wval{2})*1000
R3 = str2double(wval{3})*1000 
R4 = str2double(wval{4})*1000  
R5 = str2double(wval{5})*1000 
R6 = str2double(wval{6})*1000 
R7 = str2double(wval{7})*1000  
Vs =  str2double(wval{8}) 
C = str2double(wval{9})/(1e+6)  
Kb = str2double(wval{10})/1000  
Kd = str2double(wval{11})*1000 


%%%%%%%%%% Escrita do ficheiro

fprintf(fid, ".param R1val = %sk \n", wval{1} ) 
fprintf(fid, ".param R2val = %sk \n", wval{2}) 
fprintf(fid, ".param R3val = %sk \n", wval{1,3}) 
fprintf(fid, ".param R4val = %sk \n", wval{1,4}) 
fprintf(fid, ".param R5val = %sk \n", wval{1,5}) 
fprintf(fid, ".param R6val = %sk \n", wval{1,6}) 
fprintf(fid, ".param R7val = %sk \n", wval{1,7}) 
fprintf(fid, ".param Vsval = %s \n", wval{1,8}) 
fprintf(fid, ".param Cval = %suF \n", wval{1,9}) 
fprintf(fid, ".param Kbval = %smS \n", wval{1,10}) 
fprintf(fid, ".param Kdval = %sk \n", wval{1,11}) 


fclose(fid)

# Node analysis t<0

A = [1,0,0,0,0,0,0;-1/R1,1/R1,0,1/R4,0,-1/R6,0;1/R1,-1/R1-1/R3-1/R2,1/R2,1/R3,0,0,0;0,1/R2+Kb,-1/R2,-Kb,0,0,0;0,-Kb,0,Kb+1/R5,-1/R5,0,0;0,0,0,0,0,1/R6-1/R7,1/R7;0,0,0,1,0,-Kd/R6,-1];

b = [Vs;0;0;0;0;0;0];

c = A\b;

#printf("---- Voltages ----\n");
#printf("V1 = %f\n", c(1));
#printf("V2 = %f\n", c(2));
#printf("V3 = %f\n", c(3));
#printf("V5 = %f\n", c(4));
#printf("V6 = %f\n", c(5));
#printf("V7 = %f\n", c(6));
#printf("V8 = %f\n", c(7));
