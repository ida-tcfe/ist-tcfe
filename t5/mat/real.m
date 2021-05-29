close all
clear all

f = [500; 600; 700; 800; 900; 1000; 1100; 1200; 1300; 1400; 1500; 2000; 2500; 3000; 3500; 4000; 4500; 5000; 5500; 6000; 10000];

v1 = [0.105; 0.105; 0.105; 0.105; 0.105; 0.105; 0.105; 0.104; 0.104; 0.104; 0.104; 0.104; 0.104; 0.104; 0.104; 0.104; 0.104; 0.104; 0.104; 0.104; 0.103];

v2 = [5.5; 5.9; 6.2; 6.2; 6.2; 6.2; 6; 5.9; 5.7; 5.55; 5.4; 4.6; 3.9; 3.35; 2.9; 2.6; 2.3; 2; 1.8; 1.6; 1];

gain = [];

for i = 1:21
	  gain = [gain ; 20*log10(v2(i, 1) / v1(i, 1))];
endfor

g = figure(1);
semilogx(f, gain, "xb");
xlabel("f (Hz)");
ylabel("gain (dB)");
title("Data retrieved in the laboratory");
print(g, "gain.eps", "-depsc");
close(g);

a = textread("../sim/lab.log", "%s")
values = [];

zero = 251;

gain2 = [];

for i = 0:20
	  gain2 = [gain2; str2double(a{zero+3*i,1})]
endfor

g2 = figure(2);
semilogx(f, gain, "xb");
hold on
semilogx(f, gain2, "or");
xlabel("f (Hz)");
ylabel("gain (dB)");
legend({"Real circuit", "Simulated circuit"})
title("Data retrieved in the laboratory vs simulated data");
print(g2, "gain_sim.eps", "-depsc");
close(g2);
