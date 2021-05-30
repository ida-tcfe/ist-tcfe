f = open("lab.log", "r")

v = f.readlines()

f.close()

i = 0;
while (1):
    if (v[i] != "\n"):
        #print(str(i) + v[i])
        if (v[i].split()[0] == "p1"):
            break
    i += 1

f = open("../mat/sim_data.txt", "w")

n = 0;
while (n < 21):
    f.write(str(float(v[i+n].split()[2])) + "\n")
    n += 1

f.close()

i = 0;
while (1):
    if (v[i] != "\n"):
        if (v[i].split()[0] == "max"):
            break
    i += 1

max_gain = float(v[i].split()[2])
central_freq = float(v[i].split()[4])

i = 0;
while (1):
    if (v[i] != "\n"):
        if (v[i].split()[0] == "v(in)[20]/vin#branch[20]/(1000)"):
            break
    i += 1

inp = v[i].split()[2]
inp_r = float(inp.split(",")[0])
inp_i = float(inp.split(",")[1])

f = open("lab_zout.log", "r")

v = f.readlines()

f.close()

i = 0;
while (1):
    if (v[i] != "\n"):
        if (v[i].split()[0] == "v(out)[20]/vout#branch[20]/(1000)"):
            break
    i += 1

out = v[i].split()[2]
out_r = float(out.split(",")[0])
out_i = float(out.split(",")[1])

f = open("../doc/lab.tex", "w")

f.write("$f_c\; (Hz)$ & " + str(central_freq) + "\\\\ \n")
f.write("$gain(f_c)\; (dB)$ & " + str(max_gain) + "\\\\ \n")
f.write("$z_{in}$ & " + str(inp_r) + " + i " + str(inp_i) + "\\\\ \n")
f.write("$z_{out}$ & " + str(out_r) + " + i " + str(out_i) + "\\\\ \n")

f.close()
