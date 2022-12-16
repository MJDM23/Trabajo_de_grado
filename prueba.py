import subprocess
import sys
import decimal
import cmath
from numpy import *

def writeinputf(file,dictionary):
    data1 = open(file,'w')
    for items in dictionary.items():
        data1.write("%s %s\n" % items)

    data1.close()

datapar= {"la2":0.01, "laL":0.2, "Mp1":200, "MHX":0.1, "MHC":0.1, "laphi": 0.1, "laSH1": 0.1, "laSH2": 0.1, "laS21": 0.1} 

LA2= 0.0
LAL= 0.1
MS= 0.0
MH= 0.0
MHplus= 0.0 
LAS= 0.0
LAS1= 0.1
LAS2= 0.0 #la6
LAS21= 0.0 #la7


def float_range(start, stop, step):
	while start < stop:
		yield float(start)
		start += decimal.Decimal(step)

M11= list(float_range(1, 30, '0.3'))
M12= list(float_range(30, 100, '0.1'))
M13= list(float_range(100, 1000, '0.3'))


d= []

datapar['la2']= LA2
datapar['laL']= LAL
datapar['laphi']= LAS
datapar['laSH1']= LAS1
datapar['laSH2']= LAS2
datapar['laS21']= LAS21

for i in range(len(M11)):
	omega1= 0
	omega2= 0
	
	MS= M11[i]
	MH= 1.6 * MS
	MHplus= 1.1 * MH

	datapar['Mp1']= MS
	datapar['MHX']= MH
	datapar['MHC']= MHplus
	
	writeinputf('data.dat',datapar)
	
	writeinputf('data.dat',datapar)
	subprocess.getoutput("./main data.dat > output.dat") 
	aa= subprocess.getoutput("grep omega1 output.dat | awk -F'=' '{print $2}'")
	bb= subprocess.getoutput("grep omega2 output.dat | awk -F'=' '{print $2}'")
	omega1= float(aa)
	omega2= float(bb)
	
	omega= omega1 + omega2
	
	d.append([MS, omega2, MH, omega1]) 

for i in range(len(M12)):
	omega1= 0
	omega2= 0
	
	MS= M12[i]
	MH= 1.6 * MS
	MHplus= 1.1 * MH

	datapar['Mp1']= MS
	datapar['MHX']= MH
	datapar['MHC']= MHplus
	
	writeinputf('data.dat',datapar)
	
	writeinputf('data.dat',datapar)
	subprocess.getoutput("./main data.dat > output.dat") 
	aa= subprocess.getoutput("grep omega1 output.dat | awk -F'=' '{print $2}'")
	bb= subprocess.getoutput("grep omega2 output.dat | awk -F'=' '{print $2}'")
	omega1= float(aa)
	omega2= float(bb)
	
	omega= omega1 + omega2
	
	d.append([MS, omega2, MH, omega1]) 

for i in range(len(M13)):
	omega1= 0
	omega2= 0
	
	MS= M13[i]
	MH= 1.6 * MS
	MHplus= 1.1 * MH

	datapar['Mp1']= MS
	datapar['MHX']= MH
	datapar['MHC']= MHplus
	
	writeinputf('data.dat',datapar)
	
	writeinputf('data.dat',datapar)
	subprocess.getoutput("./main data.dat > output.dat") 
	aa= subprocess.getoutput("grep omega1 output.dat | awk -F'=' '{print $2}'")
	bb= subprocess.getoutput("grep omega2 output.dat | awk -F'=' '{print $2}'")
	omega1= float(aa)
	omega2= float(bb)
	
	omega= omega1 + omega2
	
	d.append([MS, omega2, MH, omega1]) 
          
datos = asarray(d)
savetxt('datosb0.txt',datos)
