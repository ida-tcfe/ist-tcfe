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

fsim = open('../sim/op_tab.tex', 'r')

v2sim = fsim.readline()
v2sim = float(v2sim[9:17])
#print(v2sim)

v3sim = fsim.readline()
v3sim = float(v3sim[9:17])
#print(v3sim)

v4sim = fsim.readline()
v4sim = float(v4sim[9:17])
#print(v4sim)

v5sim = fsim.readline()
v5sim = float(v5sim[9:17])
#print(v5sim)

v6sim = fsim.readline()
v6sim = float(v6sim[9:17])
#print(v6sim)

v7sim = fsim.readline()
v7sim = float(v7sim[9:17])
#print(v7sim)

v8sim = fsim.readline()
v8sim = float(v8sim[9:17])
#print(v8sim)

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

# Arredondamentos
per2 = err(per2)
per3 = err(per3)
per4 = err(per4)
per5 = err(per5)
per6 = err(per6)
per7 = err(per7)
per8 = err(per8)

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

fe.close()
fsim.close()
fter.close()
