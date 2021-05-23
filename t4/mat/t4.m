close all 
clear all

%gain stage

VT=25e-3;
BFN=178.7;
VAFN=69.7;
   
%resistance E
RE1=100;
   
%resistance c
RC1=100;

%bias circuit
RB1=90000;
RB2=21000;
   
VBEON=0.7;
VCC=12;
%source resistance
RS=100;

RB=1/(1/RB1+1/RB2)
VEQ=RB2/(RB1+RB2)*VCC
IB1=(VEQ-VBEON)/(RB+(1+BFN)*RE1)
IC1=BFN*IB1
IE1=(1+BFN)*IB1
VE1=RE1*IE1
VO1=VCC-RC1*IC1
VCE=VO1-VE1

gm1=IC1/VT
rpi1=BFN/gm1
ro1=VAFN/IC1

RSB=RB*RS/(RB+RS)

%gain sem o condensador perto de RE
%AV1 = RSB/RS * RC1*(RE1-gm1*rpi1*ro1)/((ro1+RC1+RE1)*(RSB+rpi1+RE1)+gm1*RE1*ro1*rpi1 - RE1^2)
%AV1simple = RB/(RB+RS) * gm1*RC1/(1+gm1*RE1)
%AVIsimple_DB = 20*log10(abs(AV1simple))

%RE1=0
%AV1 = RSB/RS * RC1*(RE1-gm1*rpi1*ro1)/((ro1+RC1+RE1)*(RSB+rpi1+RE1)+gm1*RE1*ro1*rpi1 - RE1^2)
%AVI_DB = 20*log10(abs(AV1))
%AV1simple =  - RSB/RS * gm1*RC1/(1+gm1*RE1)
%AVIsimple_DB = 20*log10(abs(AV1simple))

%RE1=100
%ZI1 = 1/(1/RB+1/(((ro1+RC1+RE1)*(rpi1+RE1)+gm1*RE1*ro1*rpi1 - RE1^2)/(ro1+RC1+RE1)))
%ZX = ro1*((RSB+rpi1)*RE1/(RSB+rpi1+RE1))/(1/(1/ro1+1/(rpi1+RSB)+1/RE1+gm1*rpi1/(rpi1+RSB)))
%ZX = ro1*(   1/RE1+1/(rpi1+RSB)+1/ro1+gm1*rpi1/(rpi1+RSB)  )/(   1/RE1+1/(rpi1+RSB) ) 
%ZO1 = 1/(1/ZX+1/RC1)

%RE1=0
AV1 = -gm1*(1/(1/ro1+1/RC1))*(1/(1/RB+1/rpi1))/((1/(1/RB+1/rpi1))+RS)
AVI_DB = 20*log10(abs(AV1))
ZI1 = 1/(1/RB+1/rpi1) 
ZO1 = 1/(1/ro1+1/RC1)

fcomem = fopen("emmiter.tex", "w");
fprintf(fcomem, "Gain & %f \\\\ \n", AV1);
fprintf(fcomem, "\\hline\n");
fprintf(fcomem, "Input Impedance & %f \\\\ \n", ZI1);
fprintf(fcomem, "\\hline\n");
fprintf(fcomem, "Output Impedance & %f \\\\ \n", ZO1);
fprintf(fcomem, "\\hline\n");

fclose(fcomem);

%ouput stage
BFP = 227.3
VAFP = 37.2
RE2 = 1
VEBON = 0.7
VI2 = VO1
IE2 = (VCC-VEBON-VI2)/RE2
IC2 = BFP/(BFP+1)*IE2
IB2 = IC2/BFP
VO2 = VCC - RE2*IE2

gm2 = IC2/VT
go2 = IC2/VAFP
gpi2 = gm2/BFP
ge2 = 1/RE2

AV2 = (gm2+gpi2)/(gm2+gpi2+go2+ge2)
%ZI2 = (gm2+gpi2+go2+ge2)/gpi2/(gpi2+go2+ge2)
ZI2 = (gm2+gpi2+go2+ge2)/gpi2/(go2+ge2)
ZO2 = 1/(gm2+gpi2+go2+ge2)

fcomco = fopen("collector.tex", "w");
fprintf(fcomco, "Gain & %f \\\\ \n", AV2);
fprintf(fcomco, "\\hline\n");
fprintf(fcomco, "Input Impedance & %f \\\\ \n", ZI2);
fprintf(fcomco, "\\hline\n");
fprintf(fcomco, "Output Impedance & %f \\\\ \n", ZO2);
fprintf(fcomco, "\\hline\n");

