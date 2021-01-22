
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
    arrey.each_with_index do |sub,indice|
        if esta?(indices,indice)
            aarch.syswrite(sub)
            sx=indices.length()-1
            if indices[sx] == indice and not sub.end_with?("\n")
                aarch.syswrite("\n")
            elsif indice!= arrey.length() -1
                aarch.syswrite(",")
            end
        end
    end
    cont=cont+1
end
