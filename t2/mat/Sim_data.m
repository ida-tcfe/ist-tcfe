
%%%%%%%%%%%%%%%%Support File for NGspice

% Simulate OP, t<0
fid = fopen("results.txt", "a");


a = textread ("test.txt", "%s")
values = cell(1, 11)
values{1,1} = a(4,1)

for i = 1:10
  values{1, i+1} = a(3*i + 4,1)
  printf("It: i \n ", i) 
endfor


wval = cell2mat(values)


%%%%%%%%%% Escrita do ficheiro

fprintf(fid, ".param R1val = %s \n", wval{1} ) 
fprintf(fid, ".param R2val = %s \n", wval{2}) 
fprintf(fid, ".param R3val = %s \n", wval{1,3}) 
fprintf(fid, ".param R4val = %s \n", wval{1,4}) 
fprintf(fid, ".param R5val = %s \n", wval{1,5}) 
fprintf(fid, ".param R6val = %s \n", wval{1,6}) 
fprintf(fid, ".param R7val = %s \n", wval{1,7}) 
fprintf(fid, ".param Vsval = %s \n", wval{1,8}) 
fprintf(fid, ".param Cval = %s\n", wval{1,9}) 
fprintf(fid, ".param Kbval = %s \n", wval{1,10}) 
fprintf(fid, ".param Kcval = %s \n", wval{1,11}) 


fclose(fid)