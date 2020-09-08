#!/usr/bin/python3
val = 0x2f

# Calc binary
valBin = bin(val & 0b00111111)[::-1]
btr0 = [0,0,0,0,0,0]

ind = 0
for c in valBin:
	if c != "b":
		btr0[ind] = int(c)
		ind+=1
		#print(c)
	else:
		break

print(val)
print(btr0[::-1])
# Stuff
freq0 = 20*1000000

t_clk = 1/freq0
scl_val = (32*btr0[5] + 16*btr0[4] + 8*btr0[3] + 4*btr0[2] + 2*btr0[1] + btr0[0] + 1)
t_scl = t_clk * scl_val

print(scl_val)
print(scl_val | 0b01000000)

bitFreq = 1/(t_scl)

print("t_clk " + str(t_clk))
print("t_scl " + str(t_scl))
print("bit freq " + str(bitFreq))
