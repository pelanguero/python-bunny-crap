
def pro(strrr,buscarr)
    sss=strrr.split(",")
    sss.each_with_index do |item,indexx|
        if item.eql?(buscarr)
            return indexx
        end
    end
end

columna=ARGV[1]
arch=IO.readlines(ARGV[0])
cont=0
numcol=-1
aarch=File.new(ARGV[0]+"proc","w")
for linea in arch
    if cont==0 
        numcol=pro(linea,columna)
    end
    arrey=linea.split(",")
    arrey.each_with_index do |sub,indice|
        if numcol!=indice 
            if sub.end_with?("\n")
                aarch.syswrite(sub)
            else
                aarch.syswrite(sub+",")
            end
        end
    end
    cont=cont+1
end
