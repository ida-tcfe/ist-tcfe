print("hello\n")

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

f.write("$V_{B1}$ (V) & " + str(vb1) + " & " + str(vb1_sim) + " & " + str(abs(vb1_sim-vb1)) + " & " + '{:4.2f}'.format(abs(vb1_sim-vb1)/abs(vb1_sim)*100) + " \\\\ \n \hline \n")
f.write("$V_{C1}$ (V) & " + str(vc1) + " & " + str(vc1_sim) + " & " + str(abs(vc1_sim-vc1)) + " & " + '{:4.2f}'.format(abs(vc1_sim-vc1)/abs(vc1_sim)*100) + " \\\\ \n \hline \n")
f.write("$V_{E1}$ (V) & " + str(ve1) + " & " + str(ve1_sim) + " & " + str(abs(ve1_sim-ve1)) + " & " + '{:4.2f}'.format(abs(ve1_sim-ve1)/abs(ve1_sim)*100) + " \\\\ \n \hline \n")
f.write("$V_{E2}$ (V) & " + str(ve2) + " & " + str(ve2_sim) + " & " + str(abs(ve2_sim-ve2)) + " & " + '{:4.2f}'.format(abs(ve2_sim-ve2)/abs(ve2_sim)*100) + " \\\\ \n \hline \n")

f.write("$I_{B1}$ (V) & " + str(ib1) + " & " + str(ib1_sim) + " & " + str(abs(ib1_sim-ib1)) + " & " + '{:4.2f}'.format(abs(ib1_sim-ib1)/abs(ib1_sim)*100) + " \\\\ \n \hline \n")
f.write("$I_{R1}$ (V) & " + str(ir1) + " & " + str(ir1_sim) + " & " + str(abs(ir1_sim-ir1)) + " & " + '{:4.2f}'.format(abs(ir1_sim-ir1)/abs(ir1_sim)*100) + " \\\\ \n \hline \n")
f.write("$I_{R2}$ (V) & " + str(ir2) + " & " + str(ir2_sim) + " & " + str(abs(ir2_sim-ir2)) + " & " + '{:4.2f}'.format(abs(ir2_sim-ir2)/abs(ir2_sim)*100) + " \\\\ \n \hline \n")
f.write("$I_{C1}$ (V) & " + str(ic1) + " & " + str(ic1_sim) + " & " + str(abs(ic1_sim-ic1)) + " & " + '{:4.2f}'.format(abs(ic1_sim-ic1)/abs(ic1_sim)*100) + " \\\\ \n \hline \n")
f.write("$I_{E1}$ (V) & " + str(ie1) + " & " + str(ie1_sim) + " & " + str(abs(ie1_sim-ie1)) + " & " + '{:4.2f}'.format(abs(ie1_sim-ie1)/abs(ie1_sim)*100) + " \\\\ \n \hline \n")
f.write("$I_{E2}$ (V) & " + str(ie2) + " & " + str(ie2_sim) + " & " + str(abs(ie2_sim-ie2)) + " & " + '{:4.2f}'.format(abs(ie2_sim-ie2)/abs(ie2_sim)*100) + " \\\\ \n \hline \n")

f.close()
