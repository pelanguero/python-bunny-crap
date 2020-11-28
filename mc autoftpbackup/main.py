import ftputil
from dotenv import load_dotenv
import string
from zipfile import ZipFile
import os


def descargarCarpeta(nombre,hst):
    os.mkdir(nombre)
    os.chdir(nombre)
    carp="drwxrwx"
    arch="-rwxrwx"
    hst.chdir(nombre)
    lista=hst._dir("./")
    for s in lista:
        if s.find("d")==0 :
             nnombre=s.find(":")
             print("Carpeta "+s[nnombre+4:])
             descargarCarpeta(s[nnombre+4:],hst)
        else:
            nnombre=s.find(":")
            print("Archivo "+s[nnombre+4:])
            host.download(s[nnombre+4:],s[nnombre+4:])
    
    os.chdir("../")
    hst.chdir("../")

load_dotenv(verbose=True)
host = ftputil.FTPHost(os.getenv("IP"), os.getenv("USUARIO"), os.getenv("CONTRASENA"))
pro=host._dir("./lilUganda/")
descargarCarpeta(os.getenv("MUNDO"),host)
host.close()