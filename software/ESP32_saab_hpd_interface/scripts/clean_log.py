#!/usr/bin/python3
import sys
import os

filename = sys.argv[1]
filehandle = open(filename)

trimmed_lines = []

raw_icm_only = True
no_headers = True
to_ascii = True

for line in filehandle:
    # Check line is empty
    if(line.strip() != "SID:;" and line.strip() != "ICM:;"):
        # Check line contains exactly one SID or ICM string
        if(line.count("SID") == 1 or line.count("ICM") == 1):
            if(raw_icm_only):
                if(line.count("ICM") == 1):
                    if(not no_headers):
                        trimmed_lines.append(line.strip())    
                    else:
                        txt = line.strip()
                        txt = txt.replace("ICM:","")
                        txt = txt.replace(",;","")
                        txtsplit = txt.split(",")
                        if(not to_ascii):
                            result = ",".join(txtsplit[1:-1])
                            trimmed_lines.append(result)
                        else:
                            asciis = [chr(int(x,16)) for x in txtsplit[1:-1]]
                            result = ",".join(asciis)
                            trimmed_lines.append(result)
            else:
                trimmed_lines.append(line.strip())

#print("\n".join(trimmed_lines))

# Save to output file
if(raw_icm_only):
    if(not no_headers):
        outfilename = filename.replace(".log",".trimmed.icmonly.log")
    else:
        if(not to_ascii):
            outfilename = filename.replace(".log",".trimmed.noheaders.log")
        else:
            outfilename = filename.replace(".log",".trimmed.ascii.log")
else:   
    outfilename = filename.replace(".log",".trimmed.log")

outf = open(outfilename,'w')
outf.write("\n".join(trimmed_lines))