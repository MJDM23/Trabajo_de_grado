import subprocess 
import sys
import decimal
import cmath
from numpy import *

#-------------------------------------------------------------------
#         Inicialización librería de parámetros libres
#-------------------------------------------------------------------

def writeinputf(file,dictionary):
    data1 = open(file,'w')
    for items in dictionary.items():
        data1.write("%s %s\n" % items)

    data1.close()

datapar= {"la2":0.01, "laL":0.2, "Mp1":200, "MHX":0.1, "MHC":0.1, "laphi": 0.1, "laSH1": 0.1, "laSH2": 0.1, "laS21": 0.1} 

S, T, Mh, Ms, Mhplus, omega1, omega2, omega, frac, sigmaSI1, sigmaSI2, la2, laL, laS1, laS2, laS21, laS= loadtxt("ST_2sigmaFiltro.txt", unpack= True)

#-------------------------------------------------------------------
#                          Constantes
#-------------------------------------------------------------------

v= 246.22

c= [-1,1]	
d= []
solu= 0

for i in range(len(Mh)):
	omega1=0.0
	omega2=0.0
	
	#-------------------------------------------------------------------
	#                     Definición de parámetros
	#-------------------------------------------------------------------
	
	LA1= 0.5*(125**2)/(v**2)
	LA2= la2[i]
	LAL= laL[i]
	
	LAS1= laS1[i]
	LAS2= laS2[i]
	LAS21= laS21[i]

	
	LAS= laS[i]
	
	MS= Ms[i]
	MH= Mh[i]
	MHplus= Mhplus[i]

	datapar['la2']= LA2
	datapar['laL']= LAL
	datapar['Mp1']= MS
	datapar['MHX']= MH
	datapar['MHC']= MHplus
	datapar['laphi']= LAS
	datapar['laSH1']= LAS1
	datapar['laSH2']= LAS2
	datapar['laS21']= LAS21

	
	writeinputf('data.dat',datapar)
	subprocess.getoutput("./main data.dat > output.dat") 
	cc=subprocess.getoutput("grep 'neutron1' output.dat | awk -F' ' '{print $3}'")
	dd=subprocess.getoutput("grep 'neutron2' output.dat | awk -F' ' '{print $3}'")

	sigmaSI1_N= float(cc)
	sigmaSI2_N= float(dd)
	
	d.append([sigmaSI1_N, sigmaSI2_N])
	solu= solu + 1

#-------------------------------------------------------------------
#                         Guardado de datos
#-------------------------------------------------------------------

print("Número de soluciones viables:", solu)
datos = asarray(d)
savetxt('sigmas_neutrones.txt', datos)

