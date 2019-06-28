#!/usr/bin/env python

import rospy #importar ros para python
from std_msgs.msg import String, Int32 # importar mensajes de ROS tipo String y tipo Int32
from sensor_msgs.msg import Image # importar mensajes de ROS tipo Image
import cv2 # importar libreria opencv
from cv_bridge import CvBridge # importar convertidor de formato de imagenes

class Template(object):

    def __init__(self, args):
		super(Template, self).__init__()
		self.args = args
        # Suscribe a la imagen pura de la camara
		self.sub_raw=rospy.Subscriber("usb_cam/image_raw", Image, self.contrast)
        # Publica una imagen con balance de blancos
		self.pub_eq=rospy.Publisher("usb_cam/image_raw/white_balance", Image, queue_size=10)

    # Procesa las imagenes para mejorar el contraste de blancos
    def contrast(self,msg):
        bridge = CvBridge()
        # Convierte la imagen desde BGR
        img = bridge.imgmsg_to_cv2(msg,"bgr8")
        # Separa la imagen en sus canales de color BGR (RGB)
        blue_channel,green_channel,red_channel = cv2.split(img)
        # Se aplica el ajuste de contraste a cada canal de color
        b = cv2.equalizeHist(blue_channel)
        g = cv2.equalizeHist(green_channel)
        r = cv2.equalizeHist(red_channel)
        # Se juntan todos los canales de regreso a una sola imagen
        img_new = cv2.merge( (b,g,r) )
        # Reconvierte la imagen a BGR
        img_eq = bridge.cv2_to_imgmsg(img_new,"bgr8")
        # Se publica la imagen con balance de blancos
        self.pub_eq.publish(img_eq)

def main():
	rospy.init_node('white_balance') #creacion y registro del nodo!

	obj = Template('args') # Crea un objeto del tipo Template, cuya definicion se encuentra arriba

	#objeto.publicar() #llama al metodo publicar del objeto obj de tipo Template

	rospy.spin() #funcion de ROS que evita que el programa termine -  se debe usar en  Subscribers


if __name__ =='__main__':
	main()
