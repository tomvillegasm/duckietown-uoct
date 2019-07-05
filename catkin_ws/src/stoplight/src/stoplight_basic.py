#!/usr/bin/env python

# Importa elementos ROS para que python sepa a donde dirigir los comandos
import rospy
# Importa desde el elemento mensaje el tipo de mensaje a intercambiar (texto, numero, nada)
from std_msgs.msg import Empty, String, Int16
# Esto es para detener el codigo en cantidad de segundos
from time import sleep

# Requerido siempre, le dice a ROS que esto es un nodo y que lo trate como tal.
rospy.init_node('traffic_master')
# Establece el topico al cual enviara mensajes
pub = rospy.Publisher('uoct/stoplight/master', Int16, queue_size=7)

# Clave de comunicacion de colores: RGB == 012

# Mientras ROS este vivo (roscore), esto se ejecuta
while not rospy.is_shutdown():
    pub.publish(1)
    sleep(5)
    pub.publish(0)
    sleep(5)
