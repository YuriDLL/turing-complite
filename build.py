import subprocess
import os
import sys

for dirs in os.walk(sys.argv[1]):
    for file_name in dirs[2]:
        asm_file_path = f'{dirs[0]}{file_name}'
        subprocess.run(f'customasm.exe {asm_file_path} -o temp -f annotated')
        with open('temp', 'r') as file:
            with open(f'out/{file_name}.txt', 'w') as out:
                for line in file.readlines():
                    segments = line.split('|')
                    data = segments[-1]
                    segments = data.split(';')
                    if len(segments) != 2:
                        continue
                    data = segments[0]
                    comment = segments[1]
                    segments = data.split(' ')
                    hex_data = ''
                    for segment in segments:
                        if len(segment) == 2:
                            hex_data += f'0x{segment} '
                    out.write(f'{hex_data}# {comment}')
        os.remove('temp')
