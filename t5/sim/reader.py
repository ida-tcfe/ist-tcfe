import numpy as np

v = []

def read(s, n):
    i = 0
    while (1):
        if (v[i] != "\n"):
            if(v[i].split()[0] == s):
                break
        i += 1
    return float(v[i].split()[n])

def read2(s, n, rep):
    i = 0
    while (1):
        if (v[i] != "\n"):
            if(v[i].split()[0] == s):
                break
        i += 1
    return float(v[i].split()[n].replace(rep,""))

def read3(s, n):
    i = 0
    while (1):
        if (v[i] != "\n"):
            if(v[i].split()[0] == s):
                break
        i += 1
    return [float(v[i].split()[n].split(",")[0]), float(v[i].split()[n].split(",")[1])]


f = open("lab.log", "r")

v = f.readlines()

f.close()

p = []
for i in range(1,22):
    p.append(read("p"+str(i), 2))

f = open("../mat/sim_data.txt", "w")

n = 0;
while (n < 21):
    f.write(str(p[n]) + "\n")
    n += 1

f.close()

max_gain = read("max", 2)
left = read("left", 2)
right = read("right", 2)
central_freq = np.sqrt(left*right)
#central_freq = float(v[i].split()[4])

inp = read3("zin", 2)
inp_r = inp[0]
inp_i = inp[1]

f = open("lab_zout.log", "r")

v = f.readlines()

f.close()

out = read3("zout", 2)
out_r = out[0]
out_i = out[1]

f = open("../doc/lab.tex", "w")

f.write("$f_c\; (Hz)$ & " + str(central_freq) + " \\\\ \n \hline \n")
f.write("$gain(f_c)\; (dB)$ & " + str(max_gain) + " \\\\ \n \hline \n")
f.write("$z_{in}$ & " + str(inp_r) + " + i ( " + str(inp_i) + " ) \\\\ \n \hline \n")
f.write("$z_{out}$ & " + str(out_r) + " + i ( " + str(out_i) + " ) \\\\ \n \hline \n")

f.close()
