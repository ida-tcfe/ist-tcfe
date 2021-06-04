print("hello\n")

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

f = open("ngspice.log", "r")

v = f.readlines()

#print(v[57], v[58], v[59])

avg = read("average", 2)
ma = read("max", 4)
mi = read("min", 4)

print("Average: " + str(avg) + " V")
print("Ripple: " + str(ma-mi) + " V")

f.close()

f = open("t3.net", "r")

v = f.readlines()

r1 = read2("R1", 3, "k")
r3 = read2("R3", 3, "k")

c = read2("C1", 3, "uF")

print("R1 = ", r1)
print("R2 = ", r3)
print("C = ", c)

n_diodes = 18

print("Number of diodes = " +  str(n_diodes))

f.close()

cost = r1 + r3 + 0.1*n_diodes + c

merit = 1 / (cost * (ma-mi + abs(avg-12) + 10e-6))

print("Merit figure: " + str(merit))

f = open("parameters.tex", "w")
f.write("R1($k\Omega$) & " + str(r1) + "\\\\ \n")
f.write("R2($k\Omega$) & " + str(r3) + "\\\\ \n")
f.write("C(uF) & " + str(c) + "\\\\ \n")
f.write("N & " + str(n_diodes) + "\\\\ \n")
f.close()

f = open("merit.tex", "w")
f.write('{:5.4f}'.format(merit))
f.close()

f = open("out.tex", "w")
f.write("Average & " + str(avg) + "\\\\ \n")
f.write("\hline \n")
f.write("Ripple & " + str(ma-mi) + "\\\\ \n")
f.close()
