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

v4ter = fter.readline()
if v4ter.find("-") != -1:
    v4ter = v4ter[14:23]
else:
    v4ter = v4ter[14:22]
v4ter = float(v4ter)
#print(v4ter)

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

vcter = fter.readline()
if vcter.find("-") != -1:
    vcter = vcter[14:23]
else:
    vcter = vcter[14:22]
vcter = float(vcter)

fter.readline()

vbter = fter.readline()
if vbter.find("-") != -1:
    vbter = vbter[14:23]
else:
    vbter = vbter[14:22]
vbter = float(vbter)

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

icter = fter.readline()
if icter.find("-") != -1:
    icter = icter[15:24]
else:
    icter = icter[15:23]
icter = float(icter)

fsim = open('../sim/op_tab.tex', 'r')

v2sim = fsim.readline()
v2sim = float(v2sim[9:21])
#print(v2sim)

v3sim = fsim.readline()
v3sim = float(v3sim[9:21])
#print(v3sim)

v4sim = fsim.readline()
v4sim = float(v4sim[9:21])
#print(v4sim)

v5sim = fsim.readline()
v5sim = float(v5sim[9:21])
#print(v5sim)

v6sim = fsim.readline()
v6sim = float(v6sim[9:21])
#print(v6sim)

v7sim = fsim.readline()
v7sim = float(v7sim[9:21])
#print(v7sim)

v8sim = fsim.readline()
v8sim = float(v8sim[9:21])
#print(v8sim)

vcsim = fsim.readline()
vcsim = float(vcsim[9:21])

vbsim = fsim.readline()
vbsim = float(vbsim[9:21])

r1sim = fsim.readline()
r1sim = float(r1sim[9:21])*1000
#print(r1sim)

r2sim = fsim.readline()
r2sim = float(r2sim[9:21])*1000

r3sim = fsim.readline()
r3sim = float(r3sim[9:21])*1000

r4sim = fsim.readline()
r4sim = float(r4sim[9:21])*1000

r5sim = fsim.readline()
r5sim = float(r5sim[9:21])*1000

r7sim = fsim.readline()
r7sim = float(r7sim[9:21])*1000
#print(r7sim)

ibsim = fsim.readline()
ibsim = float(ibsim[9:21])*1000

icsim = fsim.readline()
icsim = float(icsim[9:21])*1000

abs2 = math.fabs(v2ter-v2sim)
per2 = abs2*100 / math.fabs(v2ter)

abs3 = math.fabs(v3ter-v3sim)
per3 = abs3*100 / math.fabs(v3ter)

abs4 = math.fabs(v4ter-v4sim)
per4 = abs4*100 / math.fabs(v4ter)

abs5 = math.fabs(v5ter-v5sim)
per5 = abs5*100 / math.fabs(v5ter)

abs6 = math.fabs(v6ter-v6sim)
per6 = abs6*100 / math.fabs(v6ter)

abs7 = math.fabs(v7ter-v7sim)
per7 = abs7*100 / math.fabs(v7ter)

abs8 = math.fabs(v8ter-v8sim)
per8 = abs8*100 / math.fabs(v8ter)

absvc = math.fabs(vcter-vcsim)
pervc = absvc*100 / math.fabs(vcter)

absvb = math.fabs(vbter-vbsim)
pervb = absvb*100 / math.fabs(vbter)

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

absr7 = math.fabs(r7ter-r7sim)
perr7 = absr7*100 / math.fabs(r7ter)

absib = math.fabs(ibter-ibsim)
perib = absib*100 / math.fabs(ibter)

absic = math.fabs(icter-icsim)
peric = absic*100 / math.fabs(icter)

# Arredondamentos
per2 = err(per2)
per3 = err(per3)
per4 = err(per4)
per5 = err(per5)
per6 = err(per6)
per7 = err(per7)
per8 = err(per8)
pervc = err(pervc)
pervb = err(pervb)
perr1 = err(perr1)
perr2 = err(perr2)
perr3 = err(perr3)
perr4 = err(perr4)
perr5 = err(perr5)
perr7 = err(perr7)
perib = err(perib)
peric = err(peric)
abs2 = err(abs2)
abs3 = err(abs3)
abs4 = err(abs4)
abs5 = err(abs5)
abs6 = err(abs6)
abs7 = err(abs7)
abs8 = err(abs8)
absib = err(absib)
absic = err(absic)
absr1 = err(absr1)
absr2 = err(absr2)
absr3 = err(absr3)
absr4 = err(absr4)
absr5 = err(absr5)
absr7 = err(absr7)
absvb = err(absvb)
absvc = err(absvc)

fe = open('errors.tex', 'w')

fe.write('$V_2\;(V)$ & $'+str(v2ter)+'$ & $'+str(v2sim)+'$ & $'+str(abs2)+'$ & $'+str(per2)+'$ \\\\ \n')
fe.write('\hline \n')
fe.write('$V_3\;(V)$ & $'+str(v3ter)+'$ & $'+str(v3sim)+'$ & $'+str(abs3)+'$ & $'+str(per3)+'$ \\\\ \n')
fe.write('\hline \n')
fe.write('$V_4\;(V)$ & $'+str(v4ter)+'$ & $'+str(v4sim)+'$ & $'+str(abs4)+'$ & $'+str(per4)+'$ \\\\ \n')
fe.write('\hline \n')
fe.write('$V_5\;(V)$ & $'+str(v5ter)+'$ & $'+str(v5sim)+'$ & $'+str(abs5)+'$ & $'+str(per5)+'$ \\\\ \n')
fe.write('\hline \n')
fe.write('$V_6\;(V)$ & $'+str(v6ter)+'$ & $'+str(v6sim)+'$ & $'+str(abs6)+'$ & $'+str(per6)+'$ \\\\ \n')
fe.write('\hline \n')
fe.write('$V_7\;(V)$ & $'+str(v7ter)+'$ & $'+str(v7sim)+'$ & $'+str(abs7)+'$ & $'+str(per7)+'$ \\\\ \n')
fe.write('\hline \n')
fe.write('$V_8\;(V)$ & $'+str(v8ter)+'$ & $'+str(v8sim)+'$ & $'+str(abs8)+'$ & $'+str(per8)+'$ \\\\ \n')
fe.write('\hline \n')
fe.write('$V_c\;(V)$ & $'+str(vcter)+'$ & $'+str(vcsim)+'$ & $'+str(absvc)+'$ & $'+str(pervc)+'$ \\\\ \n')
fe.write('\hline \n')
fe.write('$V_b\;(V)$ & $'+str(vbter)+'$ & $'+str(vbsim)+'$ & $'+str(absvb)+'$ & $'+str(pervb)+'$ \\\\ \n')
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
fe.write('$I_7\;(mA)$ & $'+str(r7ter)+'$ & $'+str(r7sim)+'$ & $'+str(absr7)+'$ & $'+str(perr7)+'$ \\\\ \n')
fe.write('\hline \n')
fe.write('$I_b\;(mA)$ & $'+str(ibter)+'$ & $'+str(ibsim)+'$ & $'+str(absib)+'$ & $'+str(perib)+'$ \\\\ \n')
fe.write('\hline \n')
fe.write('$I_c\;(mA)$ & $'+str(icter)+'$ & $'+str(icsim)+'$ & $'+str(absic)+'$ & $'+str(peric)+'$ \\\\ \n')

fe.close()
fsim.close()
fter.close()
