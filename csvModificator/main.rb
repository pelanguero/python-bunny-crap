
def pro(strrr)      
    retorno = []
    sss=strrr.split(",")
    sss.each_with_index do |item,indexx|
        retorno.push(item.to_i)

    end
    return retorno
end

def consol(str,op)
    
        arr = str.split(",")
        arr.each_with_index do |cont,indi|
            puts indi.to_s+" - "+cont
        end   
            if(op == 0)
            puts "Numero de las columbas que desea importar\n"
            elsif(op == 2)
            puts "Ingrese el orden de las colomnas \n"
            end
        eleColum = STDIN.gets
        return  pro(eleColum)

end

def verArray(indi,arr)
    arr.each do |x|
        if indi == x
            return true
        end        
    end
    return false         
end

columna=ARGV[1]
arch=IO.readlines(ARGV[0])
ultColum = arch[0].length() -1 
indi = []
cont=0
numcol=-1
aarch=File.new("test_"+ARGV[0],"w")
for linea in arch
    if cont==0 
        indi=consol(linea,0)        
    end
    arrey=linea.split(",")      
    arrey.each_with_index do |sub,indice|
        if verArray(indice,indi)
            aarch.syswrite(sub) 
            x = indi.length()-1        
            if indi[x] == indice 
                sub.delete!("\n")
            elsif indice!= x
                aarch.syswrite(",")
            end
        end
    end
    cont=cont+1
end
puts "Para ordenar el texto preciones 2\n"
inp = STDIN.gets
if(inp.to_i == 2)
  fila=[]
  arch2=IO.readlines("test_"+ARGV[0])
  fila = consol("test_"+ARGV[0],2)
  ordenado=File.new("ordenado_"+ARGV[0],"w")
end


exit()