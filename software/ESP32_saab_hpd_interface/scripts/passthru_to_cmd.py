#!/usr/bin/python3
# Converts a passthru log (usually from a screen session)
# passhtur log must be of icmonly type
# Into a cmd_log style log (data only)
#!/usr/bin/python3
import sys
import os

filename = sys.argv[1]
filehandle = open(filename)

trimmed_lines = []

for line in filehandle:
    # Check line is empty
    if(line.strip() != "SID:;" and line.strip() != "ICM:;"):
        rawText = line.strip().lstrip()
        rawText = rawText.replace("ICM:","")
        rawText = rawText.replace(",;","")
        
        splitText = rawText.split(",")
        # Convert to hex chars
        hexText = [hex(int(x,16)) for x in splitText]
        # Remove first and last
        result = ",".join(hexText[1:-1])
        trimmed_lines.append(result)
                        

#print("\n".join(trimmed_lines))

# Save to output file
outfilename = filename.replace(".trimmed.icmonly","")
outfilename = outfilename.replace("passthru_","cmds_")

outf = open(outfilename,'w')
outf.write("\n".join(trimmed_lines))

