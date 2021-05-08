print("hello\n")

f = open("ngspice.log", "r")

v = f.readlines()

#print(v[57], v[58], v[59])

avg = float(v[57].split()[2])
ma = float(v[58].split()[4])
mi = float(v[59].split()[4])

print("Average: " + str(avg) + " V")
print("Ripple: " + str(ma-mi) + " V")

f.close()

f = open("t3.net", "r")

v = f.readlines()

r1 = float(v[31].split()[3].replace("k",""))
r3 = float(v[32].split()[3].replace("k",""))

c = float(v[63].split()[3].replace("uF",""))

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
f.write("C(pF) & " + str(c) + "\\\\ \n")
f.write("N & " + str(n_diodes) + "\\\\ \n")
f.close()

f = open("merit.tex", "w")
f.write(str(merit))
f.close()
