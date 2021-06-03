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

f = open("doc/centralf.tex", "r")

v = f.readlines()

fc = float(v[0].split()[3])
gain = float(v[1].split()[3])
zinr = float(v[1].split()[2])
zini = float(v[2].split()[6])
zoutr = float(v[3].split()[2])
zouti = float(v[3].split()[6])

f.close()

f = open("doc/lab.tex", "r")

v = f.readlines()

fc_sim = float(v[0].split()[3])
gain_sim = float(v[1].split()[3])
zinr_sim = float(v[1].split()[2])
zini_sim = float(v[2].split()[6])
zoutr_sim = float(v[3].split()[2])
zouti_sim = float(v[3].split()[6])

f.close()

f = open("doc/comparison.tex", "w")

f.write("$f_c\; (Hz)$ & " + str(fc) + " & " + str(fc_sim) + " & " + err(abs(fc_sim-fc)) + " & " + err(abs(fc_sim-fc)/abs(fc_sim)*100) + " \\\\ \n \hline \n")
f.write("$gain(f_c)\; (V)$ & " + str(gain) + " & " + str(gain_sim) + " & " + err(abs(gain_sim-gain)) + " & " + err(abs(gain_sim-gain)/abs(gain_sim)*100) + " \\\\ \n \hline \n")
f.write("$Re(z_{in})$ & " + str(zinr) + " & " + str(zinr_sim) + " & " + err(abs(zinr_sim-zinr)) + " & " + err(abs(zinr_sim-zinr)/abs(zinr_sim)*100) + " \\\\ \n \hline \n")
f.write("$Im(z_{in})$ & " + str(zini) + " & " + str(zini_sim) + " & " + err(abs(zini_sim-zini)) + " & " + err(abs(zini_sim-zini)/abs(zini_sim)*100) + " \\\\ \n \hline \n")
f.write("$Re(z_{out})$ & " + str(zoutr) + " & " + str(zoutr_sim) + " & " + err(abs(zoutr_sim-zoutr)) + " & " + err(abs(zoutr_sim-zoutr)/abs(zoutr_sim)*100) + " \\\\ \n \hline \n")
f.write("$Im(z_{out})$ & " + str(zouti) + " & " + str(zouti_sim) + " & " + err(abs(zouti_sim-zouti)) + " & " + err(abs(zouti_sim-zouti)/abs(zouti_sim)*100) + " \\\\ \n \hline \n")

f.close()
