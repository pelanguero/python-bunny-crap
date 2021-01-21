import sys


def pro(strrr, buscarr):
    sss = str.split(strrr, ",")
    for item in sss:
        if item == buscarr or item == buscarr+"\n":
            return sss.index(item)


def listarColumnas(columnas):
    arreycolumns = str.split(columnas, ",")
    for item in arreycolumns:
        print(str(arreycolumns.index(item))+". "+item)


columna = sys.argv[2]
arch = open(sys.argv[1], "r")
cont = 0
numcol = -1
aarch = open(sys.argv[1]+"pros", 'w')
for line in arch:
    if cont == 0:
        numcol = pro(line, columna)
        listarColumnas(line)
    cont = cont+1
    conter = 0
    arrey = str.split(line, ",")
    while conter < len(arrey):
        if conter != numcol:
            aarch.write(arrey[conter])
            if conter == len(arrey)-2 and numcol == len(arrey)-1:
                aarch.write("\n")
            elif conter != len(arrey)-1:
                aarch.write(",")
        conter = conter+1


aarch.close()
arch.close()
