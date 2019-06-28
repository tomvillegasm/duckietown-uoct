#!/usr/bin/env python

import rospy #importar ros para python
from std_msgs.msg import String, Int32 # importar mensajes de ROS tipo String y tipo Int32
from geometry_msgs.msg import Twist # importar mensajes de ROS tipo geometry / Twist
from sensor_msgs.msg import Image # importar mensajes de ROS tipo Image
import cv2 # importar libreria opencv
from cv_bridge import CvBridge # importar convertidor de formato de imagenes
import numpy as np # importar libreria numpy
from geometry_msgs.msg import Point


class Template(object):
	def __init__(self, args):
		super(Template, self).__init__()
		self.args = args
		self.sub = rospy.Subscriber("/duckiebot/camera_node/image/rect", Image, self.pato_filtro)
		self.pub = rospy.Publisher("duckiebot/imagen_pato", Image,  queue_size=1)
		self.pub2 = rospy.Publisher("duckiebot/punto_pato", Point, queue_size=1)
		#self.pub_freno = rospy.Publisher("duckiebot/
		self.bridge = CvBridge()
	
	def pato_filtro(self,msg):
		image = self.bridge.imgmsg_to_cv2(msg,"bgr8")
		img_out = cv2.cvtColor(image, cv2.COLOR_BGR2HSV)
		msk = cv2.inRange(img_out,np.array([12,175,175]),np.array([50,255,255]))
	#	msk = cv2.inRange(img_out,np.array([20,100,100]),np.array([30,255,255]))		
		img_out = cv2.bitwise_and(img_out,img_out,mask=msk)
		kernel1= np.ones((3,3), np.uint8)
		kernel2 = np.ones((5,5), np.uint8)

		img_out = cv2.erode(img_out, kernel1, iterations = 1)
		img_out = cv2.dilate(img_out, kernel2, iterations = 1)

		_, contours, hierarchy = cv2.findContours(msk, cv2.RETR_TREE, cv2.CHAIN_APPROX_SIMPLE)
		img_final = image
#		img_final = img_out
		for i in contours:
			x,y,w,h = cv2.boundingRect(i)
			if (w > 8 and h > 8):
				if (w-h<8 and h-w<6):
					cv2.rectangle(img_final, (x,y),(x+w,y+h),(255,255,255),2)
					d = (120.0*3)/h
					punto = Point()
					punto.x = x+(w/2)
					punto.y = y+(h/2)
					punto.z = d
					self.pub2.publish(punto)
			# self.pub3.publish
					

		img_out = cv2.cvtColor(img_final, cv2.COLOR_HSV2BGR)
		msg = self.bridge.cv2_to_imgmsg(img_final,"bgr8")
		self.pub.publish(msg)
		

		
	#def publicar(self):

	#def callback(self,msg):

	#def procesar_img(self, img):
		# Cambiar espacio de color

		# Filtrar rango util

		# Aplicar mascara

		# Aplicar transformaciones morfologicas

		# Definir blobs

		# Dibujar rectangulos de cada blob

		# Publicar imagen final


def main():
	rospy.init_node('test2') #creacion y registro del nodo!

	obj = Template('args') # Crea un objeto del tipo Template, cuya definicion se encuentra arriba

	#objeto.publicar() #llama al metodo publicar del objeto obj de tipo Template

	rospy.spin() #funcion de ROS que evita que el programa termine -  se debe usar en  Subscribers


if __name__ =='__main__':
	main()
