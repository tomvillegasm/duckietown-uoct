#!/usr/bin/env python
#Indica a ROS ejecutar codigo con python

import rospy
#Importa los comandos de ROS
from std_msgs.msg import Empty, String
#Importa los tipos de dato a intercambiar (nada)
from time import sleep
#Para hacer delay

rospy.init_node('blink')
#Inicia el nodo y le pone nombre
pub = rospy.Publisher('/duckietown-uoct/stoplight/blink', Empty, queue_size=7)
#Estructura del tipo (nombre-de-topico,tipo-de-dato,cantidad-instrucciones-acumuladas)
#Aqui se crea el topico

while not rospy.is_shutdown():
#Establece como condicion ROS encendido
    print 'Toggle'
    pub.publish()
    #Publica un dato (nada)
    sleep(1)
