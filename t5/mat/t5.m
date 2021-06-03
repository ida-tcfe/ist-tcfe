close all 
clear all
   
VCC=10;
VEE=-10;
C1=0.000000220;
R1=1000;
C2=0.000000220;
R2=500;
R4=1000;
R5=100000;

f = 1000;
w = 2*pi*f;

Vin = 1*exp(-j*pi/2);

A = [0,j*w*C1+1/R1,0,0;-1,1,0,0;1,0,-R4/(R4+R5),0;0,0,-1/R2,1/R2+j*w*C2];
b = [Vin*j*w*C1;0;0;0];
c = A\b;

Gain = abs(c(4)/Vin)
GaindB = 20*log10(Gain)

Rin = Vin/((Vin-c(2))*j*w*C1)

%R2 em paralelo com C2
Rout = 1/(1/R2+j*w*C2)

fi = fopen("centralf.tex", "w");
fprintf(fi, "$f_c\\; (Hz)$ & %f \\\\ \n", f);
fprintf(fi, "\\hline\n");
fprintf(fi, "$gain(f_c)\\; (dB)$ & %f \\\\ \n", GaindB);
fprintf(fi, "\\hline\n");
fprintf(fi, "$z_{in}$ & %f + i (%f) \\\\ \n", real(Rin), imag(Rin));
fprintf(fi, "\\hline\n");
fprintf(fi, "$z_{out}$ & %f + i (%f) \\\\ \n", real(Rout), imag(Rout));
fprintf(fi, "\\hline\n");

fclose(fi);
