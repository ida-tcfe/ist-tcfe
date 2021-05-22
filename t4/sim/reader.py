print("hello\n")

f = open("ngspice.log", "r")

v = f.readlines()

ma = float(v[35].split()[4])
left = float(v[36].split()[2])
right = float(v[37].split()[2])

print("Voltage gain: " + str(ma) + " V")
print("Lower cuttoff frequency: " + str(left) + " Hz")
print("Bandwidth: " + str(right-left) + " Hz")

f.close()

f = open("t4.net", "r")

v = f.readlines()

rin = 0.1

ci = float(v[11].split()[3].replace("uF",""))

r1 = float(v[14].split()[3].replace("k",""))
r2 = float(v[15].split()[3].replace("k",""))

rc = float(v[19].split()[3].replace("k",""))
re = float(v[20].split()[3].replace("k",""))

cb = float(v[23].split()[3].replace("uF",""))

rout = float(v[28].split()[3].replace("k",""))

co = float(v[31].split()[3].replace("uF",""))

print("R1 = ", r1)
print("R2 = ", r2)
print("Rc = ", rc)
print("Re = ", re)
print("Rout = ", rout)
print("Cin = ", ci)
print("Cb = ", cb)
print("Co = ", co)

f.close()

cost = r1 + r2 + rc+ re + rout + ci + cb + co + 0.2

merit = ma * (right-left) / (cost * left)

print("Merit figure: " + str(merit))

f = open("merit.tex", "w")
f.write('{:5.4f}'.format(merit))
f.close()

f = open("out.tex", "w")
f.write("Voltage gain & " + str(ma) + "\\\\ \n")
f.write("\hline \n")
f.write("Lower cutoff frequency & " + str(left) + "\\\\ \n")
f.write("\hline \n")
f.write("Bandwidth & " + str(right-left) + "\\\\ \n")
f.close()
