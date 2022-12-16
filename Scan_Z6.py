#Este código debe estar guardado en la carpeta del proyecto, donde está el main.c

import subprocess #Esta es la librería que corre micromegas, en general sirve para correr cualquíer comando en la terminal
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

#-------------------------------------------------------------------
#                          Constantes
#-------------------------------------------------------------------

v= 246.22

c= [-1,1] #Para generar números aleatorios negativos y positivos
d= [] #Para guardar las soluciones
solu= 0 #Para saber cuantos scans son viables

for i in range(0,1000000): #La cantidad de veces que se va a correr micromegas
	'''A veces micromegas no retorna valor de la densidad reliquia entonces es bueno incializarlo 
	en 0 para que en esos casos simplemente registre 0'''
	omega1=0.0 
	omega2=0.0
	
	#-------------------------------------------------------------------
	#                     Definición de parámetros
	#-------------------------------------------------------------------

	LA1= 0.5*(125**2)/(v**2)
	'''
	La siguiente manera de generar números aleatorios es para que el barrido sea más uniforme en todo el intervalo, 
	esto es especialmente útil si se manejan varios órdenes de magnitud. En este caso se está haciendo un barrido desde 1e-4 hasta 1,
	la fórmula general para cualquier intervalo sería:
	parámetro = 10**( (log10(COTA SUPERIOR)-log10(COTA INFERIOR)) * random.uniform(0,1)+log10(COTA INFERIOR) )
	si se quieren valores negativos y positivos se multiplica lo anterior por random.choice(c)
	'''
	LA2= 10**( (log10(1)-log10(1e-4)) * random.uniform(0,1)+log10(1e-4) ) #Debe ser mayor a 0
	LAL= random.choice(c) * 10**( (log10(3)-log10(1e-4)) * random.uniform(0,1)+log10(1e-4) ) #Puede tomar valores negativos
	
	LAS1= 10**( (log10(3)-log10(1e-4)) * random.uniform(0,1)+log10(1e-4) ) #Debe ser mayor a 0
	LAS2= 10**( (log10(3)-log10(1e-4)) * random.uniform(0,1)+log10(1e-4) ) #Debe ser mayor a 0
	LAS21= random.choice(c) * 10**( (log10(3)-log10(1e-1)) * random.uniform(0,1)+log10(1e-1) ) 

	
	LAS= random.choice(c) * 10**( (log10(3)-log10(1e-4)) * random.uniform(0,1)+log10(1e-4) ) 
	
	MS= 10**( (log10(350)-log10(70)) * random.uniform(0,1)+log10(70) )
	MH= 10**( (log10(2*MS)-log10(MS)) * random.uniform(0,1)+log10(MS) ) #Los candidatos del sector 2 deben cumplir M2 < 2M1 
	MHplus= 10**( (log10(2*MS)-log10(MH)) * random.uniform(0,1)+log10(MH) )
	
	if(abs(LAL) < 1):
		
		datapar['la2']= LA2
		datapar['laL']= LAL
		datapar['Mp1']= MS
		datapar['MHX']= MH
		datapar['MHC']= MHplus
		datapar['laphi']= LAS
		datapar['laSH1']= LAS1
		datapar['laSH2']= LAS2
		datapar['laS21']= LAS21

		#Se guarda los valores de los parámetros en el archivo que va a correr micromegas:
		writeinputf('data.dat',datapar) 
		#Se corre micromegas y se guarda lo que se imprime en la terminal en un archivo:
		subprocess.getoutput("./main data.dat > output.dat") 
		'''
		El main.c de micromegas se puede modificar para personalizar los textos que imprime,
		lo que yo hice fue agregar o modificar la palabra que va antes del valor que me interesa,
		de esta manera se puede buscar en el archivo esa palabra clave y decirle que me guarde el valor que le sigue.
		Acá por ejemplo lo estoy haciendo con las densidades reliquia. 
		'''
		aa= subprocess.getoutput("grep omega1 output.dat | awk -F'=' '{print $2}'")
		bb= subprocess.getoutput("grep omega2 output.dat | awk -F'=' '{print $2}'")
		omega1= float(aa)
		omega2= float(bb)
		
		omega= omega1 + omega2
		
		XX= subprocess.getoutput("grep 'Xv' output.dat | awk -F'=' '{print $1}'") #Esto es el filtro de XENON, si es 0 cumple, si es 1 no
		
		if(XX == 'Xv 0.0'): #Acá estoy guardando sólo los valores que cumplen con el filtro
			if ((omega > 0.11) and (omega < 0.13)): #Y también sólo los que cumplen con el rango requerido de densidad reliquia
				
				frac= omega1/omega2
				#Acá guardo las secciones eficaces:
				cc=subprocess.getoutput("grep 'proton1' output.dat | awk -F' ' '{print $4}'") 
				dd=subprocess.getoutput("grep 'proton2' output.dat | awk -F' ' '{print $4}'")
				#ee=subprocess.getoutput("grep 'DD:' output.dat | awk -F' ' '{print $2}'")
				#ff=subprocess.getoutput("grep 'h :   total width' output.dat | awk -F'=' '{print $2}'")
				#gg=subprocess.getoutput("grep 'b,B' output.dat | awk -F' ' '{print $1}'")
				
				sigmaSI1= float(cc)
				sigmaSI2= float(dd)
				#checkDD= ee #float(ee)
				#hTwidth= ff #float(ff)
				#hgg= gg #float(gg) 
				
				d.append([MH, MS, MHplus, omega1, omega2, omega, frac, sigmaSI1, sigmaSI2, LA2, LAL, LAS1, LAS2, LAS21, LAS]) # checkDD, hTwidth, hgg, 
				solu= solu + 1 

#-------------------------------------------------------------------
#                         Guardado de datos
#-------------------------------------------------------------------

print("Número de soluciones viables:", solu)
datos = asarray(d)
savetxt('3datos_Z6.txt', datos)

