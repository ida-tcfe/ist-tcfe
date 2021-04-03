close all
clear all
pkg load symbolic

%%%%%%%%%%%%%%%%Support File for NGspice

% Simulate OP, t<0  
fid = fopen("../sim/results.txt", "w");


a = textread ("data.txt", "%s");
values = cell(1, 11);

for i = 1:11
  values{1, i} = a(3*i,1);
endfor


%%%%%%%%%%%%%%%%%% Conversion from str to var
format long
wval = cell2mat(values);
R1 = str2num(wval{1})*1000;
R2 = str2double(wval{2})*1000;
R3 = str2double(wval{3})*1000; 
R4 = str2double(wval{4})*1000; 
R5 = str2double(wval{5})*1000;
R6 = str2double(wval{6})*1000;
R7 = str2double(wval{7})*1000; 
Vs =  str2double(wval{8});
C = str2double(wval{9})/(1e+6);  
Kb = str2double(wval{10})/1000; 
Kd = str2double(wval{11})*1000;

%%%%%%%%%% Escrita do ficheiro

fprintf(fid, ".param R1val = %sk \n", wval{1}); 
fprintf(fid, ".param R2val = %sk \n", wval{2});
fprintf(fid, ".param R3val = %sk \n", wval{1,3}); 
fprintf(fid, ".param R4val = %sk \n", wval{1,4});
fprintf(fid, ".param R5val = %sk \n", wval{1,5}); 
fprintf(fid, ".param R6val = %sk \n", wval{1,6});
fprintf(fid, ".param R7val = %sk \n", wval{1,7}); 
fprintf(fid, ".param Vsval = %s \n", wval{1,8});
fprintf(fid, ".param Cval = %suF \n", wval{1,9}); 
fprintf(fid, ".param Kbval = %smS \n", wval{1,10}); 
fprintf(fid, ".param Kdval = %sk \n", wval{1,11});

fclose(fid);

# Node analysis t<0

A = [1,0,0,0,0,0,0;-1/R1,1/R1,0,1/R4,0,1/R6,0;1/R1,-1/R1-1/R3-1/R2,1/R2,1/R3,0,0,0;0,1/R2+Kb,-1/R2,-Kb,0,0,0;0,-Kb,0,Kb+1/R5,-1/R5,0,0;0,0,0,0,0,-1/R6-1/R7,1/R7;0,0,0,1,0,Kd/R6,-1];

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

Vx = c(5)-c(7);

fnode = fopen("node.tex", "w");

fprintf(fnode, "$V_1\\;(V)$ & $%f$ \\\\ \n", c(1)); #V1
fprintf(fnode, "\\hline\n");
fprintf(fnode, "$V_2\\;(V)$ & $%f$ \\\\ \n", c(2)); #V2
fprintf(fnode, "\\hline\n");
fprintf(fnode, "$V_3\\;(V)$ & $%f$ \\\\ \n", c(3)); #V3
fprintf(fnode, "\\hline\n");
fprintf(fnode, "$V_5\\;(V)$ & $%f$ \\\\ \n", c(4)); #V5
fprintf(fnode, "\\hline\n");
fprintf(fnode, "$V_6\\;(V)$ & $%f$ \\\\ \n", c(5)); #V6
fprintf(fnode, "\\hline\n");
fprintf(fnode, "$V_7\\;(V)$ & $%f$ \\\\ \n", c(6)); #V7
fprintf(fnode, "\\hline\n");
fprintf(fnode, "$V_8\\;(V)$ & $%f$ \\\\ \n", c(7)); #V8

I1 = (c(2)-c(1)) / R1;
I2 = (c(3)-c(2)) / R2;
Vb = c(2)-c(4);
I3 = Vb / R3;
I4 = c(4) / R4;
I5 = (c(5)-c(4)) / R5;
Id = -c(6) / R6;
I7 = (c(7)-c(6)) / R7;
Ib = Kb*Vb;
IVd = I5-I4+I3;

