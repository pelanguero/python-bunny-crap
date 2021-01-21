import sys


def pro(strrr):
    indicess = []
    sss = str.split(strrr, ",")
    for item in sss:
        indicess.append(int(item))
    return indicess


def listarColumnas(columnas):
    arreycolumns = str.split(columnas, ",")
    for item in arreycolumns:
        print(str(arreycolumns.index(item))+". "+item)


arch = open(sys.argv[1], "r")
cont = 0
numcol = -1
aarch = open(sys.argv[1]+"pros", 'w')
indices = {}
for line in arch:
    if cont == 0:
        #numcol = pro(line, columna)
        listarColumnas(line)
        inptt = input(
            "Ingrese el numero correspondiente a las columnas que quiere eliminar separado por comas:\n")
        indices = pro(inptt)

    cont = cont+1
    conter = 0
    arrey = str.split(line, ",")
    while conter < len(arrey):
        if conter not in indices:
            aarch.write(arrey[conter])
            if conter == len(arrey)-2 and len(arrey)-1 in indices:
                aarch.write("\n")
            elif conter != len(arrey)-1:
                aarch.write(",")
        conter = conter+1


aarch.close()
arch.close()
