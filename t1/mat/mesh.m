close all
clear all

#printf("MESH ANALYSIS\n");

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
printf("$V_c\\;(V)$ & $%f$ \\\\ \n", Vc);
printf("\\hline\n");
printf("$V_b\\;(V)$ & $%f$ \\\\ \n", RV3);
printf("\\hline\n");
printf("$I_1\\;(A)$ & $%f$ \\\\ \n", c(3));
printf("\\hline\n");
printf("$I_2\\;(A)$ & $%f$ \\\\ \n", c(2));
printf("\\hline\n");
printf("$I_3\\;(A)$ & $%f$ \\\\ \n", c(2)-c(3));
printf("\\hline\n");
printf("$I_4\\;(A)$ & $%f$ \\\\ \n", c(3)+c(4));
printf("\\hline\n");
printf("$I_5\\;(A)$ & $%f$ \\\\ \n", c(2)-c(1));
printf("\\hline\n");
printf("$I_7\\;(A)$ & $%f$ \\\\ \n", -c(4));
printf("\\hline\n");

#printf("$I_\\alpha\\;(A)$ & $%f$ \\\\ \n", c(1));
#printf("\\hline\n");
#printf("$I_\\beta\\;(A)$ & $%f$ \\\\ \n", c(2));
#printf("\\hline\n");
#printf("$I_\\gamma\\;(A)$ & $%f$ \\\\ \n", c(3));
#printf("\\hline\n");
#printf("$I_\\delta\\;(A)$ & $%f$ \\\\ \n", c(4));
#printf("\\hline\n");
printf("$I_b\\;(A)$ & $%f$ \\\\ \n", Ib);
printf("\\hline\n");
printf("$I_c\\;(A)$ & $%f$ \\\\ \n", -c(4));




