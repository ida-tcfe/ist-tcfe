print("hello\n")


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
    n = num*(10**pow)
    if (pow > 0):
        pow = 0
    st = '{:.' + str(int(-pow)) + 'f}'
    return st.format(n)

f = open("mat/ft4.tex", "r")

v = f.readlines()

vb1 = float(v[4].split()[3])
vc1 = float(v[6].split()[3])
ve1 = float(v[8].split()[3])
ve2 = float(v[10].split()[3])

ib1 = float(v[12].split()[3]) /1000
ir1 = float(v[14].split()[3]) /1000
ir2 = float(v[16].split()[3]) /1000
ic1 = float(v[18].split()[3]) /1000
ie1 = float(v[20].split()[3]) /1000
ie2 = float(v[22].split()[3]) /1000

f.close()

f = open("sim/op_tab.tex", "r")

v = f.readlines()

vb1_sim = float(v[3].split()[3])
vc1_sim = float(v[4].split()[3])
ve1_sim = float(v[5].split()[3])
ve2_sim = float(v[6].split()[3])

ib1_sim = float(v[18].split()[3])
ir1_sim = float(v[9].split()[3])
ir2_sim = float(v[10].split()[3])
ic1_sim = float(v[20].split()[3])
ie1_sim = float(v[19].split()[3])
ie2_sim = float(v[21].split()[3])

f.close()

f = open("doc/comparison.tex", "w")

f.write("$V_{B1}$ (V) & " + str(vb1) + " & " + str(vb1_sim) + " & " + err(abs(vb1_sim-vb1)) + " & " + err(abs(vb1_sim-vb1)/abs(vb1_sim)*100) + " \\\\ \n \hline \n")
f.write("$V_{C1}$ (V) & " + str(vc1) + " & " + str(vc1_sim) + " & " + err(abs(vc1_sim-vc1)) + " & " + err(abs(vc1_sim-vc1)/abs(vc1_sim)*100) + " \\\\ \n \hline \n")
f.write("$V_{E1}$ (V) & " + str(ve1) + " & " + str(ve1_sim) + " & " + err(abs(ve1_sim-ve1)) + " & " + err(abs(ve1_sim-ve1)/abs(ve1_sim)*100) + " \\\\ \n \hline \n")
f.write("$V_{E2}$ (V) & " + str(ve2) + " & " + str(ve2_sim) + " & " + err(abs(ve2_sim-ve2)) + " & " + err(abs(ve2_sim-ve2)/abs(ve2_sim)*100) + " \\\\ \n \hline \n")

f.write("$I_{B1}$ (V) & " + str(ib1) + " & " + str(ib1_sim) + " & " + err(abs(ib1_sim-ib1)) + " & " + err(abs(ib1_sim-ib1)/abs(ib1_sim)*100) + " \\\\ \n \hline \n")
f.write("$I_{R1}$ (V) & " + str(ir1) + " & " + str(ir1_sim) + " & " + err(abs(ir1_sim-ir1)) + " & " + err(abs(ir1_sim-ir1)/abs(ir1_sim)*100) + " \\\\ \n \hline \n")
f.write("$I_{R2}$ (V) & " + str(ir2) + " & " + str(ir2_sim) + " & " + err(abs(ir2_sim-ir2)) + " & " + err(abs(ir2_sim-ir2)/abs(ir2_sim)*100) + " \\\\ \n \hline \n")
f.write("$I_{C1}$ (V) & " + str(ic1) + " & " + str(ic1_sim) + " & " + err(abs(ic1_sim-ic1)) + " & " + err(abs(ic1_sim-ic1)/abs(ic1_sim)*100) + " \\\\ \n \hline \n")
f.write("$I_{E1}$ (V) & " + str(ie1) + " & " + str(ie1_sim) + " & " + err(abs(ie1_sim-ie1)) + " & " + err(abs(ie1_sim-ie1)/abs(ie1_sim)*100) + " \\\\ \n \hline \n")
f.write("$I_{E2}$ (V) & " + str(ie2) + " & " + str(ie2_sim) + " & " + err(abs(ie2_sim-ie2)) + " & " + err(abs(ie2_sim-ie2)/abs(ie2_sim)*100) + " \\\\ \n \hline \n")

f.close()
