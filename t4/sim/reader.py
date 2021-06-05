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

print("\n---- Circuit 1 ----\n")

f = open("ngspice.log", "r")

v = f.readlines()

ma = read("max", 2)
ma = pow(10, ma/20.)
left = read("left", 2)
right = read("right", 2)

print("Voltage gain: " + str(ma) + " V")
print("Lower cuttoff frequency: " + str(left) + " Hz")
print("Bandwidth: " + str(right-left) + " Hz")

inp = read3("zin", 2)
inp_r = inp[0]
inp_i = inp[1]

print("Input impedance: " + str(inp_r) + ", " + str(inp_i))

f.close()

f = open("ngspice2.log", "r")

v = f.readlines()

out = read3("zout", 2)
out_r = out[0]
out_i = out[1]

print("Output impedance: " + str(out_r) + ", " + str(out_i))

f.close()

f = open("t4.net", "r")

v = f.readlines()

rin = 0.1

ci = read2("Cin", 3, "uF")

r1 = read2("R1", 3, "k")
r2 = read2("R2", 3, "k")

rc = read2("Rc", 3, "k")
re = read2("Re", 3, "k")

cb = read2("Cb", 3, "uF")

rout = read2("Rout", 3, "k")

co = read2("Co", 3, "uF")

print("R1 = ", r1)
print("R2 = ", r2)
print("Rc = ", rc)
print("Re = ", re)
print("Rout = ", rout)
#print("Rl = ", rl)
print("Cin = ", ci)
print("Cb = ", cb)
print("Co = ", co)

f.close()

cost = r1 + r2 + rc+ re + rout + ci + cb + co + 0.2

merit = ma * (right-left) / (cost * left)

print("Merit figure: " + str(merit))

f = open("parameters.tex", "w")
f.write("$R_1$($k\Omega$) & " + str(r1) + "\\\\ \n")
f.write("$R_2$($k\Omega$) & " + str(r2) + "\\\\ \n")
f.write("$R_c$($k\Omega$) & " + str(rc) + "\\\\ \n")
f.write("$R_e$($k\Omega$) & " + str(re) + "\\\\ \n")
f.write("$R_{out}$($k\Omega$) & " + str(rout) + "\\\\ \n")
#f.write("$R_l$($k\Omega$) & " + str(rl) + "\\\\ \n")
f.write("$C_i$($\mu F$) & " + str(ci) + "\\\\ \n")
f.write("$C_b$($\mu F$) & " + str(cb) + "\\\\ \n")
f.write("$C_o$($\mu F$) & " + str(co) + "\\\\ \n")
f.close()

f = open("merit.tex", "w")
f.write('{:.0f}'.format(merit))
f.close()

f = open("out.tex", "w")
f.write("Voltage gain & " + str(ma) + "\\\\ \n")
f.write("\hline \n")
f.write("Lower cutoff frequency & " + str(left) + "\\\\ \n")
f.write("\hline \n")
f.write("Bandwidth & " + str(right-left) + "\\\\ \n")
f.close()

f = open("impedances.tex", "w")
f.write("Input & " + str(inp_r) + "+i" + str(inp_i) + "\\\\ \n")
f.write("\hline \n")
f.write("Output & " + str(out_r) + "+i" + str(out_i) + "\\\\ \n")
f.close()

print("\n---- Circuit 2 ----\n")

f = open("ngspice_mb.log", "r")

v = f.readlines()

ma = read("max", 2)
ma = pow(10, ma/20.)
left = read("left", 2)
right = read("right", 2)

print("Voltage gain: " + str(ma) + " V")
print("Lower cuttoff frequency: " + str(left) + " Hz")
print("Bandwidth: " + str(right-left) + " Hz")

inp = read3("zin_mb", 2)
inp_r = inp[0]
inp_i = inp[1]

print("Input impedance: " + str(inp_r) + ", " + str(inp_i))

f.close()

f = open("ngspice2_mb.log", "r")

v = f.readlines()

out = read3("zout_mb", 2)
out_r = out[0]
out_i = out[1]

print("Output impedance: " + str(out_r) + ", " + str(out_i))

f.close()

f = open("t4_mb.net", "r")

v = f.readlines()

rin = 0.1

ci = read2("Cin", 3, "uF")

r1 = read2("R1", 3, "k")
r2 = read2("R2", 3, "k")

rc = read2("Rc", 3, "k")
re = read2("Re", 3, "k")

cb = read2("Cb", 3, "uF")

rout = read2("Rout", 3, "k")

co = read2("Co", 3, "uF")

print("R1 = ", r1)
print("R2 = ", r2)
print("Rc = ", rc)
print("Re = ", re)
print("Rout = ", rout)
#print("Rl = ", rl)
print("Cin = ", ci)
print("Cb = ", cb)
print("Co = ", co)

f.close()

cost = r1 + r2 + rc+ re + rout + ci + cb + co + 0.2

merit = ma * (right-left) / (cost * left)

print("Merit figure: " + str(merit))

f = open("parameters_mb.tex", "w")
f.write("$R_1$($k\Omega$) & " + str(r1) + "\\\\ \n")
f.write("$R_2$($k\Omega$) & " + str(r2) + "\\\\ \n")
f.write("$R_c$($k\Omega$) & " + str(rc) + "\\\\ \n")
f.write("$R_e$($k\Omega$) & " + str(re) + "\\\\ \n")
f.write("$R_{out}$($k\Omega$) & " + str(rout) + "\\\\ \n")
#f.write("$R_l$($k\Omega$) & " + str(rl) + "\\\\ \n")
f.write("$C_i$($\mu F$) & " + str(ci) + "\\\\ \n")
f.write("$C_b$($\mu F$) & " + str(cb) + "\\\\ \n")
f.write("$C_o$($\mu F$) & " + str(co) + "\\\\ \n")
f.close()

f = open("merit_mb.tex", "w")
f.write('{:.0f}'.format(merit))
f.close()

f = open("out_mb.tex", "w")
f.write("Voltage gain & " + str(ma) + "\\\\ \n")
f.write("\hline \n")
f.write("Lower cutoff frequency & " + str(left) + "\\\\ \n")
f.write("\hline \n")
f.write("Bandwidth & " + str(right-left) + "\\\\ \n")
f.close()

f = open("impedances_mb.tex", "w")
f.write("Input & " + str(inp_r) + "+i" + str(inp_i) + "\\\\ \n")
f.write("\hline \n")
f.write("Output & " + str(out_r) + "+i" + str(out_i) + "\\\\ \n")
f.close()
