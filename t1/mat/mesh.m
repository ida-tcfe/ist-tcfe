close all
clear all

#printf("MESH ANALYSIS\n");

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

A = [1,0,0,0;0,1-Kb*R3,Kb*R3,0;0,-R3,R1+R3+R4,R4;0,0,R4,R4+R6+R7-Kc];

b = [Id;0;-Va;0];

c = A\b;

#printf("---- Mesh currents ----\n");
#printf("I_alpha = %f\n", c(1));
#printf("I_beta = %f\n", c(2));
#printf("I_gamma = %f\n", c(3));
#printf("I_delta = %f\n", c(4));

#printf("\n---- Potential differences (resistances) ----\n");

# same as gamma
RV1 = R1 * c(3);
# same as beta
RV2 = R2 * c(2);
# same as beta, back for gamma
RV3 = R3 * (c(2)-c(3));
# same as gamma and delta
RV4 = R4 * (c(3)+c(4));
# same as beta, back for alpha
RV5 = R5 * (c(2)-c(1));
# same as delta
RV6 = R6 * c(4);
# same as delta
RV7 = R7 * c(4);

#printf("\n---- Conditional sources ----\n");

Ib = Kb * RV3;

Vc = - Kc * c(4);

#printf("\n---- Potential differences ----\n");

V8 = RV6;
V7 = V8 + RV7;
V5 = - RV4;
V2 = Va;
V3 = V2 + RV1;
V4 = V3 + RV2;
V6 = V5 - RV5;

#printf("V_2 = %f\n", V2);
#printf("V_3 = %f\n", V3);
#printf("V_4 = %f\n", V4);
#printf("V_5 = %f\n", V5);
#printf("V_6 = %f\n", V6);
#printf("V_7 = %f\n", V7);
#printf("V_8 = %f\n", V8);

printf("$I_\\alpha\\;(A)$ & $%f$ \\\\ \n", c(1));
printf("\\hline\n");
printf("$I_\\beta\\;(A)$ & $%f$ \\\\ \n", c(2));
printf("\\hline\n");
printf("$I_\\gamma\\;(A)$ & $%f$ \\\\ \n", c(3));
printf("\\hline\n");
printf("$I_\\delta\\;(A)$ & $%f$ \\\\ \n", c(4));
printf("\\hline\n");
printf("$I_c\\;(A)$ & $%f$ \\\\ \n", -c(4));
printf("\\hline\n");
printf("$I_b\\;(A)$ & $%f$ \\\\ \n", Ib);
printf("\\hline\n");
printf("$V_2\\;(V)$ & $%f$ \\\\ \n", V2);
printf("\\hline\n");
printf("$V_3\\;(V)$ & $%f$ \\\\ \n", V3);
printf("\\hline\n");
printf("$V_4\\;(V)$ & $%f$ \\\\ \n", V4);
printf("\\hline\n");
printf("$V_5\\;(V)$ & $%f$ \\\\ \n", V5);
printf("\\hline\n");
printf("$V_6\\;(V)$ & $%f$ \\\\ \n", V6);
printf("\\hline\n");
printf("$V_7\\;(V)$ & $%f$ \\\\ \n", V7);
printf("\\hline\n");
printf("$V_8\\;(V)$ & $%f$ \\\\ \n", V8);
printf("\\hline\n");
printf("$V_b\\;(V)$ & $%f$ \\\\ \n", RV3);
printf("\\hline\n");
printf("$V_c\\;(V)$ & $%f$ \\\\ \n", Vc);