fprintf(fnode, "\\hline\n");
fprintf(fnode, "$I_1\\;(mA)$ & $%f$ \\\\ \n", I1*1000);
fprintf(fnode, "\\hline\n");
fprintf(fnode, "$I_2\\;(mA)$ & $%f$ \\\\ \n", I2*1000);
fprintf(fnode, "\\hline\n");
fprintf(fnode, "$I_3\\;(mA)$ & $%f$ \\\\ \n", I3*1000);
fprintf(fnode, "\\hline\n");
fprintf(fnode, "$I_4\\;(mA)$ & $%f$ \\\\ \n", I4*1000);
fprintf(fnode, "\\hline\n");
fprintf(fnode, "$I_5\\;(mA)$ & $%f$ \\\\ \n", I5*1000);
fprintf(fnode, "\\hline\n");
fprintf(fnode, "$I_6\\;(mA)$ & $%f$ \\\\ \n", Id*1000);
fprintf(fnode, "\\hline\n");
fprintf(fnode, "$I_7\\;(mA)$ & $%f$ \\\\ \n", I7*1000);
fprintf(fnode, "\\hline\n");
fprintf(fnode, "$I_b\\;(mA)$ & $%f$ \\\\ \n", Ib*1000);
fprintf(fnode, "\\hline\n");
fprintf(fnode, "$IV_d\\;(mA)$ & $%f$ \\\\ \n", IVd*1000);
fprintf(fnode, "\\hline\n");
fprintf(fnode, "$IV_s\\;(mA)$ & $%f$ \\\\ \n", I1*1000);

fclose(fnode);

# Node analysis t=0 for capacitor Req

A = [1,0,0,0,0,0,0;1/R1,-1/R1-1/R3-1/R2,1/R2,1/R3,0,0,0;0,Kb+1/R2,-1/R2,-Kb,0,0,0;-1/R1,1/R1,0,1/R4,0,1/R6,0;0,0,0,1,0,Kd/R6,-1;0,0,0,0,1,0,-1;0,0,0,0,0,-1/R6-1/R7,1/R7];

b = [0;0;0;0;0;Vx;0];

c = A\b;
Ix = -((c(4)-c(5))/R5 - Kb*(c(2)-c(4)));

fnode2 = fopen("nodeReq.tex", "w");

fprintf(fnode2, "$V_1\\;(V)$ & $%f$ \\\\ \n", c(1)); #V1 = 0
fprintf(fnode2, "\\hline\n");
fprintf(fnode2, "$V_2\\;(V)$ & $%f$ \\\\ \n", c(2)); #V2 = 0
fprintf(fnode2, "\\hline\n");
fprintf(fnode2, "$V_3\\;(V)$ & $%f$ \\\\ \n", c(3)); #V3 = 0
fprintf(fnode2, "\\hline\n");
fprintf(fnode2, "$V_5\\;(V)$ & $%f$ \\\\ \n", c(4)); #V5 = 0
fprintf(fnode2, "\\hline\n");
fprintf(fnode2, "$V_6\\;(V)$ & $%f$ \\\\ \n", c(5)); #V6
fprintf(fnode2, "\\hline\n");
fprintf(fnode2, "$V_7\\;(V)$ & $%f$ \\\\ \n", c(6)); #V7 = 0
fprintf(fnode2, "\\hline\n");
fprintf(fnode2, "$V_8\\;(V)$ & $%f$ \\\\ \n", c(7)); #V8 = 0

V1 = c(1);
V2 = c(2);
V3 = c(3);
V5 = c(4);
V6 = c(5);
V7 = c(6);
V8 = c(7);

fclose(fnode2);

V = sym('V');
b = [0;0;0;0;0;V;0];
c = A\b;

fnode22 = fopen("nodeReqb.tex", "w");

fprintf(fnode22, "$V_1\\;(V)$ & $%f$ \\\\ \n", double(c(1))); #V1 = 0
fprintf(fnode22, "\\hline\n");
fprintf(fnode22, "$V_2\\;(V)$ & $%f$ \\\\ \n", double(c(2))); #V2 = 0
fprintf(fnode22, "\\hline\n");
fprintf(fnode22, "$V_3\\;(V)$ & $%f$ \\\\ \n", double(c(3))); #V3 = 0
fprintf(fnode22, "\\hline\n");
fprintf(fnode22, "$V_5\\;(V)$ & $%f$ \\\\ \n", double(c(4))); #V5 = 0
fprintf(fnode22, "\\hline\n");
fprintf(fnode22, "$V_6\\;(V)$ & $%c$ \\\\ \n", char(c(5))); #V6
fprintf(fnode22, "\\hline\n");
fprintf(fnode22, "$V_7\\;(V)$ & $%f$ \\\\ \n", double(c(6))); #V7 = 0
fprintf(fnode22, "\\hline\n");
fprintf(fnode22, "$V_8\\;(V)$ & $%f$ \\\\ \n", double(c(7))); #V8 = 0

