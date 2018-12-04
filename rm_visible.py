with open("script.sql",'r') as reader, open('temp.sql','w') as writer:
    for line in reader:
        line = line.replace(" VISIBLE","")
        writer.write(line)
    reader.close()
    writer.close()
import os
os.remove('script.sql')
os.rename('temp.sql','script.sql')
