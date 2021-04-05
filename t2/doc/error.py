import math
import numpy as np

def err(x):
    if (x == 0):
        return 0
    num = float("{:e}".format(x).split('e')[0])
    pow = float("{:e}".format(x).split('e')[1])
    num = np.ceil(num)
    if (x >= num*(10**pow)):
        num += 1
        if (num == 10):
            num = 0
            pow += 1
    return num*(10**pow)

fter = open('../mat/node.tex', 'r')

v1ter = fter.readline()
if v1ter.find("-") != -1:
    v1ter = v1ter[14:23]
else:
    v1ter = v1ter[14:22]
v1ter = float(v1ter)
#print(v1ter)

fter.readline()

v2ter = fter.readline()
if v2ter.find("-") != -1:
    v2ter = v2ter[14:23]
else:
    v2ter = v2ter[14:22]
v2ter = float(v2ter)
#print(v2ter)

fter.readline()

v3ter = fter.readline()
if v3ter.find("-") != -1:
    v3ter = v3ter[14:23]
else:
    v3ter = v3ter[14:22]
v3ter = float(v3ter)
#print(v3ter)

fter.readline()

v5ter = fter.readline()
if v5ter.find("-") != -1:
    v5ter = v5ter[14:23]
else:
    v5ter = v5ter[14:22]
v5ter = float(v5ter)
#print(v5ter)

fter.readline()

v6ter = fter.readline()
if v6ter.find("-") != -1:
    v6ter = v6ter[14:23]
else:
    v6ter = v6ter[14:22]
v6ter = float(v6ter)
#print(v6ter)

fter.readline()

v7ter = fter.readline()
if v7ter.find("-") != -1:
    v7ter = v7ter[14:23]
else:
    v7ter = v7ter[14:22]
v7ter = float(v7ter)
#print(v7ter)

fter.readline()

v8ter = fter.readline()
if v8ter.find("-") != -1:
    v8ter = v8ter[14:23]
else:
    v8ter = v8ter[14:22]
v8ter = float(v8ter)
#print(v8ter)

fter.readline()

r1ter = fter.readline()
if r1ter.find("-") != -1:
    r1ter = r1ter[15:24]
else:
    r1ter = r1ter[15:23]
r1ter = float(r1ter)

fter.readline()

r2ter = fter.readline()
if r2ter.find("-") != -1:
    r2ter = r2ter[15:24]
else:
    r2ter = r2ter[15:23]
r2ter = float(r2ter)

fter.readline()

r3ter = fter.readline()
if r3ter.find("-") != -1:
    r3ter = r3ter[15:24]
else:
    r3ter = r3ter[15:23]
r3ter = float(r3ter)

fter.readline()

r4ter = fter.readline()
if r4ter.find("-") != -1:
    r4ter = r4ter[15:24]
else:
    r4ter = r4ter[15:23]
r4ter = float(r4ter)

fter.readline()

r5ter = fter.readline()
if r5ter.find("-") != -1:
    r5ter = r5ter[15:24]
else:
    r5ter = r5ter[15:23]
r5ter = float(r5ter)

fter.readline()

r6ter = fter.readline()
if r6ter.find("-") != -1:
    r6ter = r6ter[15:24]
else:
    r6ter = r6ter[15:23]
r6ter = float(r6ter)

fter.readline()

r7ter = fter.readline()
if r7ter.find("-") != -1:
    r7ter = r7ter[15:24]
else:
    r7ter = r7ter[15:23]
r7ter = float(r7ter)

fter.readline()

ibter = fter.readline()
if ibter.find("-") != -1:
    ibter = ibter[15:24]
else:
    ibter = ibter[15:23]
ibter = float(ibter)

fter.readline()

ivdter = fter.readline()
if ivdter.find("-") != -1:
    ivdter = ivdter[16:25]
else:
    ivdter = ivdter[16:24]
ivdter = float(ivdter)

fter.readline()

ivster = fter.readline()
if ivster.find("-") != -1:
    ivster = ivster[16:25]
else:
    ivster = ivster[16:24]
ivster = float(ivster)

fsim = open('../sim/op_ng1_tab.tex', 'r')

v1sim = fsim.readline()
v1sim = float(format(float(v1sim[9:21]),'.6f'))
#print(v1sim)

v2sim = fsim.readline()
v2sim = float(format(float(v2sim[9:21]),'.6f'))
#print(v2sim)

v3sim = fsim.readline()
v3sim = float(format(float(v3sim[9:21]),'.6f'))
#print(v3sim)

v5sim = fsim.readline()
v5sim = float(format(float(v5sim[9:21]),'.6f'))
#print(v5sim)