fclose(fnode22);

fnode3 = fopen("nodeReq2.tex", "w");

Req = Vx/Ix;

fprintf(fnode3, "$I_x\\;(mA)$ & $%f$ \\\\ \n", Ix*1000);
fprintf(fnode3, "\\hline\n");
fprintf(fnode3, "$R_{eq}\\;(k\\Omega)$ & $%f$ \\\\ \n", Req / 1000);
fprintf(fnode3, "\\hline\n");
fprintf(fnode3, "$\\tau\\;(mC/A)$ & $%f$ \\\\ \n", Req * C * 1000);
fprintf(fnode3, "\\hline\n");
fprintf(fnode3, "$P_x\\;(mW)$ & $%f$ \\\\ \n", -Vx * Ix * 1000);

fclose(fnode3);

# Plot natural solution

t = 0:1e-6:20e-3; % 0 to 20 ms
vn = Vx * exp(-t/(Req*C));

g = figure(1);
plot(t*1000, vn, "b");
xlabel("t [ms]");
ylabel("vn(t) [V]");
print(g, "natural.eps", "-depsc");
close(g);

% Forced solution 

f = 1000; %Hz
w = 2*pi*f; %rad/s

cvs = exp(-j*pi/2);

cA = [1,0,0,0,0,0,0;-1/R1,1/R1,0,1/R4,0,1/R6,0;1/R1,-1/R1-1/R3-1/R2,1/R2,1/R3,0,0,0;0,1/R2+Kb,-1/R2,-Kb,0,0,0;0,-Kb,0,Kb+1/R5,-1/R5-j*w*C,0,j*w*C;0,0,0,0,0,-1/R6-1/R7,1/R7;0,0,0,1,0,Kd/R6,-1];

cb = [cvs;0;0;0;0;0;0];

cc = cA\cb;

forced = fopen("forced.tex", "w");

fprintf(forced, "$V_1$ & $%f + j\\cdot%f$ \\\\ \n", real(cc(1)), imag(cc(1))); #V1
fprintf(forced, "\\hline\n");
fprintf(forced, "$V_2$ & $%f + j\\cdot%f$ \\\\ \n", real(cc(2)), imag(cc(2))); #V2
fprintf(forced, "\\hline\n");
fprintf(forced, "$V_3$ & $%f + j\\cdot%f$ \\\\ \n", real(cc(3)), imag(cc(3))); #V3
fprintf(forced, "\\hline\n");
fprintf(forced, "$V_5$ & $%f + j\\cdot%f$ \\\\ \n", real(cc(4)), imag(cc(4))); #V5
fprintf(forced, "\\hline\n");
fprintf(forced, "$V_6$ & $%f + j\\cdot%f$ \\\\ \n", real(cc(5)), imag(cc(5))); #V6
fprintf(forced, "\\hline\n");
fprintf(forced, "$V_7$ & $%f + j\\cdot%f$ \\\\ \n", real(cc(6)), imag(cc(6))); #V7
fprintf(forced, "\\hline\n");
fprintf(forced, "$V_8$ & $%f + j\\cdot%f$ \\\\ \n", real(cc(7)), imag(cc(7))); #V8

fclose(forced);

# determine amplitudes and phases

pol = [abs(cc(1)), angle(cc(1)); abs(cc(2)), angle(cc(2)); abs(cc(3)), angle(cc(3)); abs(cc(4)), angle(cc(4)); abs(cc(5)), angle(cc(5)); abs(cc(6)), angle(cc(6)); abs(cc(7)), angle(cc(7))];

