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

f = open("../doc/lab.tex", "w")

f.write("$f_c\; (Hz)$ & " + str(central_freq) + "\\\\ \n")
f.write("$gain(f_c)\; (dB)$ & " + str(max_gain) + "\\\\ \n")
