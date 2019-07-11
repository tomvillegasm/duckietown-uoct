#!/usr/bin/env python

import rospy #importar ros para python
from std_msgs.msg import String, Int32 # importar mensajes de ROS tipo String y tipo Int32
from geometry_msgs.msg import Twist # importar mensajes de ROS tipo geometry / Twist
from sensor_msgs.msg import Image # importar mensajes de ROS tipo Image
import cv2 # importar libreria opencv
from cv_bridge import CvBridge # importar convertidor de formato de imagenes
import numpy as np # importar libreria numpy


class Template(object):
	def __init__(self, args):
		super(Template, self).__init__()
		self.args = args
		self.sub = rospy.Subscriber("/duckiebot/camera_node/image/raw", Image, self.pato_filtro)
		self.pub = rospy.Publisher("duckiebot/imagen_pato", Image,  queue_size=1)
		self.bridge = CvBridge()
	
	def pato_filtro(self,msg):
		# Cambiar espacio de color
		image = self.bridge.imgmsg_to_cv2(msg,"bgr8")
		img_out = cv2.cvtColor(image, cv2.COLOR_BGR2HSV)

		# Filtrar rango util
		msk = cv2.inRange(image_out,np.array([10,140,140]),np.array([60,255,255]))
		img_out = cv2.bitwise_and(image_out,image_out,mask=mask)

		# Aplicar mascara
		kernel = np.ones((5,5), np.uint8)
		img_out = cv2.erode(img_out, kernel, iterations = 1)
#		img_out = cv2.dilate(img_out, kernel, iterations = 1)

		# Definir blobs
		contours, hierarchy = cv2.findContourns(mask, cv2.RETR_TREE, cv2.CHAIN_APPROX_SIMPLE)
		x1,y1,x2,y2 = cv2.boundingRect(contours)
		cv2.rectangle(img_out, (x1,y1),(x2,y2),(0,0,0),2)

		# Publicar imagen final
		msg = bridge.cv2_to_imgmsg(img_out,"bgr8")
#		img_out = cv2.cvtColor(img_out, cv2.COLOR_HSV2BGR)
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
	rospy.init_node('test') #creacion y registro del nodo!

	obj = Template('args') # Crea un objeto del tipo Template, cuya definicion se encuentra arriba

	#objeto.publicar() #llama al metodo publicar del objeto obj de tipo Template

	rospy.spin() #funcion de ROS que evita que el programa termine -  se debe usar en  Subscribers


if __name__ =='__main__':
	main()
