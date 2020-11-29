import ftputil
from dotenv import load_dotenv
import string
import datetime
import os
#
#mira la lista de archivos y los descarga recursivamente
def descargarCarpeta(nombre,hst):
    os.mkdir(nombre)
    os.chdir(nombre)
    hst.chdir(nombre)
    lista=hst._dir("./")
    for s in lista:
        #https://docs.nersc.gov/filesystems/unix-file-permissions/
        if s.find("d")==0 :
             nnombre=s.find(":")
             print("Creando y descargando Carpeta "+s[nnombre+4:])
             descargarCarpeta(s[nnombre+4:],hst)
        else:
            nnombre=s.find(":")
            print("Descargando Archivo "+s[nnombre+4:]+"...")
            hst.download(s[nnombre+4:],s[nnombre+4:])
            print("...se descargo "+s[nnombre+4:])
    
    os.chdir("../")
    hst.chdir("../")

load_dotenv(verbose=True)
host = ftputil.FTPHost(os.getenv("IP"), os.getenv("USUARIO"), os.getenv("CONTRASENA"))
hoy=datetime.date.today().strftime("%d-%m del %y")
os.chdir(os.getenv("DESTINO"))
os.mkdir(hoy)
os.chdir(hoy)
descargarCarpeta(os.getenv("MUNDO"),host)
#esto solo sirve si se tiene rar agregado al path de lo contrario se putea
os.system("rar a "+os.getenv("MUNDO")+".zip "+os.getenv("MUNDO"))
host.close()