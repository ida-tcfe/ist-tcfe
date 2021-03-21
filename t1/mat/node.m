close all
clear all

R1 = 1.02051254911 * 1000;
R2 = 2.07133294635 * 1000;
R3 = 3.10650554224 * 1000;
R4 = 4.01929064552 * 1000;
R5 = 3.0844359874 * 1000;
R6 = 2.01287586659 * 1000;
R7 = 1.02150900709 * 1000;
Va = 5.07072749268;
Id = 1.00018604098 / 1000;
Kb = 7.26322828319 / 1000;
Kc = 8.05067652194 * 1000;

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

printf("$V_2\\;(V)$ & $%f$ \\\\ \n", c(1));
printf("\\hline\n");
printf("$V_3\\;(V)$ & $%f$ \\\\ \n", c(2));
printf("\\hline\n");
printf("$V_4\\;(V)$ & $%f$ \\\\ \n", c(3));
printf("\\hline\n");
printf("$V_5\\;(V)$ & $%f$ \\\\ \n", c(4));
printf("\\hline\n");
printf("$V_6\\;(V)$ & $%f$ \\\\ \n", c(5));
printf("\\hline\n");
printf("$V_7\\;(V)$ & $%f$ \\\\ \n", c(6));
printf("\\hline\n");
printf("$V_8\\;(V)$ & $%f$ \\\\ \n", c(7));
printf("\\hline\n");
printf("$V_b\\;(V)$ & $%f$ \\\\ \n", Vb);
printf("\\hline\n");
printf("$I_b\\;(V)$ & $%f$ \\\\ \n", Ib);
printf("\\hline\n");
printf("$I_c\\;(V)$ & $%f$ \\\\ \n", Ic);
printf("\\hline\n");
printf("$V_c\\;(V)$ & $%f$ \\\\ \n", Vc);



