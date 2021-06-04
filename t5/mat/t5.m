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

%f = 1000;
%w = 2*pi*f;

wL=1/(R1*C1);
wH=1/(R2*C2);

w=sqrt(wL*wH);

Vin = 1*exp(-j*pi/2);

A = [0,j*w*C1+1/R1,0,0;-1,1,0,0;1,0,-R4/(R4+R5),0;0,0,-1/R2,1/R2+j*w*C2];
b = [Vin*j*w*C1;0;0;0];
c = A\b;

%antes = c(4)/Vin
Gain = abs(c(4)/Vin)
%Gain = abs(R1*C1*j*w*(1+R5/R4)/(1+R1*C1*j*w)/(1+R2*C2*j*w))
%p=angle(c(4)/Vin)
GaindB = 20*log10(Gain)

Rin = Vin/((Vin-c(2))*j*w*C1)

%R2 em paralelo com C2
Rout = 1/(1/R2+j*w*C2)

fi = fopen("../doc/centralf.tex", "w");
fprintf(fi, "$f_c\\; (Hz)$ & %f \\\\ \n", w/(2*pi));
fprintf(fi, "\\hline\n");
fprintf(fi, "$gain(f_c)\\; (dB)$ & %f \\\\ \n", GaindB);
fprintf(fi, "\\hline\n");
fprintf(fi, "$z_{in}$ & %f + i ( %f ) \\\\ \n", real(Rin), imag(Rin));
fprintf(fi, "\\hline\n");
fprintf(fi, "$z_{out}$ & %f + i ( %f ) \\\\ \n", real(Rout), imag(Rout));
fprintf(fi, "\\hline\n");

fclose(fi);

w=linspace(log10(10), log10(100000000), 70);
w=2*pi*10 .^(w);
VV=linspace(log10(10), log10(100000000), 70);
pha=linspace(log10(10), log10(100000000), 70);

for i=1:length(w)
  A = [0,j*w(i)*C1+1/R1,0,0;-1,1,0,0;1,0,-R4/(R4+R5),0;0,0,-1/R2,1/R2+j*w(i)*C2];
  b = [Vin*j*w(i)*C1;0;0;0];
  c = A\b;
  VV(i) = abs(c(4)/Vin);
  pha(i) = angle(c(4)/Vin);
endfor

figure
semilogx(w/2/pi, pha);
title("Frequency response - Phase")
xlabel ("f (Hz)");
ylabel ("Phase (rad)");
print ("phase.eps", "-depsc");

figure
semilogx(w/2/pi, 20*log10(VV));
title("Frequency response - Gain")
xlabel ("f (Hz)");
ylabel ("Vo(f)/Vi(f) dB");
print ("Vo_Vi.eps", "-depsc");


