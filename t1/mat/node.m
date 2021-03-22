close all
clear all

R1 = 1020.51254911;
R2 = 2071.33294635;
R3 = 3106.50554224;
R4 = 4019.29064552;
R5 = 3084.4359874;
R6 = 2012.87586659;
R7 = 1021.50900709;
Va = 5.07072749268;
Id = 0.00100018604098;
Kb = 0.00726322828319;
Kc = 8050.67652194;

#A = [O,Z,Z,Z,Z,Z,Z;Z,O/R1,Z,O/R4,Z,Z,O/R6;Z,-O/R1-O/R3-O/R2,O/R2,O/R3,Z,Z,Z;Z,O/R2+Kb,-O/R2,-Kb,Z,Z,Z;Z,-Kb,Z,Kb+O/R5,-O/R5,Z,Z;Z,Z,Z,O,Z,-O,Kc/R6;Z,Z,Z,Z,Z,O/R7,-O/R6-O/R7];

A = [1,0,0,0,0,0,0;0,1/R1,0,1/R4,0,0,1/R6;0,-1/R1-1/R3-1/R2,1/R2,1/R3,0,0,0;0,1/R2+Kb,-1/R2,-Kb,0,0,0;0,-Kb,0,Kb+1/R5,-1/R5,0,0;0,0,0,1,0,-1,Kc/R6;0,0,0,0,0,1/R7,-1/R6-1/R7];

b = [Va;Va/R1;-Va/R1;0;-Id;0;0];

c = A\b;

#printf("---- Voltages ----\n");
#printf("V2 = %f\n", c(1));
#printf("V3 = %f\n", c(2));
#printf("V4 = %f\n", c(3));
#printf("V5 = %f\n", c(4));
#printf("V6 = %f\n", c(5));
#printf("V7 = %f\n", c(6));
#printf("V8 = %f\n", c(7));

#printf("\n---- Conditional sources ----\n");

Vb = c(2)-c(4);

Ib = Kb * Vb;

Ic = -c(7)/R6;

Vc = Kc * Ic;

printf("$V_2\\;(V)$ & $%f$ \\\\ \n", c(1)); #V2
printf("\\hline\n");
printf("$V_3\\;(V)$ & $%f$ \\\\ \n", c(2)); #V3
printf("\\hline\n");
printf("$V_4\\;(V)$ & $%f$ \\\\ \n", c(3)); #V4
printf("\\hline\n");
printf("$V_5\\;(V)$ & $%f$ \\\\ \n", c(4)); #V5
printf("\\hline\n");
printf("$V_6\\;(V)$ & $%f$ \\\\ \n", c(5)); #V6
printf("\\hline\n");
printf("$V_7\\;(V)$ & $%f$ \\\\ \n", c(6)); #V7
printf("\\hline\n");
printf("$V_8\\;(V)$ & $%f$ \\\\ \n", c(7)); #V8
printf("\\hline\n");
printf("$V_c\\;(V)$ & $%f$ \\\\ \n", Vc);
printf("\\hline\n");
printf("$V_b\\;(V)$ & $%f$ \\\\ \n", Vb);

I1 = (c(2)-c(1)) / R1;
I2 = (c(3)-c(2)) / R2;
I3 = Vb / R3;
I4 = -c(4) / R4;
I5 = (c(4)-c(5)) / R5;
I7 = (c(7)-c(6)) / R7;

printf("\\hline\n");
printf("$I_1\\;(A)$ & $%f$ \\\\ \n", I1);
printf("\\hline\n");
printf("$I_2\\;(A)$ & $%f$ \\\\ \n", I2);
printf("\\hline\n");
printf("$I_3\\;(A)$ & $%f$ \\\\ \n", I3);
printf("\\hline\n");
printf("$I_4\\;(A)$ & $%f$ \\\\ \n", I4);
printf("\\hline\n");
printf("$I_5\\;(A)$ & $%f$ \\\\ \n", I5);
printf("\\hline\n");
printf("$I_7\\;(A)$ & $%f$ \\\\ \n", I7);
printf("\\hline\n");
printf("$I_b\\;(A)$ & $%f$ \\\\ \n", Ib);
printf("\\hline\n");
printf("$I_c\\;(A)$ & $%f$ \\\\ \n", Ic);