v6sim = fsim.readline()
v6sim = float(format(float(v6sim[9:21]),'.6f'))
#print(v6sim)

v7sim = fsim.readline()
v7sim = float(format(float(v7sim[9:21]),'.6f'))
#print(v7sim)

v8sim = fsim.readline()
v8sim = float(format(float(v8sim[9:21]),'.6f'))
#print(v8sim)

r1sim = fsim.readline()
r1sim = float(format(float(r1sim[9:21])*1000,'.6f'))
#print(r1sim)

r2sim = fsim.readline()
r2sim = float(format(float(r2sim[9:21])*1000,'.6f'))

r3sim = fsim.readline()
r3sim = float(format(float(r3sim[9:21])*1000,'.6f'))

r4sim = fsim.readline()
r4sim = float(format(float(r4sim[9:21])*1000,'.6f'))
#print(r4sim)

r5sim = fsim.readline()
r5sim = float(format(float(r5sim[9:21])*1000,'.6f'))

r6sim = fsim.readline()
r6sim = float(format(float(r6sim[9:21])*1000,'.6f'))

r7sim = fsim.readline()
r7sim = float(format(float(r7sim[9:21])*1000,'.6f'))
#print(r7sim)

ibsim = fsim.readline()
ibsim = float(format(float(ibsim[9:21])*1000,'.6f'))

ivdsim = fsim.readline()
ivdsim = float(format(float(ivdsim[10:22])*1000,'.6f'))

ivssim = fsim.readline()
ivssim = float(format(float(ivssim[10:22])*1000,'.6f'))

abs1 = math.fabs(v1ter-v1sim)
per1 = abs1*100 / math.fabs(v1ter)

abs2 = math.fabs(v2ter-v2sim)
per2 = abs2*100 / math.fabs(v2ter)

abs3 = math.fabs(v3ter-v3sim)
per3 = abs3*100 / math.fabs(v3ter)

abs5 = math.fabs(v5ter-v5sim)
per5 = abs5*100 / math.fabs(v5ter)

abs6 = math.fabs(v6ter-v6sim)
per6 = abs6*100 / math.fabs(v6ter)

abs7 = math.fabs(v7ter-v7sim)
per7 = abs7*100 / math.fabs(v7ter)

abs8 = math.fabs(v8ter-v8sim)
per8 = abs8*100 / math.fabs(v8ter)

absr1 = math.fabs(r1ter-r1sim)
perr1 = absr1*100 / math.fabs(r1ter)

absr2 = math.fabs(r2ter-r2sim)
perr2 = absr2*100 / math.fabs(r2ter)

absr3 = math.fabs(r3ter-r3sim)
perr3 = absr3*100 / math.fabs(r3ter)

absr4 = math.fabs(r4ter-r4sim)
perr4 = absr4*100 / math.fabs(r4ter)

absr5 = math.fabs(r5ter-r5sim)
perr5 = absr5*100 / math.fabs(r5ter)

absr6 = math.fabs(r6ter-r6sim)
perr6 = absr6*100 / math.fabs(r6ter)

absr7 = math.fabs(r7ter-r7sim)
perr7 = absr7*100 / math.fabs(r7ter)

absib = math.fabs(ibter-ibsim)
perib = absib*100 / math.fabs(ibter)

absivd = math.fabs(ivdter-ivdsim)
perivd = absivd*100 / math.fabs(ivdter)

absivs = math.fabs(ivster-ivssim)
perivs = absivs*100 / math.fabs(ivster)

# Arredondamentos
per1 = err(per1)
per2 = err(per2)
per3 = err(per3)
per5 = err(per5)
per6 = err(per6)
per7 = err(per7)
per8 = err(per8)
perr1 = err(perr1)
perr2 = err(perr2)
perr3 = err(perr3)
perr4 = err(perr4)
perr5 = err(perr5)
perr6 = err(perr6)
perr7 = err(perr7)
perib = err(perib)
perivd = err(perivd)
perivs = err(perivs)
abs1 = err(abs1)
abs2 = err(abs2)
abs3 = err(abs3)
abs5 = err(abs5)
abs6 = err(abs6)
abs7 = err(abs7)
abs8 = err(abs8)
absib = err(absib)
absr1 = err(absr1)
absr2 = err(absr2)
absr3 = err(absr3)
absr4 = err(absr4)
absr5 = err(absr5)
absr6 = err(absr6)
absr7 = err(absr7)
absivd = err(absivd)
absivs = err(absivs)

fe = open('errors1.tex', 'w')

