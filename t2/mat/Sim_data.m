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
fprintf(fnode, "$IV_s\\;(mA)$ & $%f$ \\\\ \n", I1*1000);
fprintf(fnode, "\\hline\n");
fprintf(fnode, "$IV_d\\;(mA)$ & $%f$ \\\\ \n", IVd*1000);

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

g = figure();
plot(t*1000, vn, "b");
xlabel("t [ms]");
ylabel("vn(t) [V]");
print(g, "natural.eps", "-depsc");

% Forced solution 

f = 1000; %Hz
w = 2*pi*f; %rad/s

%cvs = exp(-j*pi/2);
syms cvs;

cA = [1,0,0,0,0,0,0;-1/R1,1/R1,0,1/R4,0,1/R6,0;1/R1,-1/R1-1/R3-1/R2,1/R2,1/R3,0,0,0;0,1/R2+Kb,-1/R2,-Kb,0,0,0;0,-Kb,0,Kb+1/R5,-1/R5-j*w*C,0,j*w*C;0,0,0,0,0,-1/R6-1/R7,1/R7;0,0,0,1,0,Kd/R6,-1];

cb = [cvs;0;0;0;0;0;0];

cc = cA\cb;

forced = fopen("forced.tex", "w");

d = cc;

cc(1) = subs(cc(1), cvs, exp(-j*pi/2));
cc(2) = subs(cc(2), cvs, exp(-j*pi/2));
cc(3) = subs(cc(3), cvs, exp(-j*pi/2));
cc(4) = subs(cc(4), cvs, exp(-j*pi/2));
cc(5) = subs(cc(5), cvs, exp(-j*pi/2));
cc(6) = subs(cc(6), cvs, exp(-j*pi/2));
cc(7) = subs(cc(7), cvs, exp(-j*pi/2));

fprintf(forced, "$V_1$ & $%f + j*%f$ \\\\ \n", double(real(cc(1))), double(imag(cc(1)))); #V1
fprintf(forced, "\\hline\n");
fprintf(forced, "$V_2$ & $%f + j*%f$ \\\\ \n", double(real(cc(2))), double(imag(cc(2)))); #V2
fprintf(forced, "\\hline\n");
fprintf(forced, "$V_3$ & $%f + j*%f$ \\\\ \n", double(real(cc(3))), double(imag(cc(3)))); #V3
fprintf(forced, "\\hline\n");
fprintf(forced, "$V_5$ & $%f + j*%f$ \\\\ \n", double(real(cc(4))), double(imag(cc(4)))); #V5
fprintf(forced, "\\hline\n");
fprintf(forced, "$V_6$ & $%f + j*%f$ \\\\ \n", double(real(cc(5))), double(imag(cc(5)))); #V6
fprintf(forced, "\\hline\n");
fprintf(forced, "$V_7$ & $%f + j*%f$ \\\\ \n", double(real(cc(6))), double(imag(cc(6)))); #V7
fprintf(forced, "\\hline\n");
fprintf(forced, "$V_8$ & $%f + j*%f$ \\\\ \n", double(real(cc(7))), double(imag(cc(7)))); #V8

fclose(forced);

function Out = piecewise (varargin)
  Conditions = varargin(1:2:end);    % Select all 'odd' inputs
  Values     = varargin(2:2:end);    % Select all 'even' inputs
  N          = length (Conditions);
  if length (Values) ~= N            % 'default' case has been provided
    Values{end+1} = Conditions{end}; % move default return-value to 'Values'
    Conditions{end} = true;          % replace final (ie. default) test with true
  end

  % Wrap return-values into function-handles
  ValFuncs = cell (1, N);
  for n = 1 : N; ValFuncs{n} = @() Values{n}; end

  % Grab funhandle for first successful test and call it to return its value
  Out = ValFuncs([Conditions{:}]){1}();
end

syms x;
F = @(a) piecewise(a >= 0, sin(w*a), 0);

function getv1 (tin, vec, s, func)
vec(1) = subs(vec(1), s, func(tin));
getv1 = double(real(d(1)));
endfunction

g = figure();
plot(t*1000, getv1(t, d, cvs, F), "r");
xlabel("t [ms]");
ylabel("vn(t) [V]");
print(g, "total.eps", "-depsc");

