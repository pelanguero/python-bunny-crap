from PyPDF2 import PdfFileReader
from PyPDF2.pdf import Destination
with open("JavaScript The Definitive Guide Master the Worlds Most-Used Programming Language by David Flanagan (z-lib.org).pdf", "rb") as arc:
    pdf = PdfFileReader(arc)
    inf = open("info.txt", "w")
    info = pdf.getDocumentInfo()
    inf.write("titulo"+info.title+"\n")
    inf.write("autor"+info.author+"\n")
    inf.write("Tema"+info.subject+"\n")
    bookm = pdf.outlines
    bur = type(bookm[0]) is list
    print(bur)
    inf.close()