forced2 = fopen("forced2.tex", "w");
fprintf(forced2, "$V_1$ & %f & %f \\\\ \n", pol(1,1), pol(1,2));
fprintf(forced2, "\\hline\n");
fprintf(forced2, "$V_2$ & %f & %f \\\\ \n", pol(2,1), pol(2,2));
fprintf(forced2, "\\hline\n");
fprintf(forced2, "$V_3$ & %f & %f \\\\ \n", pol(3,1), pol(3,2));
fprintf(forced2, "\\hline\n");
fprintf(forced2, "$V_5$ & %f & %f \\\\ \n", pol(4,1), pol(4,2));
fprintf(forced2, "\\hline\n");
fprintf(forced2, "$V_6$ & %f & %f \\\\ \n", pol(5,1), pol(5,2));
fprintf(forced2, "\\hline\n");
fprintf(forced2, "$V_7$ & %f & %f \\\\ \n", pol(6,1), pol(6,2));
fprintf(forced2, "\\hline\n");
fprintf(forced2, "$V_8$ & %f & %f \\\\ \n", pol(7,1), pol(7,2));
fprintf(forced2, "\\hline\n");

fclose(forced2);

forced6 = fopen("forced6.tex", "w");

fprintf(forced6, "V_{6f}(t) = %f\\ \\cdot cos(wt-%f)", pol(5,1), pol(5,2));

fclose(forced6);

# draw

function x = pieceWise(t, amp, pha, w, V, tau)
  x = V * ones(size (t));
%ind = t >= (pha-pi/2)/w;
ind = t >= 0;
  x(ind) = V*exp(-t(ind)/tau)+amp*cos(w*t(ind)-pha);
endfunction

t = -5e-3:1e-6:20e-3; % 0 to 20 ms;

h = figure(2);
plot(t*1000, pieceWise(t, pol(5,1), pol(5,2), w, V6, Req*C), "r");
hold on;
plot(t*1000, sin(w*t), "g");
xlabel("t [ms]");
ylabel("[V]");
legend("v_6(t)", "v_s(t)");
print(h, "total.eps", "-depsc");
close(h);

# vc(f)

freq = sym('freq')

w = 2*pi*freq %rad/s

cvs = exp(-j*pi/2);

cA = [[1,0,0,0,0,0,0];[-1/R1,1/R1,0,1/R4,0,1/R6,0];[1/R1,-1/R1-1/R3-1/R2,1/R2,1/R3,0,0,0];[0,1/R2+Kb,-1/R2,-Kb,0,0,0];[0,-Kb,0,Kb+1/R5,-1/R5-j*w*C,0,j*w*C];[0,0,0,0,0,-1/R6-1/R7,1/R7];[0,0,0,1,0,Kd/R6,-1]];

cb = [cvs;0;0;0;0;0;0];

cc = cA\cb; # solution with freq as unknown

v6 = function_handle(abs(cc(5)));
v8 = function_handle(abs(cc(7)));
vc = function_handle(abs(cc(5)-cc(7)));

%cc(5) = subs(cc(5), freq, 1000);
%double(real(cc(5)))
%double(imag(cc(5)))

fs = logspace(-1, 6, 100);

k = figure(3);
semilogx(fs, 20*log(v6(fs)), "r");
hold on;
semilogx(fs, 20*log(vc(fs)), "b");
hold on;
semilogx(fs, 20*log(ones(size(fs))), "g");
xlabel("f [Hz]");
ylabel("[dB]");
title("Magnitude frequency response");
legend("v_6(f)", "v_c(f)", "v_s");
print(k, "freq_response_mag.eps", "-depsc");
close(k);

v6p = function_handle(cc(5));
v8p = function_handle(cc(7));
vcp = function_handle(cc(5)-cc(7));

function x = v(f, vp)
  x = vp(f);
  x = angle(x);
% here should i:f size but it doesnt work
  for i = 1:100
	      if (x(1,i) < 0)
		x(1,i) = x(1,i) + 2*pi;
  endif
  endfor
endfunction

m = figure(4);
% deg2rad should be inside v but it doesnt work
semilogx(fs, rad2deg(v(fs, v6p)), "r");
hold on;
semilogx(fs, rad2deg(v(fs, vcp)), "b");
hold on;
semilogx(fs, 90*ones(size(fs)), "g");
xlabel("f [Hz]");
ylabel("[deg]");
title("Phase frequency response");
legend("phi_6(f)", "phi_c(f)", "phi_s");
print(m, "freq_response_phi.eps", "-depsc");
close(m);
