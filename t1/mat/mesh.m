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

A = [1,0,0,0;0,1-Kb*R3,Kb*R3,0;0,-R3,R1+R3+R4,R4;0,0,R4,R4+R6+R7-Kc];

b = [Id;0;-Va;0];

c = A\b;

printf("---- Mesh currents ----\n");
printf("I_alpha = %f\n", c(1));
printf("I_beta = %f\n", c(2));
printf("I_gamma = %f\n", c(3));
printf("I_delta = %f\n", c(4));

printf("\n---- Potential differences ----\n");

# same as gamma
V1 = R1 * c(3)
# same as beta
V2 = R2 * c(2)
# same as beta, back for gamma
V3 = R3 * (c(2)-c(3))
# same as gamma and delta
V4 = R4 * (c(3)+c(4))
# same as beta, back for alpha
V5 = R5 * (c(2)-c(1))
# same as delta
V6 = R6 * c(4)
# same as delta
V7 = R7 * c(4)

printf("\n---- Conditional sources ----\n");

Ib = Kb * V3

Vc = - Kc * c(4)