fe.write('$V_1\;(V)$ & $'+str(v1ter)+'$ & $'+str(v1sim)+'$ & $'+str(abs1)+'$ & $'+str(per1)+'$ \\\\ \n')
fe.write('\hline \n')
fe.write('$V_2\;(V)$ & $'+str(v2ter)+'$ & $'+str(v2sim)+'$ & $'+str(abs2)+'$ & $'+str(per2)+'$ \\\\ \n')
fe.write('\hline \n')
fe.write('$V_3\;(V)$ & $'+str(v3ter)+'$ & $'+str(v3sim)+'$ & $'+str(abs3)+'$ & $'+str(per3)+'$ \\\\ \n')
fe.write('\hline \n')
fe.write('$V_5\;(V)$ & $'+str(v5ter)+'$ & $'+str(v5sim)+'$ & $'+str(abs5)+'$ & $'+str(per5)+'$ \\\\ \n')
fe.write('\hline \n')
fe.write('$V_6\;(V)$ & $'+str(v6ter)+'$ & $'+str(v6sim)+'$ & $'+str(abs6)+'$ & $'+str(per6)+'$ \\\\ \n')
fe.write('\hline \n')
fe.write('$V_7\;(V)$ & $'+str(v7ter)+'$ & $'+str(v7sim)+'$ & $'+str(abs7)+'$ & $'+str(per7)+'$ \\\\ \n')
fe.write('\hline \n')
fe.write('$V_8\;(V)$ & $'+str(v8ter)+'$ & $'+str(v8sim)+'$ & $'+str(abs8)+'$ & $'+str(per8)+'$ \\\\ \n')
fe.write('\hline \n')
fe.write('$I_1\;(mA)$ & $'+str(r1ter)+'$ & $'+str(r1sim)+'$ & $'+str(absr1)+'$ & $'+str(perr1)+'$ \\\\ \n')
fe.write('\hline \n')
fe.write('$I_2\;(mA)$ & $'+str(r2ter)+'$ & $'+str(r2sim)+'$ & $'+str(absr2)+'$ & $'+str(perr2)+'$ \\\\ \n')
fe.write('\hline \n')
fe.write('$I_3\;(mA)$ & $'+str(r3ter)+'$ & $'+str(r3sim)+'$ & $'+str(absr3)+'$ & $'+str(perr3)+'$ \\\\ \n')
fe.write('\hline \n')  
fe.write('$I_4\;(mA)$ & $'+str(r4ter)+'$ & $'+str(r4sim)+'$ & $'+str(absr4)+'$ & $'+str(perr4)+'$ \\\\ \n')
fe.write('\hline \n')
fe.write('$I_5\;(mA)$ & $'+str(r5ter)+'$ & $'+str(r5sim)+'$ & $'+str(absr5)+'$ & $'+str(perr5)+'$ \\\\ \n')
fe.write('\hline \n')
fe.write('$I_6\;(mA)$ & $'+str(r6ter)+'$ & $'+str(r6sim)+'$ & $'+str(absr6)+'$ & $'+str(perr6)+'$ \\\\ \n')
fe.write('\hline \n')
fe.write('$I_7\;(mA)$ & $'+str(r7ter)+'$ & $'+str(r7sim)+'$ & $'+str(absr7)+'$ & $'+str(perr7)+'$ \\\\ \n')
fe.write('\hline \n')
fe.write('$I_b\;(mA)$ & $'+str(ibter)+'$ & $'+str(ibsim)+'$ & $'+str(absib)+'$ & $'+str(perib)+'$ \\\\ \n')
fe.write('\hline \n')
fe.write('$IV_d\;(mA)$ & $'+str(ivdter)+'$ & $'+str(ivdsim)+'$ & $'+str(absivd)+'$ & $'+str(perivd)+'$ \\\\ \n')
fe.write('\hline \n')
fe.write('$IV_s\;(mA)$ & $'+str(ivster)+'$ & $'+str(ivssim)+'$ & $'+str(absivs)+'$ & $'+str(perivs)+'$ \\\\ \n')

fe.close()
fsim.close()
fter.close()

fter = open('../mat/nodeReq.tex', 'r')

v1ter = fter.readline()
if v1ter.find("-") != -1:
    v1ter = v1ter[14:23]
else:
    v1ter = v1ter[14:22]
v1ter = float(v1ter)
#print(v1ter)

fter.readline()

v2ter = fter.readline()
if v2ter.find("-") != -1:
    v2ter = v2ter[14:23]
else:
    v2ter = v2ter[14:22]
v2ter = float(v2ter)
#print(v2ter)

fter.readline()

v3ter = fter.readline()
if v3ter.find("-") != -1:
    v3ter = v3ter[14:23]
