#!/usr/bin/python3
# Recommended values for 33.3kbps
# SJW=1
# BTR0=2f,BTR1=7f
# SJW=4*tcl
# BTR0=ef,7f

# FROM CAN_INIT()
# _tq = 0.25
# calc_tseg1 = 0xc
# calc_tseg2 = 0x5
# calc_btr0 = round((((80000000*_tq)/2)-1)/1000000) - 1
# MY VALS
_tq = 1.200000025
calc_tseg1 = 0b1111
calc_tseg2 = 0b111
calc_btr0 = round((((80000000*_tq)/2)-1)/1000000) - 1

print(bin(calc_btr0))
print(bin(calc_tseg1))
print(bin(calc_tseg2))

# CALCULATOR TO CHECK BAUD RATE, set val=btr0
val = 0xef

# CALCULATE TQ given btr0
calc_tq = ((((((val & 0b00111111)) + 1)*1000000)+1)*2)/80000000
print(calc_tq)

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
freq0 = 80*1000000

t_clk = 1/freq0
scl_val = (32*btr0[5] + 16*btr0[4] + 8*btr0[3] + 4*btr0[2] + 2*btr0[1] + btr0[0] + 1)
t_scl = t_clk * scl_val * 2

# Print timing info
print("t_clk " + str(t_clk))
print("t_scl " + str(t_scl))

# Calculate nominal bit time from TSEG1/TSEG2
tseg1 = [1,1,1,1]
tseg2 = [1,1,1]
t_syncseg = 1
t_tseg1 =(8*tseg1[3] + 4*tseg1[2] + 2*tseg1[1] + tseg1[0] + 1)
t_tseg2 = (4*tseg2[2] + 2*tseg2[1] + tseg2[0] + 1)
t_bit = (t_syncseg + t_tseg1 + t_tseg2) * t_scl

bit_hz = 1/t_bit
print("bit_hz " + str(bit_hz))


