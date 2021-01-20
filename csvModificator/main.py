import sys


def pro(strrr, buscarr):
    sss = str.split(strrr, ",")
    for item in sss:
        if item == buscarr:
            return sss.index(item)


columna = sys.argv[2]
arch = open(sys.argv[1], "r")
cont = 0
numcol = -1
aarch = open(sys.argv[1]+"pros", 'w')
for line in arch:
    if cont == 0:
        numcol = pro(line, columna)

    conter = 0
    arrey = str.split(line, ",")
    while conter < len(arrey):
        if conter != numcol:
            if str.endswith(arrey[conter], "\n"):
                aarch.write(arrey[conter])
            else:
                aarch.write(arrey[conter]+",")
        conter = conter+1
    cont = cont+1


aarch.close()
arch.close()
