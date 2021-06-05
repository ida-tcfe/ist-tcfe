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
        #print(str(i) + ": " + v[i])
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

# ---------------------------------------------------------------------------------------

f = open("mb.log", "r")

v = f.readlines()

f.close()

p = []
for i in range(1,22):
    p.append(read("p"+str(i), 2))

f = open("../mat/sim_data_mb.txt", "w")

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

f = open("mb_zout.log", "r")

v = f.readlines()

f.close()

out = read3("zout", 2)
out_r = out[0]
out_i = out[1]

f = open("../doc/mb.tex", "w")

f.write("$f_c\; (Hz)$ & " + str(central_freq) + " \\\\ \n \hline \n")
f.write("$gain(f_c)\; (dB)$ & " + str(max_gain) + " \\\\ \n \hline \n")
f.write("$z_{in}$ & " + str(inp_r) + " + i ( " + str(inp_i) + " ) \\\\ \n \hline \n")
f.write("$z_{out}$ & " + str(out_r) + " + i ( " + str(out_i) + " ) \\\\ \n \hline \n")

f.close()

# Calculate merit

f = open("t5_mb.net")

v = f.readlines()

R1 = read2("R1", 3, "k")
R4 = read2("R4", 3, "k")
R5 = read2("R5", 3, "k")
R2 = read2("R2", 3, "k")

Cin = read2("Cin", 3, "uF")
Cout = read2("Cout", 3, "uF")

cost = R1 + R2 + R4 + R5 + Cin + Cout

merit = 1 / (cost * abs(40-max_gain) * abs(central_freq - 1000) + 10e-6)

print("Central frequency: " + str(central_freq))
print("Gain at central frequency: " + str(max_gain))
print("Merit: " + str(merit))

f.close()

f = open("merit_mb.tex", "w")
f.write('{:.0f}'.format(merit))
f.close()
