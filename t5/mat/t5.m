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

wc=sqrt(wL*wH);

w=2000*pi;

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
fprintf(fi, "$f_c\\; (Hz)$ & %f \\\\ \n", wc/(2*pi));
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


f = [500; 600; 700; 800; 900; 1000; 1100; 1200; 1300; 1400; 1500; 2000; 2500; 3000; 3500; 4000; 4500; 5000; 5500; 6000; 10000];

v1 = [0.105; 0.105; 0.105; 0.105; 0.105; 0.105; 0.105; 0.104; 0.104; 0.104; 0.104; 0.104; 0.104; 0.104; 0.104; 0.104; 0.104; 0.104; 0.104; 0.104; 0.103];

v2 = [5.5; 5.9; 6.2; 6.2; 6.2; 6.2; 6; 5.9; 5.7; 5.55; 5.4; 4.6; 3.9; 3.35; 2.9; 2.6; 2.3; 2; 1.8; 1.6; 1];

gain = [];

for i = 1:21
	  gain = [gain ; 20*log10(v2(i, 1) / v1(i, 1))];
endfor

a = textread("sim_data.txt", "%s");
values = [];

gain2 = [];

for i = 1:21
	  gain2 = [gain2; str2double(a{i,1})];
endfor

gain3 = [];

for i = 1:21
          w=2*pi*f(i);
          Vin = v1(i, 1)*exp(-j*pi/2)/2;
          A = [0,j*w*C1+1/R1,0,0;-1,1,0,0;1,0,-R4/(R4+R5),0;0,0,-1/R2,1/R2+j*w*C2];
          b = [Vin*j*w*C1;0;0;0];
          c = A\b;
	  gain3 = [gain3 ; 20*log10(abs(c(4)/Vin))];
endfor

g2 = figure(3);
semilogx(f, gain, "xb");
hold on
semilogx(f, gain2, "or");
hold on
semilogx(f, gain3, "^g");
xlabel("f (Hz)");
ylabel("gain (dB)");
legend({"Real circuit", "Simulated circuit","Theoretical values"})
title("Data retrieved in the laboratory vs simulated data vs theory");
print(g2, "gain_all.eps", "-depsc");
close(g2);