else:
    v3ter = v3ter[14:22]
v3ter = float(v3ter)
#print(v3ter)

fter.readline()

v5ter = fter.readline()
if v5ter.find("-") != -1:
    v5ter = v5ter[14:23]
else:
    v5ter = v5ter[14:22]
v5ter = float(v5ter)
#print(v5ter)

fter.readline()

v6ter = fter.readline()
if v6ter.find("-") != -1:
    v6ter = v6ter[14:23]
else:
    v6ter = v6ter[14:22]
v6ter = float(v6ter)
#print(v6ter)

fter.readline()

v7ter = fter.readline()
if v7ter.find("-") != -1:
    v7ter = v7ter[14:23]
else:
    v7ter = v7ter[14:22]
v7ter = float(v7ter)
#print(v7ter)

fter.readline()

v8ter = fter.readline()
if v8ter.find("-") != -1:
    v8ter = v8ter[14:23]
else:
    v8ter = v8ter[14:22]
v8ter = float(v8ter)

fter.close()

fsim = open('../sim/op_ng2_tab.tex', 'r')

v1sim = fsim.readline()
v1sim = float(format(float(v1sim[9:21]),'.6f'))
#print(v1sim)

v2sim = fsim.readline()
v2sim = float(format(float(v2sim[9:21]),'.6f'))
#print(v2sim)

v3sim = fsim.readline()
v3sim = float(format(float(v3sim[9:21]),'.6f'))
#print(v3sim)

v5sim = fsim.readline()
v5sim = float(format(float(v5sim[9:21]),'.6f'))
#print(v5sim)

v6sim = fsim.readline()
v6sim = float(format(float(v6sim[9:21]),'.6f'))
#print(v6sim)

v7sim = fsim.readline()
v7sim = float(format(float(v7sim[9:21]),'.6f'))
#print(v7sim)

v8sim = fsim.readline()
v8sim = float(format(float(v8sim[9:21]),'.6f'))
#print(v8sim)

abs1 = math.fabs(v1ter-v1sim)
#per1 = abs1*100 / math.fabs(v1ter)

abs2 = math.fabs(v2ter-v2sim)
#per2 = abs2*100 / math.fabs(v2ter)

abs3 = math.fabs(v3ter-v3sim)
#per3 = abs3*100 / math.fabs(v3ter)

abs5 = math.fabs(v5ter-v5sim)
#per5 = abs5*100 / math.fabs(v5ter)

abs6 = math.fabs(v6ter-v6sim)
#per6 = abs6*100 / math.fabs(v6ter)

abs7 = math.fabs(v7ter-v7sim)
#per7 = abs7*100 / math.fabs(v7ter)

abs8 = math.fabs(v8ter-v8sim)
#per8 = abs8*100 / math.fabs(v8ter)

#per1 = err(per1)
#per2 = err(per2)
#per3 = err(per3)
#per5 = err(per5)
#per6 = err(per6)
#per7 = err(per7)
#per8 = err(per8)
abs1 = err(abs1)
abs2 = err(abs2)
abs3 = err(abs3)
abs5 = err(abs5)
abs6 = err(abs6)
abs7 = err(abs7)
abs8 = err(abs8)

fsim.close()

fe = open('errors2.tex', 'w')

fe.write('$V_1\;(V)$ & $'+str(v1ter)+'$ & $'+str(v1sim)+'$ & $'+str(abs1)+'$ \\\\ \n')
fe.write('\hline \n')
fe.write('$V_2\;(V)$ & $'+str(v2ter)+'$ & $'+str(v2sim)+'$ & $'+str(abs2)+'$ \\\\ \n')
fe.write('\hline \n')
fe.write('$V_3\;(V)$ & $'+str(v3ter)+'$ & $'+str(v3sim)+'$ & $'+str(abs3)+'$ \\\\ \n')
fe.write('\hline \n')
fe.write('$V_5\;(V)$ & $'+str(v5ter)+'$ & $'+str(v5sim)+'$ & $'+str(abs5)+'$ \\\\ \n')
fe.write('\hline \n')
fe.write('$V_6\;(V)$ & $'+str(v6ter)+'$ & $'+str(v6sim)+'$ & $'+str(abs6)+'$  \\\\ \n')
fe.write('\hline \n')
fe.write('$V_7\;(V)$ & $'+str(v7ter)+'$ & $'+str(v7sim)+'$ & $'+str(abs7)+'$ \\\\ \n')
fe.write('\hline \n')
fe.write('$V_8\;(V)$ & $'+str(v8ter)+'$ & $'+str(v8sim)+'$ & $'+str(abs8)+'$ \\\\ \n')

fe.close()