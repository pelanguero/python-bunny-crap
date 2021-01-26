
def pro(strrr)
    retorno=[]
    sss=strrr.split(",")
    sss.each_with_index do |item,indexx|
       retorno.push(item.to_i)
    end
    return retorno
end
def listarlineas(linia)
    ss=linia.split(",")
    ss.each_with_index do |item,indxx|
        puts indxx.to_s+". "+item
    end
end
def esta?(arrray,descar)
    for elemet in arrray
        if elemet==descar
            return true
        end
    end
    return false 
end
def mayor(arreglo,final)
    returno=0 
    arreglo.each_with_index do |ele,idn|
        if idn==0 
            retorno=ele
        elsif ele>retorno and not ele==final
            retorno=ele
        end
    end
end
indices=[]
columna=ARGV[1]
arch=IO.readlines(ARGV[0])
cont=0
numcol=-1
aarch=File.new(ARGV[0]+"proc","w")
for linea in arch
    if cont==0
        listarlineas(linea)
        opcion=STDIN.gets
        indices=pro(opcion)
    end
    arrey=linea.split(",")
    cos=0
    while cos<indices.length() do 
        if arrey[indices[cos]].end_with?("\n")
            subss=arrey[indices[cos]]
            ind=arrey[indices[cos]].length()
            aarch.syswrite(subss[0,ind-2])
        else
            aarch.syswrite(arrey[indices[cos]])
        end
        if cos==indices.length()-1
            aarch.syswrite("\n")
        else
            aarch.syswrite(",")
        end
        cos=cos+1
    end
    cont=cont+1
end