fclose(fcomco);

%total
gB = 1/(1/gpi2+ZO1)
AV = (gB+gm2/gpi2*gB)/(gB+ge2+go2+gm2/gpi2*gB)*AV1
AV_DB = 20*log10(abs(AV))
ZI=ZI1
ZO=1/(go2+gm2/gpi2*gB+ge2+gB)

ft4 = fopen("ft4.tex", "w");
fprintf(ft4, "$V_{cc}$ (V) & %f \\\\ \n", VCC);
fprintf(ft4, "\\hline\n");
fprintf(ft4, "$V_{eq}$ (V) & %f \\\\ \n", VEQ);
fprintf(ft4, "\\hline\n");
fprintf(ft4, "$V_{B1}$ (V) & %f \\\\ \n", VEQ-RB*IB1);
fprintf(ft4, "\\hline\n");
fprintf(ft4, "$V_{C1}$ (V) & %f \\\\ \n", VO1);
fprintf(ft4, "\\hline\n");
fprintf(ft4, "$V_{E1}$ (V) & %f \\\\ \n", VE1);
fprintf(ft4, "\\hline\n");
fprintf(ft4, "$V_{E2}$ (V) & %f \\\\ \n", VO2);
fprintf(ft4, "\\hline\n");
fprintf(ft4, "$I_{B1}$ (mA) & %f \\\\ \n", IB1*1000);
fprintf(ft4, "\\hline\n");
fprintf(ft4, "$I_{R1}$ (mA) & %f \\\\ \n", IB1*1000*RB/RB1);
fprintf(ft4, "\\hline\n");
fprintf(ft4, "$I_{R2}$ (mA) & %f \\\\ \n", IB1*1000*RB/RB2);
fprintf(ft4, "\\hline\n");
%fprintf(ft4, "$I_{B1}$ (mA) & %f \\\\ \n", IB1*1000*RB/RB1+IB1*1000*RB/RB2);
%fprintf(ft4, "\\hline\n");
fprintf(ft4, "$I_{C1}$ (mA) & %f \\\\ \n", IC1*1000);
fprintf(ft4, "\\hline\n");
fprintf(ft4, "$I_{E1}$ (mA) & %f \\\\ \n", IE1*1000);
fprintf(ft4, "\\hline\n");
fprintf(ft4, "$I_{E2}$ (mA) & %f \\\\ \n", IE2*1000);
fprintf(ft4, "\\hline\n");
fprintf(ft4, "$I_{B2}$ (mA) & %f \\\\ \n", IB2*1000);
fprintf(ft4, "\\hline\n");
fprintf(ft4, "$I_{C2}$ (mA) & %f \\\\ \n", IC2*1000);
fprintf(ft4, "\\hline\n");

fclose(ft4);

w=linspace(log10(10), log10(100000000), 70);
w=2*pi*10 .^(w);
VV=linspace(log10(10), log10(100000000), 70);
Vin = 0.01*exp(-j*pi/2);

Rin = 100;
Cin = 0.000030;
CB = 0.000400;
CO = 0.000310;
RL = 8;
rpi2 = 1/gpi2;
ro2 = 1/go2;

for i=1:length(w)
  %printf("%f",w(i)/2/pi);
  A = [1,0,0,0,0,0;-1/(Rin+1/(j*w(i)*Cin)),1/RB1+1/RB2+1/rpi1+1/(Rin+1/(j*w(i)*Cin)),-1/rpi1,0,0,0;0,-1/rpi1-gm1,1/rpi1+gm1+1/RE1+j*w(i)*CB+1/ro1,-1/ro1,0,0;0,gm1,-gm1-1/ro1,1/ro1+1/RC1+1/rpi2,-1/rpi2,0;0,0,0,-1/rpi2-gm2,1/rpi2+gm2+1/ro2+1/RE2+j*w(i)*CO,-j*w(i)*CO;0,0,0,0,-j*w(i)*CO,j*w(i)*CO+1/RL];
  b = [Vin;0;0;0;0;0];
  c = A\b;
  VV(i) = abs(c(6)/Vin);
endfor

figure
plot (log10(w/2/pi), 20*log10(VV));
xlabel ("log10(f) [Hz]");
ylabel ("|T| dB");
print ("Vo_Vi.png", "-dpng");
