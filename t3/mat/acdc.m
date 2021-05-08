close all 
clear all

%parametros
f=50;
Vin=230;
% n transformador
n = 15;
w=2*pi*f;
R1=10.82e3;
R2=1.12e3;
C=40e-6;

% amplitude apos transformador
A = Vin/15;
% sinal
t=linspace(0, 10/f, 1000);
Vi = A*sin(w*t);
% utilizando o ideal model para os diodos no rectifier
Vi = abs(Vi);

% gráfico apos passar pelo full wave rectifier
%figure
%plot(t*1000, Vi)
%title("Output voltage v_o(t)")
%xlabel ("t[ms]")
%ylabel ("v_o[V]")
%print ("vo.eps", "-depsc");

%envelope detector - capacitor

vED = zeros(1, length(t));
vOnexp = zeros(1, length(t));
T = 1/f;
tOFF = 1/w * atan(1/w/R1/C) + T/4;  

%for i=1:length(t)
%  if (t(i) <= T/4)
%    vOnexp = 0;
%  elseif (t(i) < tOFF+T)
%    vOnexp = A*abs(sin(w*tOFF))*exp(-(t(i)-tOFF)/R1/C);
%  else
%    tOFF = tOFF + T;
%    vOnexp = A*abs(sin(w*tOFF))*exp(-(t(i)-tOFF)/R1/C);
%  endif
%endfor

%tOFF = 1/w * atan(1/w/R1/C) + T/4;  

%figure

%plot(t*1000, Vi)
%hold

for i=1:length(t)
  if (t(i) < tOFF)
    vED(i) = Vi(i);
  elseif (A*abs(sin(w*tOFF))*exp(-(t(i)-tOFF)/R1/C) > Vi(i))
    vED(i) = A*abs(sin(w*tOFF))*exp(-(t(i)-tOFF)/R1/C);
  else
    vED(i) = Vi(i);
    tOFF = tOFF + T/2;
  endif
endfor

%title("Output voltage Envelope Detector v_ED(t)")
%xlabel ("t[ms]")
%ylabel ("v_ED[V]")
%legend("rectified","envelope")
%print ("ocenvelope.eps", "-depsc");

mediaenv = 0;
pontos = 0;
tOFF = 1/w * atan(1/w/R1/C) + T/4;  

for i=1:length(t)
  if (t(i) > tOFF) 
    if (t(i) < tOFF+5*T)
      mediaenv = mediaenv + vED(i);
      pontos = pontos + 1;
    endif
  endif
endfor

mediaenv = mediaenv / pontos;

% voltage regulator

vO = zeros(1, length(t));
ndiodes = 18;
% valor abaixo retirado ngspice
VO = 11.99949;
VOn = VO/ndiodes;

% utilizando modelo mais simples so com von
%vlim = VOn * ndiodes;

%limit
%for i=1:length(t)
%  if vED(i) > vlim
%    vO(i) = vlim;
%  else
%    vO(i) = vED(i);
%  endif
%endfor

%utilizando modelo incremental
vs = vED - mediaenv;

VT = 0.025;
IS = 1.0e-14;

rd = ndiodes*VT/(IS*exp(VOn/VT));

vo = vs*rd/(rd+R2);

vO = vo + VO;

vmin = zeros(1, length(t));

for i=1:length(t)
  if (t(i) < tOFF) 
    vmin(i) = 100;
  else 
    vmin(i) = vO(i);
  endif
endfor

maximo = max(vO);
minimo = min(vmin);
ripple = maximo-minimo;

mediaf = 0;
pontos = 0;

for i=1:length(t)
  if (t(i) > tOFF) 
    if (t(i) < tOFF+5*T)
      mediaf= mediaf + vO(i);
      pontos = pontos + 1;
    endif
  endif
endfor

mediaf = mediaf / pontos;

facdcoc = fopen("acdcoc.tex", "w");
fprintf(facdcoc, "Average & %f \\\\ \n", mediaf);
fprintf(facdcoc, "\\hline\n");
fprintf(facdcoc, "Ripple & %f \\\\ \n", ripple);
fprintf(facdcoc, "\\hline\n");

fclose(facdcoc);

vO = vO-12;

plot(t*1000, vO)
title("Output voltage - 12")
xlabel ("t[ms]")
ylabel ("vO - 12[V]")
print ("12octave.eps", "-depsc");

vO = vO+12;

figure

plot(t*1000, vED)
hold

plot(t*1000, vO)
title("Output voltage")
xlabel ("t[ms]")
ylabel ("v[V]")
legend("envelope","regulator")
print ("acdcoctave.eps", "-depsc");

